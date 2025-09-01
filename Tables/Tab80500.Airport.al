table 80500 Airport
{
    Caption = 'Airport';

    fields
    {
        field(1; "No."; Code[4])
        {
            SqlDataType = "Varchar";

        }
        field(2; Name; Text[50])
        {
        }
        field(3; "City"; Text[30])
        {
            Caption = 'City';
            OptimizeForTextSearch = true;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            ValidateTableRelation = false;
            ToolTip = 'Specifies the customer''s city.';
        }
        field(4; "Country/Region Code"; Text[50]) { TableRelation = "Country/Region".code; }
        field(5; OperatingSatus; Enum "Operating Status") { }

    }
    // keys
    // {
    //     key(PK; "")
    //     {
    //         Clustered = true;
    //     }
}

