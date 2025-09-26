query 80500 "Description Dynamic Filter"
{
    Caption = 'Description Dynamic Fitler';
    QueryType = Normal;


    elements
    {

        dataitem(SalesHeader; "Sales Header")
        {
            column("CompanyNo"; "No.")
            {
                Caption = 'Company Number';
            }
            column("Name"; "Sell-to Customer Name")
            {

            }
            column("PostingDate"; "Posting Date") { }
            dataitem(SalesLines; "Sales Line")
            {

                DataItemLink = "Document No." = SalesHeader."No.",
                                "Document Type" = SalesHeader."Document Type";

                //DataItemTableFilter = "Description" = Filter('%1', desc);

                column("Description"; Description) { }
                column(Quantity; Quantity)
                {
                }
                column(UnitPrice; "Unit Price")
                {
                }
                column(VAT; "VAT %")
                {
                }
                column(LineAmount; "Line Amount")
                {
                }

                column(Count)
                {
                    Method = Count;
                }


            }

        }
    }
    var
        SumTotal: decimal;
}
