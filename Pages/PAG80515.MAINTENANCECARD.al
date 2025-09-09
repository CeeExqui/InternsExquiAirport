page 80515 "Aircraft Maintenance Card"
{
    PageType = Card;
    SourceTable = "Aircaft Maintenance";
    ApplicationArea = All;
    Caption = 'Aircraft Maintenance';


    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; Editable = false; }
                field("Aircraft Registration No."; Rec."Aircraft Registration No.") { ApplicationArea = All; }
                field("Maintance Type"; Rec."Maintance Type") { ApplicationArea = All; }
                field("Start Date"; Rec."Start Date") { ApplicationArea = All; }
                field("End Date"; Rec."End Date") { ApplicationArea = All; }
                field("Duration"; Rec."Duration") { ApplicationArea = All; Editable = false; }
            }

            group(Desc)
            {
                field("Description"; Rec."Description") { ApplicationArea = All; MultiLine = true; }
            }

            group(Costs)
            {
                field("Part Cost"; Rec."Part Cost") { ApplicationArea = All; }
                field("Labor Cost"; Rec."Labor Cost") { ApplicationArea = All; }
                field("Total Cost"; Rec."Total Cost") { ApplicationArea = All; Editable = false; }
            }
            group(Employees)
            {
                Caption = 'Employees Worked';
                part(EmployeeMaintenanceLink; "Maintenance Employees")
                {
                    ApplicationArea = All;
                    SubPageLink = "Maintenance Entry No." = field("Entry No.");
                    Editable = false;
                }
            }
        }
    }

}
