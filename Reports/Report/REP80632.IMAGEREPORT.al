report 80632 "Image Report"
{
    Caption = 'Image Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = ImageLayout;

    dataset
    {
        dataitem(CompanyInfo; "Company Information")
        {
            column(CompanyName; Name) { }
            column(CompanyLogo; Picture) { }
        }
        dataitem(Item; Item)
        {
            column(ItemNo; "No.") { }
            column(Description; Description) { }
            column(Picture; Picture) { }

            dataitem(ItemLedgerEntry; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = field("No.");
                column(LocationCode; "Location Code") { }
                column(Quantity; Quantity) { }
            }
        }
    }

    rendering
    {
        layout(ImageLayout)
        {
            Type = RDLC;
            LayoutFile = './ReportsLayout/ImageLayout.rdl';
        }
    }
    
}
