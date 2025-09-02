table 80502 "Air Craft"
{
    Caption = 'Air Craft';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Resgistration Number"; Code[6])
        {
            trigger OnValidate()
            begin
                if (Rec."Resgistration Number" <> xRec."Resgistration Number") then Rec."Resgistration Number" := xRec."Resgistration Number"
            end;

        }
        field(2; "Model"; Text[50]) { }
        field(3; "Manufactorer"; Text[50])
        {
            TableRelation = "Manufacturer".Code;
        }
        field(4; "People Capacity"; Integer)
        {

        }
        field(5; "Capacity Cargo"; Decimal)
        {


        }
        field(6; "Cargo Unit of Measurement"; Text[20])
        {
            TableRelation = "Unit of Measure".Code;
        }
        field(7; "Airline No."; Code[2])
        {
            TableRelation = Airline."No.";
        }
        field(8; "Total maintenance Cost"; Integer)
        {
            FieldClass = FlowField;

            CalcFormula = sum("Aircraft Maintenance Entry"."Total Cost" where("Aircraft Registration No." = field("Resgistration Number")));
        }
        field(9; "Last Maintenance Date"; DateTime)
        {
            FieldClass = FlowField;
            CalcFormula = Max("Aircraft Maintenance Entry"."Maintenance End Date" WHERE("Aircraft Registration No." = field("Resgistration Number")));
        }
    }
}
