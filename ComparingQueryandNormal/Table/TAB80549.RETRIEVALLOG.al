table 80549 "GLEntry Retrieval Log"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer) { }
        field(2; "Posting Date"; Date) { }
        field(3; "Amount"; Decimal) { }
        field(4; "Method"; Option)
        {
            OptionMembers = Query,Record;
        }
    }

    keys
    {
        key(PK; "Entry No.", "Method") { Clustered = true; }
    }
}
