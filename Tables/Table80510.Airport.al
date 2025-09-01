table 80510 "Airport"
{
    Caption = 'Airport';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[3])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(2; "Name"; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; "City"; Text[50])
        {
            Caption = 'City';
            OptimizeForTextSearch = true;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            ValidateTableRelation = false;
            ToolTip = 'Specifies the Airport''s city.';
        }
        field(4; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region".Code;
            DataClassification = CustomerContent;
        }
        field(5; "Operating Status"; Enum "Operating Status")
        {
            Caption = 'Operating Status';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.") { Clustered = true; }
        //this secondary key is used to filter also the name of the Airport.
        key(NameIndex; Name) { }
    }

    fieldgroups
    {
        //this will help to show everything related to the Airport when used in a table relation
        fieldgroup(DropDown; "No.", Name, City, "Country/Region Code", "Operating Status") { }
    }
}
