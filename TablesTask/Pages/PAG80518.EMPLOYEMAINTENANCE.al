page 80518 "Maintenance Employees"
{
    PageType = ListPart;
    SourceTable = "Maintenance Employee Link";
    ApplicationArea = All;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Maintenance Entry No."; Rec."Maintenance Entry No.") { }
                field("Employee ID"; Rec."Employee ID") { }
            }
        }
    }
}