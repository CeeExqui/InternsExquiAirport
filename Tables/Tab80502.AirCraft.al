table 80502 "Air Craft"
{
    Caption = 'Air Craft';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Aircraft Maintenance EntryCard";
    fields
    {
        field(1; "Resgistration Number"; Code[6])
        {
            Editable = false;
            trigger OnValidate()
            begin
                validateRegistration();
            end;
        }
        field(2; "Aircraft Classification"; Option)
        {
            OptionMembers = Commercial,Military,Private;

        }
        field(3; "Aircraft Type"; Enum "Air Craft Type")
        {
            NotBlank = True;
            trigger OnValidate()
            begin
                validateAirlineNo();
            end;


        }
        field(4; "Manufacturer Code"; Code[10]) //TODO add a manufacturer Name
        {
            TableRelation = "Manufacturer".Code;
            trigger OnValidate()
            begin
                validManufacturerNo();
                validModel();
            end;

        }
        field(5; "Model"; Text[100])
        {

            TableRelation = if ("Manufacturer Code" = filter(<> '')) "Manufacturer".Model where(Code = field("Manufacturer Code"));
            trigger OnValidate()
            begin
                ValidModel()
            end;
        }

        field(6; "People Capacity"; Integer)
        {
            MinValue = 0;
            trigger OnValidate()
            begin
                validatePeople();
            end;

        }
        field(7; "Capacity Cargo"; Decimal)
        {
            MinValue = 0;
            trigger OnValidate()
            begin
                validateCargo();
            end;

        }
        field(8; "Cargo Unit of Measurement"; Code[10]) //TODO notblank
        {
            TableRelation = "Unit of Measure".Code;

            trigger OnValidate()
            begin
                validateMeasurementUnit();
            end;
        }
        field(9; "Airline No."; Code[2]) //should add aircraft categ
        {
            TableRelation = Airline."No.";
            trigger OnValidate()
            begin
                validateAirlineNo();
            end;
        }
        field(10; "Total maintenance Cost"; Decimal)//change calc formula fields to decimal
        {

            FieldClass = FlowField;

            CalcFormula = sum("Aircraft Maintenance Entry"."Total Cost" where("Aircraft Registration No." = field("Resgistration Number")));
        }
        field(11; "Last Maintenance Date"; DateTime)
        {
            FieldClass = FlowField;
            CalcFormula = Max("Aircraft Maintenance Entry"."Maintenance End Date" WHERE("Aircraft Registration No." = field("Resgistration Number")));
        }
        field(12; "Width"; Decimal)
        {
            MinValue = 0;
        }
        field(13; "Length"; Decimal)
        {
            MinValue = 0;
        }
        field(14; "Has Cargo?"; Boolean)
        {
            trigger OnValidate()
            begin
                validateMeasurementUnit();
                validateCargo();
            end;

        }
        Field(15; "Has people?"; Boolean)
        {
            trigger OnValidate()
            begin
                validatePeople();
            end;
        }
        Field(16; "Manufacturer Name"; Text[50])
        {
            NotBlank = true;
            Editable = false;
            InitValue = '';

        }
    }
    keys
    {
        key(PK; "Resgistration Number")
        {
            Clustered = true;
        }
    }


    var
        Manufacturer: Record Manufacturer;

    local procedure validManufacturerNo()
    begin
        if (Manufacturer.get(Rec."Manufacturer Code")) then
            "Manufacturer Name" := Manufacturer.Name
        else
            clear("Manufacturer Name");


    end;

    local procedure validModel()
    begin
        if (Rec."Manufacturer Code" <> '') then begin
            if (Manufacturer.get(Rec."Manufacturer Code")) then
                if (Manufacturer.Model <> Rec."Model") then Error('Model do not belong to the manufacturer.')
        end
        else
            Error('Invalid Manufacturer Code');


    end;

    local procedure validatePeople()
    begin
        if (Rec."Has people?" = true) then
            if (Rec."People Capacity" = 0) then Error('Enter valid people capacity')
    end;

    local procedure validateCargo()
    begin
        if (Rec."Has Cargo?" = true) then
            if (Rec."Capacity Cargo" = 0) then Error('Please enter a valid Cargo weight')
    end;

    local procedure validateMeasurementUnit()
    begin
        if (Rec."Has Cargo?" = true) then
            if (Rec."Cargo Unit of Measurement" = '') then Error('Please enter a valid Cargo weight')
    end;

    local procedure validateAirlineNo()

    begin
        if (Rec."Aircraft Type" = "Aircraft Type"::Passenger) then
            if (Rec."Airline No." = '') then Error('Please enter an Airline No.')
    end;

    local procedure validateRegistration()
    begin
        if (Rec."Resgistration Number" = ('')) then
            Error('Please enter a value');
    end;

}
