page 80520 "Flight Schedule Card"
{
    PageType = Card;
    SourceTable = "Flight Schedule";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Flight ID"; Rec."Flight ID") { }
                field("Aircraft Reg No."; Rec." Callout ID ") { }
                field("Airline No."; Rec."Airline No.") { }
                field("Airport Code"; Rec."Airport Code") { }
                field("Runway ID"; Rec."Runway ID") { }
                field("Flight Type"; Rec."Flight Type") { }
                field("Scheduled Time"; Rec."Scheduled Time") { }
                field("Status"; Rec.Status) { }
            }
        }
    }
}