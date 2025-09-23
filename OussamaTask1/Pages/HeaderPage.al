page 80550 "Request Type List"
{
    PageType = List;
    SourceTable = "Request Type";
    ApplicationArea = All;
    Caption = 'Request Types';
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec."Code") { }
                field(Description; Rec.Description) { }
                field("Total Amount"; Rec."Total Amount") { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenRequest)
            {
                Caption = 'Open Request';
                ApplicationArea = All;
                Image = Document;

                trigger OnAction()
                var
                    NewHeader: Record "Document Header";
                    LastHeader: Record "Document Header";
                    NextNo: Integer;
                begin
                    // find last request number
                    if LastHeader.FindLast() then
                        NextNo := EvaluateInt(CopyStr(LastHeader."No.", 4, MaxStrLen(LastHeader."No."))) + 1
                    else
                        NextNo := 1;

                    NewHeader.Init();
                    NewHeader."No." := 'REQ' + PadStr(Format(NextNo), 5, '0');
                    NewHeader."Request Type code" := Rec."Code";
                    NewHeader.Description := Rec.Description;
                    NewHeader."Posting Date" := Today();
                    NewHeader.Insert(true);

                    Page.Run(Page::"My Document", NewHeader);
                end;
            }
        }
    }
    local procedure EvaluateInt(Value: Text): Integer
    var
        Result: Integer;
    begin
        if not Evaluate(Result, Value) then
            Result := 0;
        exit(Result);
    end;

}

