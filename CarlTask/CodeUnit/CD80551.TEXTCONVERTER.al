codeunit 80551 "Text Converter"
{
    procedure ConvertText(var Rec: Record TextConverter)
    var
        InputText: Text;
        int: Integer;
        dec: Decimal;
        dt: Date;
    begin
        InputText := Rec.InputText;
        // Convert to Integer
        if ConvertToInteger(InputText, int) then begin
            Rec."IntegerValue" := int;
        end;
        // Convert to Decimal
        if ConvertToDecimal(InputText, dec) then begin
            Rec."DecimalValue" := dec;
        end;
        // Convert to Date
        if ConvertToDate(InputText, dt) then begin
            Rec."DateValue" := dt;
        end;
        // Fetch Customer Name
        FindCustomerName(InputText, Rec);
        // Convert to Boolean
        ConvertToBoolean(InputText, Rec);
        Rec.Modify();
    end;

    local procedure IsNumeric(InputText: Text[250]): Boolean
    var
        int: Integer;
        Character: Char;
    begin
        for int := 1 to StrLen(InputText) do begin
            Character := InputText[int];
            if not (Character in ['0' .. '9']) then
                exit(false);
        end;
        exit(true);
    end;

    local procedure CreateDate(Day: Integer; Month: Integer; Year: Integer; var ResultDate: Date): Boolean
    begin
        if (Day > 0) and (Day <= 31) and (Month > 0) and (Month <= 12) and (Year > 1900) and (Year < 9999) then begin
            ResultDate := DMY2Date(Day, Month, Year);
            exit(true);
        end;
        exit(false);
    end;

    local procedure ConvertToDecimal(InputText: Text[250]; var ResultDecimal: Decimal): Boolean
    var
        Text12: Text[250];
    begin
        Text12 := InputText;
        Text12 := DelChr(Text12, '=', ',');

        if Evaluate(ResultDecimal, Text12) then
            exit(true);

        exit(false);
    end;


    procedure FindCustomerName(TextValue: Text; var Rec: Record TextConverter): Boolean
    var
        Cust: Record Customer;
    begin
        // Clear previous customer results
        Clear(Rec.CustomerName);
        if Cust.Get(TextValue) then begin
            Rec.CustomerName := Cust.Name;
            exit(true);
        end;
        Cust.Reset();
        Cust.SetFilter(Name, '*' + TextValue + '*');
        if Cust.FindFirst() then begin
            Rec.CustomerName := Cust.Name;
            exit(true);
        end;

        Cust.Reset();
        Cust.SetFilter(Name, '@*' + TextValue + '*');
        if Cust.FindFirst() then begin
            Rec.CustomerName := Cust.Name;
            exit(true);
        end;

        // Customer not found
        exit(false);
    end;

    procedure ConvertToDate(InputText: Text; var Result: Date): Boolean
    var
        dt: Date;
        Day: Integer;
        Month: Integer;
        Year: Integer;
        DateText: Text;
    begin
        if StrPos(InputText, ',') > 0 then
            exit(false);
        if (StrLen(InputText) = 4) and IsNumeric(InputText) then begin
            if Evaluate(Month, CopyStr(InputText, 1, 1)) and
               Evaluate(Year, CopyStr(InputText, 2, 3)) then begin
                if Year < 100 then
                    Year := 2000 + Year
                else
                    Year := 1000 + Year;
                Day := 1;

                if (Month >= 1) and (Month <= 12) then begin
                    if CreateDate(Day, Month, Year, Result) then
                        exit(true);
                end;
            end;
        end;
        if Evaluate(dt, InputText) then begin
            Result := dt;
            exit(true);
        end;

        exit(false);
    end;

    procedure ConvertToInteger(TextValue: Text; var Result: Integer): Boolean
    var
        temptext: Text;
    begin
        temptext := TextValue;
        if isNumeric(temptext) then begin
            if Evaluate(Result, temptext) then
                exit(true);
        end;
        exit(false);
    end;

    procedure ConvertToBoolean(InputText: Text; var Rec: Record TextConverter)
    var
        CleanText: Text[100];
    begin
        Clear(Rec.BooleanValue);
        CleanText := LowerCase(Trim(InputText));
        if (CleanText = 'yes') or (CleanText = 'y') or (CleanText = 'true') or (CleanText = '1') then begin
            Rec.BooleanValue := true;
            exit;
        end;
        if (CleanText = 'no') or (CleanText = 'n') or (CleanText = 'false') or (CleanText = '0') then begin
            Rec.BooleanValue := false;
            exit;
        end;
        Rec.BooleanValue := false;
    end;

    local procedure Trim(InputText: Text): Text
    begin
        exit(DelChr(InputText, '<>', ' '));
    end;
}