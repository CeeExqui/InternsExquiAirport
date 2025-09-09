table 80501 Airline
{
    Caption = 'Airline';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[2])
        {
            trigger OnValidate()
            begin

                if (StrLen("No.") < 2) then
                    Error('Please enter exactly 2 Characters.');

            end;
        }
        field(2; "Name"; Text[50])
        {
            NotBlank = true;
            trigger OnValidate()
            begin
                Callouts();

            end;
        }
        field(3; "Contact Name"; Text[100])
        {
            TableRelation = Contact.Name;


        }
        field(4; "Phone Number"; Text[30])
        {
            TableRelation = Contact."Phone No.";
        }
        field(5; "Total Ammount of Aircraft"; Integer)
        {
            CalcFormula = count("Air Craft" where("Airline No." = field("No.")
            ));
            Caption = 'Total Ammount of Aircraft';
            FieldClass = FlowField;
        }
        field(6; "Callout"; Code[2])
        {
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            clustered = true;
        }
    }

    local procedure Callouts() //TODO why is it local? Local vs protected vs internal vs global.
    begin
        Rec."Callout" := CopyStr(Rec."Name", 1, 2);

    end;


}