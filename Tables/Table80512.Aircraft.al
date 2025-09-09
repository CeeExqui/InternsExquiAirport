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
        field(2; "Manufacturer"; Code[20])
        {
            Caption = 'Manufacturer';
            TableRelation = Manufacturer.Code;
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                test: Record Manufacturer;
            begin
                if test.Get("Manufacturer") then
                    "Manufacturer Name" := test.Name
                else
                    Clear("Manufacturer Name");
            end;
        }
        field(13; "Manufacturer Name"; Text[100])
        {
            Caption = 'Manufacturer Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(3; "Model"; Text[50])
        {
            Caption = 'Model';
            DataClassification = CustomerContent;

            TableRelation = "Manufacturer Model".Code where("Manufacturer Code" = field("Manufacturer"));
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
            trigger OnValidate()
            begin
                if ("Type" <> "Type"::Passenger) then
                    Clear("Type");
            end;
        }
        field(8; "Airline No."; Code[2])
        {
            Caption = 'Airline No.';
            TableRelation = "Airline"."No.";
            DataClassification = CustomerContent;
        }
        field(9; "Total Maintenance Cost"; Decimal)
        {
            Caption = 'Total Maintenance Cost';
            //we use FlowField Here because it is using pre Calculated Fields
            FieldClass = FlowField;
            //take the Total Cost of the Aircraft based on the Reg No. and display it here 
            CalcFormula = sum("Aircaft Maintenance"."Total Cost" where("Aircraft Registration No." = field("Registration No.")));
            Editable = false;
        }

        field(10; "Last Maintenance Date"; Date)
        {
            Caption = 'Last Maintenance Date';
            FieldClass = FlowField;
            //take the enddate of the selected Aircaft, Reg No. and Display it here
            CalcFormula = max("Aircaft Maintenance"."End Date" where("Aircraft Registration No." = field("Registration No.")));
            Editable = false;
        }
        field(11; "Aircraft Length (m)"; Integer)
        {
            Caption = 'Length (m)';
            MinValue = 0; 
        }
        field(12; "Aircraft Width (m)"; Integer)
        {
            Caption = 'Width (m)';
            MinValue = 0;
        }
    }

    keys
    {
        key(PK; "Registration No.") { Clustered = true; }
        key(Airline; "Airline No.") { }
        key(Type; Type) { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Registration No.", "Model", "Manufacturer", "Type", "Airline No.") { }
    }
}
