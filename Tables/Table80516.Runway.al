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
            TableRelation = Airport."No.";
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Runway ID") { Clustered = true; }
    }
}