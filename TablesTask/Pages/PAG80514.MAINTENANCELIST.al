page 80514 "Aircraft Maintenance List"
{
    PageType = List;
    SourceTable = "Aircaft Maintenance";
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Aircraft Maintenance';
    CardPageId = "Aircraft Maintenance Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field("Aircraft Registration No."; Rec."Aircraft Registration No.") { ApplicationArea = All; }
                field("Maintance Type"; Rec."Maintance Type") { ApplicationArea = All; }
                field("Start Date"; Rec."Start Date") { ApplicationArea = All; }
                field("End Date"; Rec."End Date") { ApplicationArea = All; }
                field("Duration"; Rec."Duration") { ApplicationArea = All; }
                field("Part Cost"; Rec."Part Cost") { ApplicationArea = All; }
                field("Labor Cost"; Rec."Labor Cost") { ApplicationArea = All; }
                field("Total Cost"; Rec."Total Cost") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Labor Costs")
            {
                ApplicationArea = All;
                Caption = 'Labor Cost';
                Image = CalculateCost;
                ToolTip = 'Adjust the labor cost for this maintenance record';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Rec."Entry No." = 0 then
                        Error('Please select a maintenance record first.');

                    Page.RunModal(Page::"Labor Cost Adjustment", Rec);
                end;
            }
        }
    }
}
