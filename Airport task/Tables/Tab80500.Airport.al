table 80500 Airport
{
    CaptionML = ENU = 'Airport', ESP = 'Aeropuerto', FRA = 'Aéroport';

    fields
    {
        field(1; "No."; Code[3])
        {
            CharAllowed = 'AZ';
            NotBlank = true;
            trigger OnValidate()
            begin

                if (StrLen("No.") < 3) then begin
                    Error('Please enter exactly 3 Characters');
                end;
            end;
        }
        field(2; Name; Text[50])
        {
        }

        field(3; "Post Code"; Code[20])
        {
            TableRelation = "Post Code".Code;
            NotBlank = true;
        }

        field(4; "City"; Text[30])
        {
            Caption = 'City';
            NotBlank = true;
            OptimizeForTextSearch = true;
            TableRelation = if ("Post Code" = const('')) "Post Code".City
            else
            if ("Post Code" = filter(<> '')) "Post Code".City where("Code" = field("Post Code"));
            ValidateTableRelation = true;
            ToolTip = 'Specifies the customer''s city.';
        }



        field(5; OperatingStatus; Enum "Operating Status") { }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }


    }

}