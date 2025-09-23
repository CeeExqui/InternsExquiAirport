page 80561 "Posted Request Lines"
{
    PageType = ListPart;
    SourceTable = "Posted Request Line";
    ApplicationArea = All;
    Caption = 'Posted Request Lines';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.") { }
                field("Document No."; Rec."Document No.") { }
                field("Item Description"; Rec."Item Description") { }
                field(Quantity; Rec.Quantity) { }
                field("Unit Price"; Rec."Unit Price") { }
                field("Line Amount"; Rec."Line Amount") { }
                field("Posting Date"; Rec."Posting Date") { }
            }
        }
    }
}
