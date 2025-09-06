table 80521 "Maintenance Employee Link"
{
    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
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