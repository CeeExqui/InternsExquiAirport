page 80536 "BookEntryHeader List"
{
    ApplicationArea = All;
    Caption = 'BookEntryHeader List';
    PageType = List;
    SourceTable = "Book Entry Header";
    UsageCategory = Administration;
    CardPageId = "BookEntry Document";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("Customer Email"; Rec."Customer Email")
                {
                    ToolTip = 'Specifies the value of the Customer Email field.', Comment = '%';
                }
                field("Customer Phone No"; Rec."Customer Phone No")
                {
                    ToolTip = 'Specifies the value of the Customer Phone No field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var

    begin

        Message(rec.SystemId);
    end;
}
