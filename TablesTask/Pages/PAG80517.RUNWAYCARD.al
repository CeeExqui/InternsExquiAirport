page 80517 "Runway Card"
{
    PageType = Card;
    SourceTable = Runway;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Runway ID"; Rec."Runway ID") {  }
                field("Airport Code"; Rec."Airport Code") { }
                field("Length (m)"; Rec."Length (m)") { }
                field("Width (m)"; Rec."Width (m)") { }
            }
        }
    }
}