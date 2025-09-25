report 80649 "GLEntry Data Retrieval Compare"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Compare Query vs Record Retrieval';
    ProcessingOnly = true;

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            RequestFilterFields = "Posting Date", "G/L Account No.";
        }
    }

    var
        Q: Query "GLEntry Simple Query";
        StartTime: DateTime;
        DurationQuery: Duration;
        DurationRecord: Duration;
        GLEntry: Record "G/L Entry";

    trigger OnPreReport()
    var
        FilterTxt: Text;
    begin
        StartTime := CurrentDateTime();
        if Q.Open then begin
            while Q.Read() do begin
                if Q.EntryNo <> 0 then;
            end;
            Q.Close();
        end;
        DurationQuery := CurrentDateTime() - StartTime;

        StartTime := CurrentDateTime();
        if GLEntry.FindSet() then
            repeat
            until GLEntry.Next() = 0;
        DurationRecord := CurrentDateTime() - StartTime;

        Message(
          'Performance comparison on G/L Entry: Query retrieval:%1  Record retrieval:%2',
          Format(DurationQuery),
          Format(DurationRecord));
    end;
}
