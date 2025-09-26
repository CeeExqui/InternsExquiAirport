report 80503 "BenchMark Report"
{
    ApplicationArea = All;
    Caption = 'BenchMark Report';
    UsageCategory = Administration;
    DefaultRenderingLayout = MainLayout;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Test_Queries_Report; "Test Queries Report")
        {
            column(ID; "ID") { }
        }
    }
    rendering
    {

        layout(MainLayout)
        {
            Type = RDLC;
            LayoutFile = 'BenchMark.RDL';
        }
    }
    trigger OnPreReport()
    begin
        start := CurrentDateTime();
    end;

    trigger OnPostReport()
    var
        TestQueries: Page "Test Queries Report List";
    begin

        excution_Duration := CurrentDateTime() - start;
        TestQueries.setRepRDur(excution_Duration);
    end;






    var
        Start: DateTime;
        excution_Duration: Duration;
}