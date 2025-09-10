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
                field("Aircraft Reg No."; Rec."Callout ID") { }
                field("Airline No."; Rec."Airline No.") { }
                field("Flight Type"; Rec."Flight Type") { }
                field("From Airport Code"; Rec."From Airport Code") { }
                field("To Airport Code"; Rec."To Airport Code") { }
                field("Runway ID"; Rec."Runway ID") { }
                field("Scheduled Time"; Rec."Scheduled Date") { }
                field("Departure Time"; Rec."Departure Time") { }
                field("Landing Time"; Rec."Landing Time") { }
                field("Status"; Rec.Status) { }
            }
        }
    }
}