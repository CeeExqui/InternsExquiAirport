table 80511 "Airline"
{
    Caption = 'Airline';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[2])
        {
            Caption = 'No.';
            NotBlank = true;
            DataClassification = CustomerContent;
        }
        field(2; "Name"; Text[100])
        {
            Caption = 'Name';
            OptimizeForTextSearch = true;
            ToolTip = 'Specifies the Airline''s name that appears on all related documents.';
        }
        field(3; "Contact Name"; Text[100])
        {
            Caption = 'Contact Name';
            DataClassification = CustomerContent;
        }
        field(4; "Phone Number"; Text[30])
        {
            Caption = 'Phone No.';
            OptimizeForTextSearch = true;
            ExtendedDatatype = PhoneNo;
            ToolTip = 'Specifies the Contact''s telephone number.';
        }
        field(5; "Total Number of Aircrafts"; Integer)
        {
            Caption = 'Total Number of Aircrafts';
            FieldClass = FlowField;
            CalcFormula = count("Aircraft" where("Airline No." = field("No.")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "No.") { Clustered = true; }
        key(NameIndex; Name) { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, "Phone Number", "Total Number of Aircrafts") { }
    }
}