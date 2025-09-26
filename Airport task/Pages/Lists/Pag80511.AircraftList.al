page 80511 "Aircraft List"
{
    ApplicationArea = all;
    Caption = 'Aircraft List';
    PageType = List;
    SourceTable = "Air Craft";
    UsageCategory = Administration;
    CardPageId = "Aircraft card";


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Registration Number"; Rec."Registration Number")
                {
                    ToolTip = 'Specifies the value of the Resgistration Number field.', Comment = '%';
                }
                field("Aircraft Classification"; Rec."Aircraft Classification")
                {
                    ToolTip = 'Specifies the value of the Aircraft Classification field.', Comment = '%';
                }
                field("Aircraft Type"; Rec."Aircraft Type")
                {
                    ToolTip = 'Specifies the value of the Aircraft Type field.', Comment = '%';
                }

                field("Airline No."; Rec."Airline No.")
                {
                    ToolTip = 'Specifies the value of the Airline No. field.', Comment = '%';
                }
                field("Has Cargo?"; Rec."Has Cargo?")
                {
                    ToolTip = 'Specifies the value of the Has Cargo? field.', Comment = '%';
                }
                field("Has people?"; Rec."Has people?")
                {
                    ToolTip = 'Specifies the value of the Has people? field.', Comment = '%';
                }
                field("Capacity Cargo"; Rec."Capacity Cargo")
                {
                    ToolTip = 'Specifies the value of the Capacity Cargo field.', Comment = '%';
                }
                field("Cargo Unit of Measurement"; Rec."Cargo Unit of Measurement")
                {
                    ToolTip = 'Specifies the value of the Cargo Unit of Measurement field.', Comment = '%';
                }

                field("Last Maintenance Date"; Rec."Last Maintenance Date")
                {
                    ToolTip = 'Specifies the value of the Last Maintenance Date field.', Comment = '%';
                }
                field(Length; Rec.Length)
                {
                    ToolTip = 'Specifies the value of the Length field.', Comment = '%';
                }
                field("Manufacturer Name"; Rec."Manufacturer Name")
                {
                    ToolTip = 'Specifies the value of the Manufacturer Name field.', Comment = '%';
                }
                field("Manufacturer Code"; Rec."Manufacturer Code")
                {
                    ToolTip = 'Specifies the value of the Manufacturer Code field.', Comment = '%';
                }

                field(Model; Rec.Model)
                {
                    ToolTip = 'Specifies the value of the Model field.', Comment = '%';
                }
                field("People Capacity"; Rec."People Capacity")
                {
                    ToolTip = 'Specifies the value of the People Capacity field.', Comment = '%';
                }

                field("Total maintenance Cost"; Rec."Total maintenance Cost")
                {
                    ToolTip = 'Specifies the value of the Total maintenance Cost field.', Comment = '%';
                }
                field(Width; Rec.Width)
                {
                    ToolTip = 'Specifies the value of the Width field.', Comment = '%';
                }
                field("New Total maintenance Cost"; Rec."New Total maintenance Cost")
                {
                    ToolTip = 'Specifies the value of the Total maintenance Cost field.', Comment = '%';
                }


            }
        }
    }


    actions
    {
        area(navigation)
        {
            group("Maintenance")
            {
                action("Aircraft maintenance")
                {
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    Runobject = page "Aircraft Maintenance List";
                    RunPageLink = "Aircraft Registration No." = field("Registration Number");
                    // RunPageOnRec =page "Aircraft Maintenance List";
                    RunPageMode = view;
                }
                action("Print Repair Report")
                {

                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        Maintenance: Record "Air Craft";
                    begin
                        Maintenance.SetFilter("Registration number", Rec."Registration number");
                        Report.Run(report::"AirCraft Maintenance Report", true, false, Maintenance);
                    end;
                }
            }
        }
    }
    trigger OnDeleteRecord(): Boolean
    var
        Maintenance: Record "Aircraft Maintenance Entry";
    begin
        // Maintenance."Aircraft Registration No." := Rec."Registration Number";
        Maintenance.SetRange("Aircraft Registration No.", Rec."Registration Number");
        if not Maintenance.IsEmpty() then
            // if (Maintenance.find('=')) then
            // Error('Cannot delete a airline with a maintenance');
            exit(true);
    end;
}