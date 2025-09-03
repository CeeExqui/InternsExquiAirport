table 80515 "Manufacturer Model"
{
    Caption = 'Manufacturer Model';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Model Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Manufacturer Code"; Code[10])
        {
            Caption = 'Manufacturer Code';
            TableRelation = Manufacturer.Code; // links to table 5720
        }
    }

    keys
    {
        key(PK; Code, "Manufacturer Code") { Clustered = true; }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Code, Description, "Manufacturer Code") { }
    }
}
