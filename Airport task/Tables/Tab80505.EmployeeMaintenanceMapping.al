table 80505 "Employee-Maintenance Mapping"
{
    Caption = 'Employee-Maintenance Mapping';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            TableRelation = Employee."No.";
        }
        field(2; "Maintenance Entry No."; Code[20])
        {
            TableRelation = "Aircraft Maintenance Entry"."Entry No.";

        }
    }
    keys
    {
        key(PK; "Employee No.", "Maintenance Entry No.")
        {
            Clustered = true;
        }
    }
}
