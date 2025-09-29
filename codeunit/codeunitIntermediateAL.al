codeunit 80555 "AL Demo Sandbox"
{
    trigger OnRun()
    var
        Cust: Record Customer;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        MyDate: Date;
        MyTime: Time;
        MyDateTime: DateTime;
        NewDate: Date;
        TextValue: Text;
        DecimalValue: Decimal;
        i: Integer;
    begin
        // VALIDATION METHODS
        Cust.Init(); // Clears fields and initializes record
        Cust.Validate(Name, 'Test Customer'); // Runs OnValidate trigger
        Cust.TestField(Name); // Ensures field is not blank
        if Cust."No." = '' then
            Cust.FieldError("No.", 'Customer No. is required.');

        // DATE & TIME METHODS
        MyDate := Today();
        MyTime := Time();
        MyDateTime := CurrentDateTime();
        Message('Today=%1, Time=%2, CurrentDateTime=%3, WorkDate=%4',
            MyDate, MyTime, MyDateTime, WorkDate());

        Message('Date2DMY=%1 / Date2DWY=%2',
            Date2DMY(MyDate, 1), Date2DWY(MyDate, 1));
        NewDate := DMY2Date(29, 9, 2025);
        Message('DMY2Date=%1', NewDate);
        NewDate := DWY2Date(1, 40, 2025); // 40th week of 2025
        Message('DWY2Date=%1', NewDate);

        Message('CalcDate 1M+10D from today = %1', CalcDate('<+1M+10D>', Today()));

        // DATA CONVERSION & FORMATTING
        DecimalValue := Round(1234.56789, 0.01, '=');
        Message('Rounded=%1', DecimalValue);

        TextValue := Format(Today(), 0, '<Day,2>/<Month,2>/<Year4>');
        Message('Formatted date=%1', TextValue);

        Evaluate(MyDate, '2025-09-29'); // Text → Date
        Message('Evaluated date=%1', MyDate);

        // FLOWFIELD & SIFT METHODS
        if SalesHeader.FindFirst() then begin
            SalesHeader.CalcFields("Amount"); // FlowField calculation
            Message('Header %1 amount=%2', SalesHeader."No.", SalesHeader."Amount");

            SalesLine.SetRange("Document No.", SalesHeader."No.");
            SalesLine.CalcSums("Line Amount");
            Message('Total line amount=%1', SalesLine."Line Amount");
        end;
        // CONTROL STATEMENTS
        repeat
            i += 1;
        until i >= 3;

        i := 0;
        while i < 3 do begin
            i += 1;
        end;

        for i := 1 to 3 do
            Message('For loop i=%1', i);

        case i of
            1:
                Message('Case: One');
            2:
                Message('Case: Two');
            else
                Message('Case: Else');
        end;

        // CRUD METHODS
        Cust.Init();
        Cust."No." := 'TEST01';
        Cust.Name := 'Inserted Customer';
        Cust.Insert(true);

        Cust.Name := 'Modified Customer';
        Cust.Modify();

        Cust.Delete(); // Single delete

        // ModifyAll/DeleteAll
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.ModifyAll(Quantity, 0);
        SalesLine.DeleteAll();


        // FILTERING METHODS
        SalesHeader.SetRange("Posting Date", Today());
        Message('Filter = %1', SalesHeader.GetFilters());

        SalesHeader.CopyFilters(SalesLine); // copy filters between records
        SalesHeader.FilterGroup(2); // special filter group 
        SalesHeader.Reset(); // clears filters

        SalesHeader.Mark(true);
        SalesHeader.ClearMarks();
        SalesHeader.MarkedOnly(true);

        // FLOW CONTROL METHODS
        if SalesHeader.FindFirst() then
            repeat
            // Move through records
            until SalesHeader.Next() = 0;

        // INTER-OBJECT COMMUNICATION
        Codeunit.Run(Codeunit::"Cust-Check Cr. Limit", Cust);
    end;
}
