table 80511 "Airline"
{
    Caption = 'Airline';
    DataClassification = CustomerContent;
    Access = Public;                 // Explicit visibility (Public/Internal)
    TableType = Normal;              // Normal/Temporary
    DataPerCompany = true;           // Scope of data (true = per company)
    Description = 'Airline master data. Two-letter code';
    //DrillDownPageId = "Airline List"; 
    //LookupPageId = "Airline List";    

    fields
    {
        field(1; "No."; Code[2])
        {
            Caption = 'No.';
            NotBlank = true;
            DataClassification = CustomerContent;
            CharAllowed = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
            trigger OnValidate()
            begin
                EnforceTwo();
            end;
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

    trigger OnInsert()
    begin
        // Re-enforce format constraints if someone attempts a Insert.
        EnforceTwo();
    end;

    trigger OnModify()
    begin
        // Re-enforce format constraints if someone attempts a Modification.
        EnforceTwo();
    end;

    trigger OnRename()
    begin
        // Re-enforce format constraints if someone attempts a rename.
        EnforceTwo();
    end;


    local procedure EnforceTwo()
    var
        character: Text[2];
    begin
        // Normalize
        character := DelChr("No.", '=', ' ');
        // must be exactly 3 letters
        if StrLen(character) <> 2 then
            Error('Airline code must be exactly 2 letters.');
        //to assign the normalized val
        if "No." <> character then
            "No." := character;
    end;
}