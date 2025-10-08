page 80521 "Test Queries Report List"
{
    ApplicationArea = All;
    Caption = 'Test Queries Report List';
    PageType = List;
    SourceTable = "Test Queries Report";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field.', Comment = '%';
                }
                field(Users; Rec.SystemCreatedBy) { }

            }
            group(footer)
            {
                Caption = '';
                field("Direct Report Duration"; RepRDur)
                {
                    Editable = false;
                }
                field("Query Report Duration"; RepQDur)
                {
                    Editable = false;

                }
            }
        }


    }
    actions
    {
        area(Navigation)
        {
            action("Add Records")
            {
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    Records: Page "Number of record";
                    Dummy: Record "Test queries report";
                begin
                    if Records.RunModal() = Action::OK then begin
                        NB := Records.GetNB();
                        Target := NB + Rec.ID;

                        if (Rec.ID < target) then
                            if (Rec.ID > 0) then Rec.FindLast();
                        repeat

                            Rec.Init();
                            Rec.ID := Rec.ID + 1;
                            Rec.Insert();
                        until Rec.ID = Target;
                    end;
                end;

            }
            action("Delete All")
            {
                Promoted = true;
                PromotedCategory = process;
                trigger OnAction()
                begin
                    Rec.DeleteAll(True);
                end;
            }
        }
        area(Processing)
        {
            action("Direct Report")
            {
                Promoted = true;
                trigger OnAction()
                begin
                    CalcRDur();
                end;
            }
            Action("Query Report")
            {
                Promoted = true;
                trigger OnAction()

                begin
                    CalcQDur();

                end;

            }
            Action("Query Report And Direct Report")
            {
                Promoted = true;
                trigger OnAction()
                begin
                    CalcQDur();
                    CalcRDur();

                end;

            }
            Action("Hide Records(5s)")
            {

                Promoted = true;
                PromotedCategory = process;
                trigger OnAction()
                var
                    FlagCode: Codeunit "Feature Flag Testing";
                    Tempref: RecordRef;
                    MyGuid: Guid;
                begin
                    CurrPage.Update();
                end;
            }



        }
    }
    var
        NB: Integer;
        Target: Integer;
        RepRDur: duration;
        RepQDur: duration;

        UserRecord: Record "User";

    procedure setRepRDur(totalduration: duration)
    begin
        RepRDur := totalduration;
        message('The Duration of the Report : %1', RepRDur);
    end;

    procedure setRepQDur(totalduration: duration)
    begin
        RepQDur := totalduration;
        message('The Duration of the Query: %1', RepQDur);
    end;


    procedure CalcRDur()
    Var
        RepR: Report "BenchMark Report";
    begin
        RepR.RunModal();

    end;

    procedure CalcQDur()

    Var
        RepQ: Report "BenchMark Query";
    begin
        RepQ.RunModal();

    end;



    //     trigger OnOpenPage()

    //     var
    //         FlagCode: Codeunit "Feature Flag Testing";
    //         MyGuid: Guid;
    //         Startdate: DateTime;
    //         grp: Integer;
    //     begin
    //  Startdate := CurrentDateTime() - 999999999;


    //         Rec.FilterGroup(2);
    //         rec.setview := FlagCode.HideRecords(Startdate, CurrentDateTime(), UserSecurityId());
    //         Rec.FilterGroup(0);
    //     end;



}
