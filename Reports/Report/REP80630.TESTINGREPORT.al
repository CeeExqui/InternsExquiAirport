report 80630 MyReport
{
    Caption = 'New REPORT';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = InitialLayout;

    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(TotalINCVAT; "Amount Including VAT") { }
            dataitem(SalesInvoiceLine; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(No_; "No.") { }
                column(Description; Description) { }
                column(ShipmentDate; "Shipment Date") { }
                column(Quantity; Quantity) { }
                column(UnitPrice; "Unit Price") { }
                column(VAT; "VAT %") { }
                column(Line_Amount; "Line Amount") { }

            }
        }
    }

    rendering
    {
        layout(InitialLayout)
        {
            Type = RDLC;
            LayoutFile = './ReportsLayout/MyReport.rdl';
        }

    }

    var
        myInt: Integer;
}