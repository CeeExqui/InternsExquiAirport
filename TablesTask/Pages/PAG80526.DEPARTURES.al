page 80526 "Airport Departures"
{
    PageType = List;
    SourceTable = "Flight Schedule";
    SourceTableView = where("Flight Type" = const(Departure));
    Caption = 'Departures';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Flight ID"; Rec."Flight ID") { ApplicationArea = All; }
                field("Airline No."; Rec."Airline No.") { ApplicationArea = All; }
                field("From Airport Code"; Rec."From Airport Code") { ApplicationArea = All; }
                field("To Airport Code"; Rec."To Airport Code") { ApplicationArea = All; }
                field("Scheduled Date"; Rec."Scheduled Date") { ApplicationArea = All; }
                field("Departure Time"; Rec."Departure Time") { ApplicationArea = All; }
                field("Runway ID"; Rec."Runway ID") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
            }
        }
    }

    actions { }
}
