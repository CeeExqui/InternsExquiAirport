table 80503 "Aircraft Maintenance Entry"
{
    Caption = 'Aircraft Maintenance Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Code[20])
        {

        }
        field(2; "Aircraft Registration No."; Code[6])
        {
            TableRelation = "Air Craft"."Resgistration Number";
        }
        field(3; "Maintenance Start Date"; DateTime)
        {
            trigger OnValidate()
            begin
                if (Rec."Maintenance End Date" <> 0DT) then
                    CalculateDuration();
            end;
        }
        field(4; "Maintenance End Date"; DateTime)
        {

            trigger OnValidate()
            begin
                if (Rec."Maintenance Start Date" <> 0DT) then
                    CalculateDuration();
            end;
        }
        field(5; "Total Maintenance Time"; Duration)
        {

        }
        field(6; "Description"; Text[100]) { }
        field(7; "Cost Parts"; Integer)
        {
            trigger OnValidate()
            begin
                CalculateDuration();
            end;
        }
        field(8; "Cost Labor"; Integer)
        {
            trigger OnValidate()
            begin
                CalculateDuration();
            end;

        }
        field(9; "Total Cost"; Integer) { }
        field(10; "Maintenance Type"; Text[20])
        {
            TableRelation = Maintenance;
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
}
