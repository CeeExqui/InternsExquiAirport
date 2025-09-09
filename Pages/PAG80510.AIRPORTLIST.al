page 80510 "Airport List"
{
    Caption = 'Airports';
    PageType = List;
    SourceTable = "Airport";
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Airport Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = '3-letter airport code (e.g., BEY).';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Airport official name.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Country or region of the airport.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'City of the airport.';
                }
                field("Operating Status"; Rec."Operating Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Open, Closed, Under Maintenance, or Suspended.';
                }
            }
        }
    }

    actions
    { }
}
