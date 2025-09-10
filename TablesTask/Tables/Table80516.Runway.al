table 80516 "Runway"
{
    Caption = 'Runway List';
    DataClassification = CustomerContent;
    DrillDownPageId = "Runway List";
    LookupPageId = "Runway List";
    Permissions = tabledata Runway = RIMD;
    Access = Public;

    fields
    {
        field(1; "Runway ID"; Code[10])
        {
            Caption = 'Runway ID';
            NotBlank = true;

        }
        field(2; "Length (m)"; Integer)
        {
            Caption = 'Length (m)';
            MinValue = 0;
        }
        field(3; "Width (m)"; Integer)
        {
            Caption = 'Width (m)';
            MinValue = 0;
        }
        field(4; "Airport Code"; Code[10])
        {
            Caption = 'Airport Code';
            NotBlank = true;
            TableRelation = Airport."No.";
            trigger OnValidate()
            begin
                if (xRec."Airport Code" <> Rec."Airport Code") and
                (Rec."Airport Code" <> '') and
                (xRec."Airport Code" <> '') then
                    Error('Cannot Change the Airport Code');
            end;
        }
    }
    keys
    {
        key(PK; "Airport Code", "Runway ID") { Clustered = true; }
    }


}