table 80502 "Air Craft"
{
    Caption = 'Air Craft';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Resgistration Number"; Code[6])
        {

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
    }
}
