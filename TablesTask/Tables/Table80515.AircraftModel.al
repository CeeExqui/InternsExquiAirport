table 80513 "Aircraft Model"
{
    Caption = 'Aircraft Model';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Model Code';
            NotBlank = true;
            DataClassification = CustomerContent;
        }
        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Manufacturer Code"; Code[20])
        {
            Caption = 'Manufacturer Code';
            TableRelation = Manufacturer.Code;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Code") { Clustered = true; }
        key(ManufIdx; "Manufacturer Code") { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", "Description", "Manufacturer Code") { }
    }
}
