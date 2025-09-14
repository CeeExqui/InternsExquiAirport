page 80510 "Aircraft Maintenance List"
{
    ApplicationArea = All;
    Caption = 'Aircraft Maintenance List';
    PageType = List;
    SourceTable = "Aircraft Maintenance Entry";
    UsageCategory = Administration;
    Editable = false;
    InsertAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';

                field("Aircraft Registration No."; Rec."Aircraft Registration No.")
                {
                    ToolTip = 'Specifies the value of the Aircraft Registration No. field.', Comment = '%';
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

                field("Maintenance End Date"; Rec."Maintenance End Date")
                {
                    ToolTip = 'Specifies the value of the Maintenance End Date field.', Comment = '%';
                }
                field("Maintenance Start Date"; Rec."Maintenance Start Date")
                {
                    ToolTip = 'Specifies the value of the Maintenance Start Date field.', Comment = '%';
                }
                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ToolTip = 'Specifies the value of the Maintenance Type field.', Comment = '%';
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

}
