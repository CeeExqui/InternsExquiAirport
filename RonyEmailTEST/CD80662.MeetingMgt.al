codeunit 80552 "Meeting Management"
{
    Subtype = Normal;

    procedure SendMeetingInvitation(var Meeting: Record "Customer Meeting"): Boolean
    var
        Cust: Record Customer;
        EmailMsg: Codeunit "Email Message";
        Email: Codeunit Email;
        Body: Text;
        SubjectTxt: Text;
        Recipients: List of [Text];
    begin
        // Validate input
        if Meeting."Customer No." = '' then begin
            Message('Please specify a customer number.');
            exit(false);
        end;

        if not Cust.Get(Meeting."Customer No.") then begin
            Message('Customer %1 not found.', Meeting."Customer No.");
            exit(false);
        end;

        if Cust."E-Mail" = '' then begin
            Message('Customer %1 has no email address.', Cust.Name);
            exit(false);
        end;

        // Check if email accounts are configured
        if not CheckEmailAccountsExist() then begin
            Message('No email accounts are configured. Please set up email accounts in Business Central first.');
            exit(false);
        end;

        // Validate meeting data
        if Meeting.Subject = '' then begin
            Message('Please specify a meeting subject.');
            exit(false);
        end;

        if Meeting."Meeting Date" = 0D then begin
            Message('Please specify a meeting date.');
            exit(false);
        end;

        // Prepare email subject and body with error handling
        SubjectTxt := StrSubstNo('Meeting Invitation: %1', Meeting.Subject);

        Body := StrSubstNo(
            'Dear %1,<br><br>' +
            'This is to confirm our meeting scheduled on <b>%2</b> from <b>%3</b> to <b>%4</b>.<br>' +
            'Location: %5<br><br>' +
            '%6<br><br>' +
            'Best regards,<br>Your Company Team',
            Cust.Name,
            Format(Meeting."Meeting Date", 0, '<Day,2>/<Month,2>/<Year4>'),
            Format(Meeting."Start Time", 0, '<Hours24,2>:<Minutes,2>'),
            Format(Meeting."End Time", 0, '<Hours24,2>:<Minutes,2>'),
            Meeting.Location,
            Meeting.Message
        );

        // Try to send email with error handling
        if not TrySendEmail(Recipients, Cust."E-Mail", SubjectTxt, Body, EmailMsg, Email) then begin
            Message('Failed to send email to %1. Please check your email configuration and try again.', Cust."E-Mail");
            exit(false);
        end;

        // Update record only if email was sent successfully
        Meeting."Email Sent" := true;
        Meeting."Email Sent Date" := Today;
        if Meeting.Modify(true) then
            Message('Meeting invitation sent successfully to %1.', Cust."E-Mail")
        else
            Message('Email was sent but failed to update the record.');

        exit(true);
    end;

    [TryFunction]
    local procedure TrySendEmail(var Recipients: List of [Text]; EmailAddress: Text; Subject: Text; Body: Text; var EmailMsg: Codeunit "Email Message"; var Email: Codeunit Email)
    var
        EmailAccount: Record "Email Account";
        EmailAccountCU: Codeunit "Email Account";
    begin
        // Clear and add recipient
        clear(Recipients);
        Recipients.Add(EmailAddress);

        // Create email message
        EmailMsg.Create(
            Recipients,
            Subject,
            Body,
            true // Is HTML
        );

        // Try to get the first available email account
        EmailAccountCU.GetAllAccounts(false, EmailAccount);
        if EmailAccount.FindFirst() then begin
            // Send with specific account to avoid the GetEmailAccount error
            Email.Send(EmailMsg, EmailAccount."Account Id", EmailAccount.Connector);
        end else begin
            // Fallback to default send method if no specific account found
            Email.Send(EmailMsg);
        end;
    end;

    local procedure CheckEmailAccountsExist(): Boolean
    var
        EmailAccount: Record "Email Account";
        EmailAccountCU: Codeunit "Email Account";
    begin
        EmailAccountCU.GetAllAccounts(false, EmailAccount);
        exit(not EmailAccount.IsEmpty());
    end;


}
