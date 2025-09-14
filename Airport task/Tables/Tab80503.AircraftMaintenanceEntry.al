table 80503 "Aircraft Maintenance Entry" //TODO add maintenance-employee
{
    Caption = 'Aircraft Maintenance Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer) //TODO auto increment make it integer
        {

            AutoIncrement = true;
            NotBlank = true;
        }
        field(2; "Aircraft Registration No."; Code[6])
        {
            TableRelation = "Air Craft"."Registration Number";
            NotBlank = true;
        }
        field(3; "Maintenance Start Date"; DateTime)
        {
            trigger OnValidate()
            begin
                validateStartDate();

            end;
        }
        field(4; "Maintenance End Date"; DateTime)
        {

            trigger OnValidate()
            begin
                validateEndDate();
            end;
        }
        field(5; "Total Maintenance Time"; Duration)
        {

        }
        field(6; "Description"; Text[255])
        {

        }
        field(7; "Cost Parts"; Decimal)
        {
            MinValue = 0;
            trigger OnValidate()
            begin
                CalculateCost();
            end;

        }
        field(8; "Cost Labor"; Decimal)
        {
            MinValue = 0;

            trigger OnValidate()
            begin
                CalculateCost();
            end;

        }
        field(9; "Total Cost"; Decimal) //TODO to test
        {
            Editable = false;
            InitValue = 0; //IT WORKSSSS
        }
        field(10; "Maintenance Type"; Code[10])
        {
            TableRelation = Maintenance;
        }



    }
    keys
    {
        key(Pk; "Entry No.")
        {
            Clustered = true;
        }
    }


    local procedure CalculateDuration()
    begin
        "Total Maintenance Time" := "Maintenance Start Date" - "Maintenance End Date";

    end;

    local procedure CalculateCost()
    begin
        "Total Cost" := "Cost Labor" + "Cost Parts";
    end;

    local procedure validateStartDate()
    begin
        if (Rec."Maintenance End Date" <> 0DT) then
            if (Rec."Maintenance End Date" < Rec."Maintenance Start Date") then begin
                Error('Cannot have an end Date later than a start date.');

            end else begin
                CalculateDuration();
            end;
    end;

    local procedure validateEndDate()
    begin
        if (Rec."Maintenance Start Date" <> 0DT) then
            if (Rec."Maintenance End Date" < Rec."Maintenance Start Date") then begin
                Error('Cannot have an end Date later than a start date.');

            end else begin
                CalculateDuration();
            end;

    end;
}
