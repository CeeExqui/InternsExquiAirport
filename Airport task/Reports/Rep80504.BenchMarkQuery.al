report 80504 "BenchMark Query"
{
    ApplicationArea = All;
    Caption = 'BenchMark Query';
    UsageCategory = Administration;
    DefaultRenderingLayout = MainLayout;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Integer; "Integer")
        {
            column(ID; BenchMark.ID)
            {


            }
            trigger OnPreDataItem()
            begin
                BenchMark.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if not BenchMark.Read() then CurrReport.break();
            end;
        }

    }
    rendering
    {

        layout(MainLayout)
        {
            Type = RDLC;
            LayoutFile = 'BenchMark2.RDL';
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
        TestQueries.setRepQDur(excution_Duration);
    end;





    var
        Start: DateTime;
        excution_Duration: Duration;

    var
        BenchMark: query "BenchMark Query";
}
