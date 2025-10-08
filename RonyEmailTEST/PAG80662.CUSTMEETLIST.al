page 80580 "Customer Meeting List"
{
    PageType = List;
    SourceTable = "Customer Meeting";
    Caption = 'Customer Meeting List';
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Customer Meeting Card";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field("Customer No."; Rec."Customer No.") { ApplicationArea = All; }
                field("Customer Name"; Rec."Customer Name") { ApplicationArea = All; }
                field("Subject"; Rec.Subject) { ApplicationArea = All; }
                field("Meeting Date"; Rec."Meeting Date") { ApplicationArea = All; }
                field("Start Time"; Rec."Start Time") { ApplicationArea = All; }
                field("End Time"; Rec."End Time") { ApplicationArea = All; }
                field("Location"; Rec."Location") { ApplicationArea = All; }
                field("Email Sent"; Rec."Email Sent") { ApplicationArea = All; }
                field("Email Sent Date"; Rec."Email Sent Date") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SendInvitation)
            {
                Caption = 'Send Invitation';
                Image = Email;
                ApplicationArea = All;
                Enabled = not Rec."Email Sent";

                trigger OnAction()
                var
                    MeetingMgt: Codeunit "Meeting Management";
                begin
                    if Confirm('Do you want to send the meeting invitation for %1?', true, Rec.Subject) then
                        MeetingMgt.SendMeetingInvitation(Rec);
                end;
            }
        }
    }
}