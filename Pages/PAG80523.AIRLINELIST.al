page 80523 "Airline List"
{
    PageType = List;
    SourceTable = "Airline";
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Airlines';
    CardPageId = "Airline Card"; // double-click opens the card

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field(Name; Rec.Name) { ApplicationArea = All; }
                field("Contact Name"; Rec."Contact Name") { ApplicationArea = All; }
                field("Phone Number"; Rec."Phone Number") { ApplicationArea = All; }
                field("Total Number of Aircrafts"; Rec."Total Number of Aircrafts")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(OpenAircrafts)
            {
                ApplicationArea = All;
                Caption = 'View Aircrafts';
                Image = List;
                RunObject = page "Aircraft List";
                RunPageLink = "Airline No." = field("No.");
            }
        }
    }
}
