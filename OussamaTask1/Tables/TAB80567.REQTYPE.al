table 80567 "Request Type"
{
    Caption = 'Request Type';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Code") { Clustered = true; }
    }
}
