page 80524 "Airline Card"
{
    PageType = Card;
    SourceTable = "Airline";
    ApplicationArea = All;
    Caption = 'Airline';

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
                    Editable = true;
                }
                field(Name; Rec.Name) { ApplicationArea = All; }
            }

            group(Contact)
            {
                Caption = 'Contact';
                field("Contact Name"; Rec."Contact Name") { ApplicationArea = All; }
                field("Phone Number"; Rec."Phone Number") { ApplicationArea = All; }
            }

            group(Statistics)
            {
                Caption = 'Statistics';
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
    }
}
