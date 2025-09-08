table 80521 "Maintenance Employee Link"
{
    Caption = 'Maintenance Employees';
    DataClassification = CustomerContent;
    LookupPageId = "Maintenance Employees";
    DrillDownPageId = "Maintenance Employees";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            MinValue = 0;
        }
        field(2; "Maintenance Entry No."; Integer)
        {
            TableRelation = "Aircaft Maintenance"."Entry No.";
        }
        field(3; "Employee ID"; Code[20])
        {
            TableRelation = Employee."No.";
        }
    }

    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
    }
}