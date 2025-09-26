page 80516 "New cost Card"
{
    ModifyAllowed = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    ApplicationArea = All;
    Caption = 'New cost Card';
    PageType = ListPlus;
    SourceTable = "Aircraft Maintenance Entry";
    Extensible = false;
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Old total cost"; Rec."Total Cost")
                {
                    Editable = false;

                }
                field("New cost"; NewCost)
                {

                }
            }
        }

    }

    actions
    {

        area(navigation)
        {
            action("Save")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;

                trigger OnAction()
                var
                    Answer: Boolean;

                begin
                    Answer := Dialog.Confirm('Are you sure you want to save?', true, false);
                    if (Answer = true) then Rec."Total Cost" := Newcost;
                    Rec.Modify();
                end;

            }
        }
    }
    var
        NewCost: Decimal;
}
