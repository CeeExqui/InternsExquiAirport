page 80519 "Maintenance List Part"
{
    ApplicationArea = All;
    Caption = 'Maintenance List Part';
    PageType = ListPart;
    SourceTable = "Aircraft Maintenance Entry";
    UsageCategory = Administration;
    MultipleNewLines = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Aircraft Registration No."; Rec."Aircraft Registration No.")
                {
                    ToolTip = 'Specifies the value of the Aircraft Registration No. field.', Comment = '%';
                }
                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ToolTip = 'Specifies the value of the Maintenance Type field.', Comment = '%';
                }
                field("Cost Labor"; Rec."Cost Labor")
                {
                    ToolTip = 'Specifies the value of the Cost Labor field.', Comment = '%';
                }
                field("Cost Parts"; Rec."Cost Parts")
                {
                    ToolTip = 'Specifies the value of the Cost Parts field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Dimension Value"; Rec."Dimension Set ID")
                {
                    ToolTip = 'Specifies the value of the Dimension Value field.', Comment = '%';
                }
                field("Maintenance Start Date"; Rec."Maintenance Start Date")
                {
                    ToolTip = 'Specifies the value of the Maintenance Start Date field.', Comment = '%';
                }

                field("Maintenance End Date"; Rec."Maintenance End Date")
                {
                    ToolTip = 'Specifies the value of the Maintenance End Date field.', Comment = '%';
                }

                field("Total Cost"; Rec."Total Cost")
                {
                    ToolTip = 'Specifies the value of the Total Cost field.', Comment = '%';
                }
                field("Total Maintenance Time"; Rec."Total Maintenance Time")
                {
                    ToolTip = 'Specifies the value of the Total Maintenance Time field.', Comment = '%';
                }

            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(Dimensions)
            {

                ApplicationArea = all;
                Caption = 'Dimensions';
                Image = Dimensions;
                ShortCutKey = 'Alt+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                trigger OnAction()
                begin
                    Rec.ShowDimensions();
                end;

            }
        }
    }





}
