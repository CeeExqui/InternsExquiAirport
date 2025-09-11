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
                field("Flight ID"; Rec."Flight ID") { Style = Attention; }
                field("CallOutID"; Rec."Callout ID") { }
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
    actions
    {
        area(Processing)
        {
            action(NewFlight)
            {
                Caption = 'New Flight';
                Image = New;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Create a new flight schedule.';
                RunObject = Page "Flight Schedule Card";
                RunPageMode = View;

            }
        }

        area(navigation)
        {
            group(Views)
            {
                Caption = 'Navigate';
                action(ViewDetails)
                {
                    Caption = 'Flight Details';
                    Image = View;
                    ApplicationArea = All;
                    ToolTip = 'Open the details of the selected flight.';
                    RunObject = Page "Flight Schedule Card";
                    RunPageMode = View;
                }

                action(ViewAircraft)
                {
                    Caption = 'Aircraft';
                    Image = Item;
                    ApplicationArea = All;
                    ToolTip = 'View the aircraft assigned to this flight.';
                    RunObject = Page "Aircraft Card";
                    RunPageLink = "Registration No." = field("Aircraft Reg No.");
                }

                action(ViewRunway)
                {
                    Caption = 'Runway';
                    Image = Line;
                    ApplicationArea = All;
                    ToolTip = 'View the runway assigned to this flight.';
                    RunObject = Page "Runway Card";
                    RunPageLink = "Runway ID" = field("Runway ID");
                }

                action(ViewFromAirport)
                {
                    Caption = 'From Airport';
                    ApplicationArea = All;
                    ToolTip = 'View the departure airport.';
                    RunObject = Page "Airport Card";
                    RunPageLink = "No." = field("From Airport Code");
                }

                action(ViewToAirport)
                {
                    Caption = 'To Airport';
                    ApplicationArea = All;
                    ToolTip = 'View the arrival airport.';
                    RunObject = Page "Airport Card";
                    RunPageLink = "No." = field("To Airport Code");
                }
            }
        }

        area(creation)
        {
            action(CopyFlight)
            {
                Caption = 'Copy Flight';
                Image = Copy;
                ApplicationArea = All;
                ToolTip = 'Copy the selected flight schedule to create a new one.';
                trigger OnAction()
                var
                    Flight: Record "Flight Schedule";
                begin
                    Flight := Rec;
                    Flight."Flight ID" := '';
                    Flight.Insert(true);
                    Page.Run(Page::"Flight Schedule Card", Flight);
                end;
            }
        }
    }
}