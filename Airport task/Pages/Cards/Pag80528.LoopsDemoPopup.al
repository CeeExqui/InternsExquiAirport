page 80528 "Loops Demo Popup"
{
    ApplicationArea = All;
    Caption = 'Loops Demo Popup';
    PageType = Card;
    SourceTable = "Loops Demo";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Iteration; Iteration) { }
                field(Counter; Counter) { }
                field(CurrentValue; CurrentValue) { }

            }

        }

    }
    actions
    {
        area(Navigation)
        {
            action(Next)
            {
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if (StringHolder.Count = 1) then begin
                        Message('No string left in the loop');
                        exit;
                    end;
                    StringHolder.Removeat(1);
                    CurrentValue := StringHolder.get(1);
                    Iteration += 1;
                    Counter += 1;
                    CurrPage.Update();
                end;

            }
            action(Break)
            {
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Message('Your returned value is %1', StringHolder.get(1));
                    CurrPage.Close();

                end;
            }
            action(Repeat)
            {
                Caption = 'Repeat Iteration';
                Promoted = true;
                PromotedCategory = process;
                trigger OnAction()
                begin
                    Counter += 1;
                end;
            }
        }
    }
    var
        Iteration: Integer;
        Counter: Integer;
        CurrentValue: Text[50];

        StringHolder: List of [Text];


    procedure Looping()
    begin
        Rec.FindFirst();

        StringHolder := Rec.Input.Split(',');
        Iteration := 0;
        Counter := 0;
        CurrentValue := StringHolder.get(1);
        CurrPage.Update();
    end;

    trigger OnOpenPage()
    begin
        Looping();
    end;

}
