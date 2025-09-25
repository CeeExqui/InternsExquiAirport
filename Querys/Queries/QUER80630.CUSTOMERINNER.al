query 80630 "Customer Sales With Country"
{
    Caption = 'Customer Sales';
    QueryType = Normal;
    OrderBy = Ascending(Amount);

    elements
    {
        dataitem(Customer; Customer)
        {
            column(CustomerNo; "No.") { }
            column(CustomerName; Name) { }
            column(Country; "Country/Region Code") { }

            dataitem(SalesHeader; "Sales Invoice Header")
            {
                DataItemLink = "Sell-to Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;

                dataitem(SalesLine; "Sales Invoice Line")
                {
                    DataItemLink = "Document No." = SalesHeader."No.";
                    SqlJoinType = InnerJoin;
                    column(Amount; "Line Amount")
                    {
                        Method = Sum;

                    }
                }
            }
        }
    }
}
