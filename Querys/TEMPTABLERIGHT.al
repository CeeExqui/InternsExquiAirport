table 80647 "Sales Lines RIGHT TEMP"
{
    DataClassification = ToBeClassified;
    TableType = temporary;

    fields
    {
        field(1; EntryNo; Integer) { AutoIncrement = true; } 
        field(2; DocumentNo; Code[20]) { }
        field(3; ItemNo; Code[20]) { }
        field(4; Quantity; Decimal) { }
        field(5; ItemDescription; Text[100]) { }
        field(6; BaseUnit; Code[10]) { }
    }

    keys
    {
        key(PK; EntryNo) { Clustered = true; }   
    }
}
