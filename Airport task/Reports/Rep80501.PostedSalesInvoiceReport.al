report 80501 "Posted Sales Invoice Report"
{
    ApplicationArea = All;
    Caption = 'Posted Sales Invoice Report';
    UsageCategory = Administration;
    DefaultRenderingLayout = InitialLayout;
    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";

            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(No_; "No.")
                {
                }
                column(Description; Description)
                {
                }
                column(Shipment_Date; "Shipment Date")
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Unit_Price; "Unit Price")
                {
                }
                column(VAT__; "VAT %")
                {
                }
                column(Line_Amount; "Line Amount")
                {
                }
            }
        }
    }

    rendering
    {
        layout(InitialLayout)
        {

            type = RDLC;
            LayoutFile = 'test.RDL';
        }
    }
}
