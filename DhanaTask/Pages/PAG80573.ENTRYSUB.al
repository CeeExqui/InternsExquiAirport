page 80573 "Book Entry Subform"
{
    PageType = ListPart;
    SourceTable = "Book Line";
    ApplicationArea = All;
    Caption = 'Lines';
    DelayedInsert = true;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Lines)
            {
                field("Line No."; Rec."Line No.") { ApplicationArea = All; Editable = false; }
                field("Book No."; Rec."Book No.") { ApplicationArea = All; }
                field("Book Description"; Rec."Book Description") { ApplicationArea = All; Editable = false; }
                field(Amount; Rec.Amount) { ApplicationArea = All; }
            }
        }
    }
}
