query 80641 "Sales Lines Right Join"
{
    Caption = 'Sales Lines (Right Join)';
    QueryType = Normal;
    
    elements
    {
        dataitem(SalesLine; "Sales Invoice Line")
        {
            column(DocumentNo; "Document No.") { }
            column(ItemNo; "No.") { }
            column(Quantity; Quantity)
            {
                Method = Sum;
            }
            dataitem(Item; Item)
            {
                DataItemLink = "No." = SalesLine."No.";
                SqlJoinType = RightOuterJoin;

                column(ItemDescription; Description) { }
                column(BaseUnit; "Base Unit of Measure") { }
            }
        }
    }
}
