page 80505 "Employee-Maintenance Card"
{
    ApplicationArea = All;
    Caption = 'Employee-Maintenance Card';
    PageType = Card;
    SourceTable = "Employee-Maintenance Mapping";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Employee No."; Rec."Employee No.")
                {
                    ToolTip = 'Specifies the value of the Employee No. field.', Comment = '%';
                }
                field("Maintenance Entry No."; Rec."Maintenance Entry No.")
                {
                    ToolTip = 'Specifies the value of the Maintenance Entry No. field.', Comment = '%';
                }
            }
        }
    }
}
