page 80537 "BookEntry Document"
{
    ApplicationArea = All;
    Caption = 'BookEntry Document';
    PageType = Card;
    SourceTable = "Book Entry Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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
            part(Lines; BookEntryLine)
            {
                SubPageLink = "Entry No." = field("Entry No.");
            }
        }
    }
}
