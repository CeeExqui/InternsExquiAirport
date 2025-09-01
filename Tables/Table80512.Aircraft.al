table 80512 "Aircraft"
{
    Caption = 'Aircraft';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Registration No."; Code[20])
        {
            Caption = 'Registration No.';
            NotBlank = true;
            DataClassification = CustomerContent;
        }
        field(2; "Model"; Text[50])
        {
            Caption = 'Model';
            DataClassification = CustomerContent;
        }
        field(3; "Manufacturer"; Code[20])
        {
            Caption = 'Manufacturer';
            TableRelation = Manufacturer.Code;
            DataClassification = CustomerContent;
        }

        field(4; "Capacity People"; Integer)
        {
            Caption = 'Capacity (People)';
            MinValue = 0;
            DataClassification = CustomerContent;
        }
        field(5; "Capacity Cargo"; Decimal)
        {
            Caption = 'Capacity (Cargo)';
            // it allow us to add from 0 to 5 digits after the ","
            DecimalPlaces = 0 : 5;
            MinValue = 0; //disable negative values
            DataClassification = CustomerContent;
        }
        field(6; "Cargo Code"; Code[10])
        {
            Caption = 'Cargo Code';
            TableRelation = "Unit of Measure".Code;
            DataClassification = CustomerContent;
        }
        field(7; "Type"; Enum "Aircraft Type")
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
        field(8; "Airline No."; Code[2])
        {
            Caption = 'Airline No.';
            TableRelation = "Airline"."No.";
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Registration No.") { Clustered = true; }
        key(AirlineIndex; "Airline No.") { }
        key(TypeIndex; Type) { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Registration No.", "Model", "Manufacturer", "Type", "Airline No.") { }
    }
}
