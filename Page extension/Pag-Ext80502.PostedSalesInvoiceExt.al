pageextension 80502 "Posted Sales Invoice Ext" extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Print)
        {
            action("Print Report")
            {
                ApplicationArea = ALL;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SalesInvoiceHeader: Record "Sales Invoice Header";
                begin
                    SalesInvoiceHeader.SetRange("No.", Rec."No.");
                    report.RunModal(report::"Posted Sales Invoice Report", true, false, SalesInvoiceHeader);

                end;

            }
        }


    }
}