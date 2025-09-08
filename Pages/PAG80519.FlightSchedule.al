page 80519 "Flight Schedule List"
{
    PageType = List;
    SourceTable = "Flight Schedule";
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Flight Schedule Card";
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Flight ID"; Rec."Flight ID") { }
                field("CallOutID"; Rec." Callout ID ") { }
                field("Airline No."; Rec."Airline No.") { }
                field("Runway ID"; Rec."Runway ID") { }
                field("From Airport Code"; Rec."From Airport Code") { }
                field("To Airport Code"; Rec."To Airport Code") { }
                field("Scheduled Time"; Rec."Scheduled Date") { }
                field("Departure Time"; Rec."Departure Time") { }
                field("Landing Time"; Rec."Landing Time") { }
                field("Status"; Rec.Status) { }
            }
        }
    }
}