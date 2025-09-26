page 80520 "Aircraft FactBox Header"
{
    ApplicationArea = All;
    Caption = 'Aircraft FactBox';
    PageType = CardPart;
    SourceTable = "Air Craft";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Header Information';

                field("Header Dimension"; Rec."Dimension Set ID")
                {

                }
                cuegroup(g1)
                {
                    caption = '';
                    field("Lines Number"; Rec."Lines Count")
                    {
                        applicationArea = all;

                    }

                }

            }
        }
    }

}
//         Ptable: Integer;
//         PsystemId: Guid;


//     procedure SetParent(Ref: RecordRef)
//     var

//         SystemIDField: FieldRef;
//     begin
//         Ptable := Ref.Number;
//         SystemIDField := Ref.Field(Ref.SystemIdNo);
//         PsystemId := SystemIDField.Value;

//     end;

// }
