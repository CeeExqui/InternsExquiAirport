table 80504 RunWay
{
    Caption = 'RunWay';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Runway Name"; Code[50]) { } //TODO PK
        field(2; "Width"; Decimal)
        {
            MinValue = 0;

        }
        field(3; "length"; Decimal)
        {
            MinValue = 0;

        }
        field(4; "Airport No."; Code[3])
        {
            NotBlank = true;
            TableRelation = "Airport"."No.";
        }

    }
    keys
    {
        key(PK; "Runway Name")
        {
            Clustered = true;
        }
    }
}
