page 80555 "Line FactBox"
{
    PageType = CardPart;
    SourceTable = "Document Line";
    ApplicationArea = All;
    Caption = 'Line Info';

    layout
    {
        area(content)
        {
            field("Line No."; Rec."Line No.") { }
            field("Item Description"; Rec."Item Description") { }
            field(Quantity; Rec.Quantity) { }
            field("Line Amount"; Rec."Line Amount") { }
        }
    }
}
