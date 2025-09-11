table 80524 "Aircraft Callout"
{
    Caption = 'Aircraft Callout';
    DataCaptionFields = "Callout ID", "Aircraft Reg No.";
    DataClassification = CustomerContent;
    LookupPageId = "Aircraft Callout List";
    DrillDownPageId = "Aircraft Callout List";
    Access = Public;
    Permissions = tabledata "Aircraft Callout" = RIMD;

    fields
    {
        field(1; "Callout ID"; Code[30])
        {
            Caption = 'Callout ID';
            Editable = false;
        }

        field(2; "Airline No."; Code[2])
        {
            Caption = 'Airline No.';
            TableRelation = Airline."No.";
            NotBlank = true;

            trigger OnValidate()
            begin
                UpdateCalloutId();
            end;
        }

        field(3; "Aircraft Reg No."; Code[20])
        {
            Caption = 'Aircraft Reg No.';
            TableRelation = Aircraft."Registration No.";
        }

        field(4; "User Callout Code"; Code[4])
        {
            Caption = 'User Callout Code';
            NotBlank = true;

            trigger OnValidate()
            begin
                UpdateCalloutId();
            end;
        }
    }

    keys
    {
        key(PK; "Airline No.", "User Callout Code") { Clustered = true; }
    }

    trigger OnInsert()
    begin
        UpdateCalloutId();
    end;

    local procedure UpdateCalloutId()
    var
        NewId: Code[30];
    begin
        if ("Airline No." = '') or ("User Callout Code" = '') then
            exit;

        NewId := "Airline No." + '-' + "User Callout Code";

        if StrLen(NewId) > MaxStrLen("Callout ID") then
            Error('Computed Callout ID (%1) exceeds max length (%2).', NewId, MaxStrLen("Callout ID"));

        if "Callout ID" = '' then
            "Callout ID" := NewId
        else
            if "Callout ID" <> NewId then
                Rename(NewId);
    end;
}
