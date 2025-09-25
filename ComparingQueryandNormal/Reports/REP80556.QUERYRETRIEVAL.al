report 80556 "GLEntry Query Retrieval"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'G/L Entry Query Retrieval';
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
        Log: Record "GLEntry Retrieval Log";

    trigger OnPreReport()
    begin
        // Clear old Query results
        Log.Reset();
        Log.SetRange(Method, Log.Method::Query);
        Log.DeleteAll();

        if Q.Open then begin
            while Q.Read() do begin
                Log.Init();
                Log."Entry No." := Q.EntryNo;
                Log."Posting Date" := Q.PostingDate;
                Log.Amount := Q.Amount;
                Log.Method := Log.Method::Query;
                Log.Insert();
            end;
            Q.Close();
        end;

        Message('Query retrieval completed. Results stored in Retrieval Log.');
    end;
}
