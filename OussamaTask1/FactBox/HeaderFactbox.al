page 80556 "Header FactBox"
{
    PageType = CardPart;
    SourceTable = "Document Header";
    ApplicationArea = All;
    Caption = 'Header Info';

    layout
    {
        area(content)
        {
            field("No."; Rec."No.") { }
            field("Description"; Rec.Description) { }
            field("Posting Date"; Rec."Posting Date") { }
            field("Total Amount"; Rec."Total Amount") { }
        }
    }
}
