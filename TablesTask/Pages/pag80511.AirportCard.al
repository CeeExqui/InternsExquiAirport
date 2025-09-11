page 80511 "Airport Card"
{
    Caption = 'Airport';
    PageType = Card;
    SourceTable = "Airport";
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = '3-letter airport code (BEY).';
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
}
