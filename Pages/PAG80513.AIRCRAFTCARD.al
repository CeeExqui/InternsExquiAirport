page 80513 "Aircraft Card"
{
    Caption = 'Aircraft Card';
    PageType = Card;
    SourceTable = "Aircraft";
    ApplicationArea = All;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General Information';
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = All;
                    Editable = bool;
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                    ApplicationArea = All;
                }
                field(ManufacturerName; Rec."Manufacturer Name")
                {
                    ApplicationArea = All;
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("Airline No."; Rec."Airline No.")
                {
                    ApplicationArea = All;
                }
                field("Length(m)"; Rec."Aircraft Length (m)")
                {
                    ApplicationArea = All;
                }
                field("Width(m)"; Rec."Aircraft Width (m)")
                {
                    ApplicationArea = All;
                }
            }

            group(Capacity)
            {
                Caption = 'Capacity';
                field("Capacity People"; Rec."Capacity People")
                {
                    ApplicationArea = All;
                }
                field("Capacity Cargo"; Rec."Capacity Cargo")
                {
                    ApplicationArea = All;
                }
                field("Cargo Code"; Rec."Cargo Code")
                {
                    ApplicationArea = All;
                }
            }

            group(Maintenance)
            {
                Caption = 'Maintenance';
                field("Last Maintenance Date"; Rec."Last Maintenance Date")
                {
                    ApplicationArea = All;
                }
                field("Total Maintenance Cost"; Rec."Total Maintenance Cost")
                {
                    ApplicationArea = All;
                }
            }

        }

    }

    var
        bool: Boolean;

    trigger OnOpenPage()
    begin
        // Decide once when the page opens
        if Rec."Registration No." = '' then
            bool := true
        else
            bool := false;
    end;

}
