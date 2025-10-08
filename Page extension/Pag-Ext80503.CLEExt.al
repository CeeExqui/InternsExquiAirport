pageextension 80503 "CLE Ext" extends "Customer Ledger Entries"
{

    trigger OnOpenPage()
    var
        rr: RecordRef;
        FinalView: Text[200];
        ViewString: Label 'VERSION(1) SORTING(%1) ORDER(Descending) WHERE("%2"=FILTER(%3))';
        LoopTable: Record "Loops Demo";
    begin
        LoopTable.get();

        FinalView := strsubstno(ViewString, LoopTable.SetOrder, LoopTable.ChosenFieldFilter, LoopTable.FilterValue);

        // rr.gettable(REc);
        //rr.CurrentKeyIndex(LoopTable.SetOrder);
        //Message(RR.getview());
        // Rec.SetView(rr.GetView());
        // Rec.Ascending(true);
        //Message(REc.CurrentKey);

        Rec.SetView(FinalView);
        Message(Rec.GetView());
        Message(REc.CurrentKey);


        exit;


    end;


}
