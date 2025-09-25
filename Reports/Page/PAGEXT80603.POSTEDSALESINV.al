pageextension 80603 "Posted Sales Invoice Ext" extends "Posted Sales Invoice"
{
    actions
    {
        addlast(Reporting)
        {
            action(PrintMyReport)
            {
                ApplicationArea = All;
                Caption = 'Print My Report';
                Image = Print;

                trigger OnAction()
                var
                    InvHeader: Record "Sales Invoice Header";
                begin
                    InvHeader.SetRange("No.", Rec."No.");
                    Report.RunModal(Report::"MyReport", true, false, InvHeader);
                end;
            }
        }
    }
}
