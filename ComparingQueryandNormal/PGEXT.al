pageextension 80639 "GLEntry List Ext" extends "General Ledger Entries"
{
    actions
    {
        addlast(Reporting)
        {
            action(RunCompareReport)
            {
                Caption = 'Compare Query vs Record';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Report.RunModal(Report::"GLEntry Data Retrieval Compare");
                end;
            }
        }
    }
}
