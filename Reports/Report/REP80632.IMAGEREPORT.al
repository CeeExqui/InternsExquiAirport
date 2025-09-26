report 80632 "Image Report"
{
    Caption = 'Image Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = ImageLayout;


    dataset
    {
        dataitem(Item; Item)
        {
            column(ItemNo; "No.") { }
            column(Description; Description) { }
            column(Picture; Picture) { }
            column(LogoPicture; companyinfo.Picture) { }
            column(CpmpanyName; CompanyName)
            { }
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
    var
        CompanyInfo: Record "Company Information";
        CompanyName: Text[100];

    trigger OnPreReport()
    begin
        if CompanyInfo.Get() then begin
            CompanyName := CompanyInfo.Name;
            CompanyInfo.CalcFields(Picture);
        end;
    end;


}
