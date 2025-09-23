table 80645 "Item Sales Left Temp"
{
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    {
        field(1; ItemNo; Code[20]) { }
        field(2; ItemDescription; Text[100]) { }
        field(3; BaseUnit; Code[10]) { }
        field(4; DocumentNo; Code[20]) { }
        field(5; Quantity; Decimal) { }
    }

    keys
    {
        key(PK; ItemNo, DocumentNo) { Clustered = true; }
    }
}
