table 80510 "Airport"
{
    Caption = 'Airport';
    DataClassification = CustomerContent;
    //The table data is scoped per company in Business Central. True
    //The table data is shared across all companies in the tenant.
    DataPerCompany = true;

    // Display Code and Name in lookups and titles
    DataCaptionFields = "No.", "Operating Status";

    // For Page Creation
    LookupPageId = "Airport List";
    DrillDownPageId = "Airport List";

    fields
    {
        field(1; "No."; Code[3])
        {
            //3 letter airport code (BEY)
            Caption = 'No.';
            DataClassification = CustomerContent;
            NotBlank = true;
            ToolTip = 'Specifies the 3 letter airport code (BEY).';
            CharAllowed = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

            trigger OnValidate()
            begin
                EnforceThree();
            end;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
            ToolTip = 'Specifies the airport''s official name ("Beirut–Rafic Hariri International Airport").';
            // OptimizeForTextSearch applies only to certain field types; we keep it on City where it's most useful.
        }
        field(3; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = CustomerContent;
            TableRelation = "Country/Region".Code;
            ToolTip = 'Specifies the country/region of the airport (linked to the Country/Region table).';
        }
        field(4; City; Text[50])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
            OptimizeForTextSearch = true;

            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));

            // We deliberately keep ValidateTableRelation = false to avoid blocking inserts
            // when City does not exist in the "Post Code" table for a given country.
            ValidateTableRelation = false;

            ToolTip = 'Specifies the airport''s city. Uses the Post Code table as a loose reference for assisted entry.';
        }

        field(5; "Operating Status"; Enum "Operating Status")
        {
            Caption = 'Operating Status';
            DataClassification = CustomerContent;
            ToolTip = 'Indicates if the airport is open, closed, under maintenance, or suspended.';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }

        // Secondary key for fast name searches (you had this; kept as-is)
        key(NameIndex; Name) { }

        // Helpful composite key for search/filter scenarios (non-clustered, safe to add)
        key(CityCountryIdx; City, "Country/Region Code") { }
    }

    fieldgroups
    {
        // Helpful in lookups/dropdowns
        fieldgroup(DropDown; "No.", Name, City, "Country/Region Code", "Operating Status") { }
        fieldgroup(Brick; "No.", Name, City) { }
    }

    trigger OnInsert()
    begin
        // Re-enforce format constraints if someone attempts a Insert.
        EnforceThree();
    end;

    trigger OnModify()
    begin
        // Re-enforce format constraints if someone attempts a Modification.
        EnforceThree();
    end;

    trigger OnRename()
    begin
        // Re-enforce format constraints if someone attempts a rename.
        EnforceThree();
    end;

    /*local procedure EnforceThree()
     var
         Upper: Text[3];
     begin
         // Normalize: uppercase + strip spaces
         Upper := UpperCase(DelChr("No.", '=', ' '));
         // Must be exactly 3 chars
         if StrLen(Upper) <> 3 then
             Error('Airport code must be exactly 3 letters.');
         // Must be letters only like B3Y not Validd!!
         if DelChr(Upper, '=', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') <> '' then
             Error('Airport code can only contain letters A–Z. Value "1" is invalid.', Upper);
         // Save normalized value back to the field
         if "No." <> Upper then
             "No." := Upper;
     end;
     */
    local procedure EnforceThree()
    var
        character: Text[3];
    begin
        // Normalize
        character := DelChr("No.", '=', ' ');
        // must be exactly 3 letters
        if StrLen(character) <> 3 then
            Error('Airport code must be exactly 3 letters.');
        //to assign the normalized val
        if "No." <> character then
            "No." := character;
    end;
}
