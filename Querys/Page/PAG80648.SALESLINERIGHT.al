page 80648 "Sales Lines Report"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Sales Lines RIGHT';
    SourceTable = "Sales Lines RIGHT TEMP";
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(DocumentNo; Rec.DocumentNo) { }
                field(ItemNo; Rec.ItemNo) { }
                field(Quantity; Rec.Quantity) { }
                field(ItemDescription; Rec.ItemDescription) { }
                field(BaseUnit; Rec.BaseUnit) { }
            }
        }
    }

    trigger OnOpenPage()
    var
        Q: Query "Sales Lines Right Join";
        NewRec: Record "Sales Lines RIGHT TEMP";
        Counter: Integer;
    begin
        Counter := 1;
        if Q.Open then begin
            while Q.Read() do begin
                Clear(NewRec);
                NewRec.EntryNo := Counter; 
                NewRec.DocumentNo := Q.DocumentNo;
                NewRec.ItemNo := Q.ItemNo;
                NewRec.Quantity := Q.Quantity;
                NewRec.ItemDescription := Q.ItemDescription;
                NewRec.BaseUnit := Q.BaseUnit;

                if (Q.DocumentNo <> '') or (Q.ItemNo <> '') then begin
                    Rec := NewRec;
                    Rec.Insert();
                    Counter += 1;
                end;
            end;
            Q.Close();
        end;
    end;
}
