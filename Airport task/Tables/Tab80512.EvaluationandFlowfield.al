table 80512 "Evaluation and Flowfield"
{
    Caption = 'Evaluation and Flowfield';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "ID"; Integer)
        {
            Caption = '';
            AutoIncrement = true;
        }
        field(2; "UserInput"; Text[50])
        {

            trigger OnValidate()
            begin
                GlobalEval();
            end;
        }

        field(3; "MyInt"; Integer) { }
        field(4; "MyDec"; Decimal) { }
        field(5; "MyDate"; Date) { }
        field(6; "MyBoolean"; Boolean) { }
        field(7; "FlowField"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where(Name = FIELD(UserInput)));
        }
        field(8; EnglishToNumeric; Text[100])
        {
            trigger OnValidate()
            begin
                NumericConversion();
            end;
        }
    }
    keys
    {
        key(PK; "ID")
        {
            Clustered = true;
        }
    }


    procedure GlobalEval()
    begin
        if (Evaluate(MyInt, UserInput)) then;
        if (Evaluate(MyDec, UserInput)) then;
        if (Evaluate(MyDate, UserInput)) then;
        if (Evaluate(MyBoolean, UserInput)) then;
        CalcFields(FlowField);

    end;

    procedure NumericConversion()
    var
        StringHolder: List of [Text];
        IntHolder: List of [Integer];
        CurrFlag: Integer;
        PrevFlag: Integer;
        Total: Integer;
        i: Integer;
        PlaceHolder: Text[100];
        dict: Dictionary of [Text, Integer];

    begin
        Dict.Add('one', 1);
        Dict.Add('two', 2);
        Dict.Add('three', 3);
        Dict.Add('four', 4);
        Dict.Add('five', 5);
        Dict.Add('six', 6);
        Dict.Add('seven', 7);
        Dict.Add('eight', 8);
        Dict.Add('nine', 9);
        Dict.Add('ten', 10);
        Dict.Add('eleven', 11);
        Dict.Add('twelve', 12);
        Dict.Add('thirteen', 13);
        Dict.Add('fourteen', 14);
        Dict.Add('fifteen', 15);
        Dict.Add('sixteen', 16);
        Dict.Add('seventeen', 17);
        Dict.Add('eighteen', 18);
        Dict.Add('nineteen', 19);
        Dict.Add('twenty', 20);
        Dict.Add('thirty', 30);
        Dict.Add('forty', 40);
        Dict.Add('fifty', 50);
        Dict.Add('sixty', 60);
        Dict.Add('seventy', 70);
        Dict.Add('eighty', 80);
        Dict.Add('ninety', 90);
        Dict.Add('hundred', 100);
        Dict.Add('thousand', 1000);
        Dict.Add('million', 1000000);

        PlaceHolder := Rec.EnglishToNumeric.ToLower();
        PlaceHolder := PlaceHolder.Replace('and', '');
        while StrPos(PlaceHolder, '  ') > 0 do
            PlaceHolder := PlaceHolder.Replace('  ', ' ');

        StringHolder := PlaceHolder.Split();
        i := 2;
        if (StringHolder.Count() = 0) then exit;
        Total := dict.get(StringHolder.get(1));
        While i <= StringHolder.Count() do begin
            PrevFlag := dict.get(StringHolder.get(i - 1));
            CurrFlag := dict.get(StringHolder.get(i));
            if (CurrFlag > PrevFlag) Then
                total *= CurrFlag
            else begin

                IntHolder.add(Total);
                Total := CurrFlag;
            end;
            i += 1;
        end;
        i := 1;
        While i <= IntHolder.Count() do begin
            Total += IntHolder.get(i);
            i += 1;
        end;
        Message(total.ToText());
    end;

    // procedure WordToValue(Word: Text): Integer
    // begin
    //     case Word of
    //         'one':
    //             exit(1);
    //         'two':
    //             exit(2);
    //         'three':
    //             exit(3);
    //         'four':
    //             exit(4);
    //         'five':
    //             exit(5);
    //         'six':
    //             exit(6);
    //         'seven':
    //             exit(7);
    //         'eight':
    //             exit(8);
    //         'nine':
    //             exit(9);
    //         'ten':
    //             exit(10);
    //         'eleven':
    //             exit(11);
    //         'twelve':
    //             exit(12);
    //         'thirteen':
    //             exit(13);
    //         'fourteen':
    //             exit(14);
    //         'fifteen':
    //             exit(15);
    //         'sixteen':
    //             exit(16);
    //         'seventeen':
    //             exit(17);
    //         'eighteen':
    //             exit(18);
    //         'nineteen':
    //             exit(19);
    //         'twenty':
    //             exit(20);
    //         'thirty':
    //             exit(30);
    //         'forty':
    //             exit(40);
    //         'fifty':
    //             exit(50);
    //         'sixty':
    //             exit(60);
    //         'seventy':
    //             exit(70);
    //         'eighty':
    //             exit(80);
    //         'ninety':
    //             exit(90);
    //         'hundred':
    //             exit(100);
    //         'thousand':
    //             exit(1000);
    //         'million':
    //             exit(1000000);
    //         else
    //             exit(0);
    //     end;
    // end;
}