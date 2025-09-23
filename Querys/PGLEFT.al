page 80646 "Item Sales Report"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Item Sales LEFT';
    SourceTable = "Item Sales Left Temp";
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ItemNo; Rec.ItemNo) { }
                field(ItemDescription; Rec.ItemDescription) { }
                field(BaseUnit; Rec.BaseUnit) { }
                field(DocumentNo; Rec.DocumentNo) { }
                field(Quantity; Rec.Quantity) { }
            }
        }
    }

    trigger OnOpenPage()
    var
        test: Query "Item Sales Left Join";
        NewRec: Record "Item Sales Left Temp";
    begin
        test.SetFilter(BaseUnit, 'PCS');
        if test.Open then begin
            while test.Read() do begin
                Clear(NewRec);
                NewRec.ItemNo := test.ItemNo;
                NewRec.ItemDescription := test.ItemDescription;
                NewRec.BaseUnit := test.BaseUnit;
                NewRec.DocumentNo := test.DocumentNo;
                NewRec.Quantity := test.Quantity;

                Rec := NewRec;
                Rec.Insert();
            end;
            test.Close();
        end;
    end;
}
