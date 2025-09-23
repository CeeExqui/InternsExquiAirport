page 80631 "Customer Sales Country Viewer"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Customer Inner Join Sales';

    layout
    {
        area(content)
        {
            group(Summary)
            {
                field(CustomerNo; custNo)
                { Caption = 'Customer No.'; Editable = false; }
                field(CustomerName; custName) { Caption = 'Customer Name'; Editable = false; }
                field(Country; country) { Caption = 'Customer Country'; Editable = false; }
                field(TotalSales; totalSales) { Caption = 'Total Sales'; Editable = false; }
            }
        }
    }

    var
        Q: Query "Customer Sales With Country";
        custNo: Code[20];
        custName: Text[100];
        country: Code[10];
        totalSales: Decimal;

    trigger OnOpenPage()
    begin
        if Q.Open then begin
            while Q.Read() do begin
                custNo := Q.CustomerNo;
                custName := Q.CustomerName;
                country := Q.Country;
                totalSales := Q.Amount;
            end;
            Q.Close();
        end;
    end;
}
