table 80516 "Runway"
{
    fields
    {
        field(1; "Runway ID"; Code[10])
        {
            Caption = 'Runway ID';
        }
        field(2; "Length (m)"; Integer)
        {
            Caption = 'Length (m)';
        }
        field(3; "Width (m)"; Integer)
        {
            Caption = 'Width (m)';
        }
        field(4; "Airport Code"; Code[10])
        {
            Caption = 'Airport Code';
            TableRelation = Airport."No.";
        }
    }
    keys
    {
        key(PK; "Runway ID") { Clustered = true; }
    }
}