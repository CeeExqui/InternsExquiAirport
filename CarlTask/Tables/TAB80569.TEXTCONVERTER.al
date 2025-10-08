table 80569 TextConverter
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; InputText; Text[100])
        {
            Caption = 'Input Text';
        }
        field(3; IntegerValue; Integer)
        {
            Caption = 'Integer Value';
            Editable = false;
            minValue = 0;
        }
        field(4; DecimalValue; Decimal)
        {
            Caption = 'Decimal Value';
            Editable = false;
            minValue = 0;
        }
        field(5; DateValue; Date)
        {
            Caption = 'Date Value';
            Editable = false;
        }
        field(6; CustomerName; Text[100])
        {
            Caption = 'Customer Name';
            Editable = false;
        }
        field(7; BooleanValue; Boolean)
        {
            Caption = 'Boolean Value';
            Editable = false;
        }

    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}