page 80581 "Email Setup Helper"
{
    PageType = Card;
    Caption = 'Email Setup Helper';
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group("Email Configuration")
            {
                Caption = 'Email Configuration Status';

                field(EmailAccountsConfigured; EmailAccountsConfiguredTxt)
                {
                    ApplicationArea = All;
                    Caption = 'Email Accounts Status';
                    Editable = false;
                    Style = Attention;
                    StyleExpr = not EmailAccountsExist;
                }

                field(Instructions; InstructionsTxt)
                {
                    ApplicationArea = All;
                    Caption = 'Setup Instructions';
                    Editable = false;
                    MultiLine = true;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenEmailAccounts)
            {
                Caption = 'Open Email Accounts';
                Image = Email;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Page.Run(Page::"Email Accounts");
                end;
            }

            action(TestEmail)
            {
                Caption = 'Test Email Configuration';
                Image = TestFile;
                ApplicationArea = All;
                Enabled = EmailAccountsExist;

                trigger OnAction()
                begin
                    TestEmailConfiguration();
                end;
            }

            action(RefreshStatus)
            {
                Caption = 'Refresh Status';
                Image = Refresh;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    CheckEmailConfiguration();
                    CurrPage.Update();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        CheckEmailConfiguration();
    end;

    local procedure CheckEmailConfiguration()
    var
        EmailAccount: Record "Email Account";
        EmailAccountCU: Codeunit "Email Account";
    begin
        EmailAccountCU.GetAllAccounts(false, EmailAccount);
        EmailAccountsExist := not EmailAccount.IsEmpty();

        if EmailAccountsExist then begin
            EmailAccountsConfiguredTxt := 'Email accounts are configured ✓';
            InstructionsTxt := 'Email accounts are properly configured. You can now send meeting invitations.';
        end else begin
            EmailAccountsConfiguredTxt := 'No email accounts configured ✗';
            InstructionsTxt := 'To send emails, you need to configure at least one email account:' +
                              '\1. Click "Open Email Accounts" button above' +
                              '\2. Click "Add an account" and follow the setup wizard' +
                              '\3. Configure SMTP, Exchange, or other email connector' +
                              '\4. Test the configuration' +
                              '\5. Return here and click "Refresh Status"';
        end;
    end;

    local procedure TestEmailConfiguration()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Recipients: List of [Text];
        TestBody: Text;
        UserEmail: Text;
        CurrentUser: Record User;
    begin
        if CurrentUser.Get(UserSecurityId()) then
            UserEmail := CurrentUser."Contact Email"
        else
            UserEmail := 'test@example.com';

        Recipients.Add(UserEmail);

        TestBody := 'This is a test email from Business Central.<br><br>' +
                   'If you receive this email, your email configuration is working correctly.<br><br>' +
                   'Sent on: ' + Format(CurrentDateTime()) + '<br>' +
                   'From: Business Central Meeting Management System';

        EmailMessage.Create(Recipients, 'Test Email - Business Central Configuration', TestBody, true);

        if Email.Send(EmailMessage) then
            Message('Test email sent successfully to %1', UserEmail)
        else
            Message('Failed to send test email. Please check your email account configuration.');
    end;

    var
        EmailAccountsExist: Boolean;
        EmailAccountsConfiguredTxt: Text;
        InstructionsTxt: Text;
}