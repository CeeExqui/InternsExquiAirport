page 80527 "Loops Demo"
{
    ApplicationArea = All;
    Caption = 'Loops Demo';
    PageType = Card;
    SourceTable = "Loops Demo";
    UsageCategory = Administration;
    layout
    {
        area(Content)
        {
            group(Loop)
            {
                Caption = 'General';
                field(Input; REC.Input)
                {

                    trigger OnValidate()
                    var
                        Popup: Page "Loops Demo Popup";
                    begin

                        Commit();
                        Popup.setRecord(Rec);
                        Popup.RunModal();
                    end;
                }

            }
            group(CLE)
            {
                field(SelectedField; Rec.ChosenFieldFilter)
                {
                    trigger OnValidate()
                    begin

                    end;
                }
                field(FilterValue; Rec.FilterValue)
                {

                }
                field(SetFilter; REc.SetOrder) { }



            }

        }


    }
    actions
    {
        area(Navigation)
        {
            Action(PickField)
            {
                Caption = 'Pick Field';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    FilterSelector.AddRecord('CLE', CLE);
                    FilterSelector.RunModal();
                    //CLE.SetView(FilterSelector.GetView('CLE'));

                end;
            }
            Action(OpenCLE)
            {
                caption = 'Open CLE';
                Promoted = true;
                PromotedCategory = process;

                trigger onaction()
                var

                    Clepage: page "Customer Ledger Entries";

                    FinalView: Text[200];
                    ViewString: Label 'VERSION(1) SORTING(%1) ORDER(Descending) WHERE("%2"=FILTER(%3))';

                begin
                    // rr.Open(Database::"Cust. Ledger Entry");


                    // rr.CurrentKeyIndex(Rec.SetOrder);
                    // Message(RR.getview());
                    // cle.SetView(rr.GetView());
                    // cle.Ascending(true);
                    // Message(cle.CurrentKey);
                    // rr.close();






                    //clepage.SetTableView(cle);

                    // FinalView := strsubstno(ViewString, REC.SetOrder, REC.ChosenFieldFilter, REC.FilterValue);
                    // Cle.SetView(FinalView);


                    // Clepage.SetTableView(Cle);
                    // message(cle.CurrentKey);
                    clepage.run();

                end;
            }
        }

    }
    var
        SelectedField: Text[50];
        FilterSelector: FilterPageBuilder;
        CLE: Record "Cust. Ledger Entry";
        IsEditable: boolean;



    trigger OnOpenPage()
    begin
        // REC.DeleteAll();

        if not Rec.get() then begin
            Rec.init();
            Rec.Insert();
        end;



    end;
}
