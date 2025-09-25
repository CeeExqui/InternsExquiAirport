page 80554 "GLEntry Retrieval Log List"
{
    PageType = List;
    SourceTable = "GLEntry Retrieval Log";
    ApplicationArea = All;
    Caption = 'G/L Entry Retrieval Log';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.") { }
                field("Posting Date"; Rec."Posting Date") { }
                field(Amount; Rec.Amount) { }
                field(Method; Rec.Method) { }
            }
        }
    }
}
