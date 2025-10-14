page 80535 BookEntryLine
{
    ApplicationArea = All;
    Caption = 'BookEntryLine List';
    PageType = ListPart;
    SourceTable = "Book Entry lines";
    AutoSplitKey = true;
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
                field("Book No."; Rec."Book No.")
                {
                    ToolTip = 'Specifies the value of the Book No. field.', Comment = '%';
                }
                field("Book Description"; Rec."Book Description")
                {
                    ToolTip = 'Specifies the value of the Book Description field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
            }
        }
    }
}
