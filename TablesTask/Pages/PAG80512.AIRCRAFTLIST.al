page 80512 "Aircraft List"
{
    Caption = 'Aircraft List';
    PageType = List;
    SourceTable = "Aircraft";
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Aircraft Card"; // drill down to card

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = All;

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
                field("Type"; Rec."Type")
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
                field("Capacity People"; Rec."Capacity People")
                {
                    ApplicationArea = All;
                }
                field("Capacity Cargo"; Rec."Capacity Cargo")
                {
                    ApplicationArea = All;
                }
                field("Last Maintenance Date"; Rec."Last Maintenance Date")
                {
                    ApplicationArea = All;
                }
                field("Total Maintenance Cost"; Rec."Total Maintenance Cost")
                {
                    ApplicationArea = All;
                }
                field("Maintenance Date Filter"; Rec."Maintenance Date Filter")
            {
                ApplicationArea = All;
                ToolTip = 'Set a date or range (e.g. 01/12/25..31/12/25) to filter maintenance cost by date.';
            }
            field("Maintenance Cost by Date"; Rec."Maintenance Cost by Date")
            {
                ApplicationArea = All;
            }
            }

        }

    }
    actions
    {
        area(Processing)
        {
            action("Aircraft Maintenance")
            {
                ApplicationArea = All;
                Caption = 'Aircraft Maintenance';
                Image = Entry;
                Promoted = true;
                PromotedCategory = Process;
                RunPageMode = View;
                RunObject = Page "Aircraft Maintenance List";
                RunPageLink = "Aircraft Registration No." = field("Registration No.");
            }
        }

    }
    trigger OnDeleteRecord(): Boolean
    var
        Maintenance: Record "Aircaft Maintenance";
    begin
        Maintenance.SetRange("Aircraft Registration No.", Rec."Registration No.");
        if not Maintenance.IsEmpty() then
            Error('You cannot delete this aircraft because it has related maintenance records.');
            

        exit(true);
    end;
}

