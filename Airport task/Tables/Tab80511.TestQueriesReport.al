table 80511 "Test Queries Report"
{
    Caption = 'Test Queries Report';
    DataClassification = ToBeClassified;
        fields
    {
        field(1; "ID"; Integer)
        {
            AutoIncrement = true;
            Caption = '';
        }
    }
    keys
    {
        key(PK; "ID")
        {
            Clustered = true;
        }
    }
}
