page 80551 "Customer Meeting Card"
{
    PageType = Card;
    SourceTable = "Customer Meeting";
    Caption = 'Customer Meeting Scheduler';
    ApplicationArea = All;
    UsageCategory = Tasks;

    layout
    {
        area(Content)
        {
            group("Meeting Details")
            {
                field("Customer No."; Rec."Customer No.") { ApplicationArea = All; }
                field("Customer Name"; Rec."Customer Name") { ApplicationArea = All; Editable = false; }
                field("Subject"; Rec.Subject) { ApplicationArea = All; }
                field("Meeting Date"; Rec."Meeting Date") { ApplicationArea = All; }
                field("Start Time"; Rec."Start Time") { ApplicationArea = All; }
                field("End Time"; Rec."End Time") { ApplicationArea = All; }
                field("Location"; Rec."Location") { ApplicationArea = All; }
                field("Message"; Rec."Message")
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field("Email Sent"; Rec."Email Sent")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Email Sent Date"; Rec."Email Sent Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
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
                    if Confirm('Do you want to send the meeting invitation?') then
                        MeetingMgt.SendMeetingInvitation(Rec);
                end;
            }
        }
    }
}
