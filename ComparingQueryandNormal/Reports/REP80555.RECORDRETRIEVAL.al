report 80555 "GLEntry Record Retrieval"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'G/L Entry Record Retrieval';
    ProcessingOnly = true;

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            RequestFilterFields = "Posting Date", "G/L Account No.";
        }
    }

    var
        GLEntry: Record "G/L Entry";
        Log: Record "GLEntry Retrieval Log";

    trigger OnPreReport()
    begin
        // Clear old Record results
        Log.Reset();
        Log.SetRange(Method, Log.Method::Record);
        Log.DeleteAll();

        if GLEntry.FindSet() then
            repeat
                Log.Init();
                Log."Entry No." := GLEntry."Entry No.";
                Log."Posting Date" := GLEntry."Posting Date";
                Log.Amount := GLEntry.Amount;
                Log.Method := Log.Method::Record;
                Log.Insert();
            until GLEntry.Next() = 0;

        Message('Record retrieval completed. Results stored in Retrieval Log.');
    end;
}
