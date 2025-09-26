table 80510 "Error table"
{
    Caption = 'Error table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "test"; Integer)
        {
            Caption = '';

            trigger onvalidate()
            begin
                if (Rec.test < 1) then Error('Enter a value bigger than 1');
            end;
        }
        field(2; "Test 2"; Integer)
        {

            trigger OnValidate()
            begin
                if (Rec."Test 2" < 1) then FieldError("Test 2", 'must have a value bigger than 1');
            end;
        }

    }
}
