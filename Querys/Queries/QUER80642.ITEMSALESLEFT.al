query 80642 "Item Sales Left Join"
{
    Caption = 'Item Sales (Left Join)';
    QueryType = Normal;

    elements
    {
        dataitem(Item; Item)
        {
            column(ItemNo; "No.") { }
            column(ItemDescription; Description) { }
            column(BaseUnit; "Base Unit of Measure") { }

            dataitem(SalesLine; "Sales Invoice Line")
            {
                DataItemLink = "No." = Item."No.";
                SqlJoinType = LeftOuterJoin;

                column(DocumentNo; "Document No.") { }
                column(Quantity; Quantity)
                {
                    Method = Sum;
                }
            }
        }
    }
}
