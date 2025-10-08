page 80525 "Evaluation and Flowfield"
{
    ApplicationArea = All;
    Caption = 'Evaluation and Flowfield';
    PageType = Card;
    SourceTable = "Evaluation and Flowfield";
    UsageCategory = Administration;
    DeleteAllowed = false;
    InsertAllowed = false;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(UserInput; Rec.UserInput)
                {
                    ToolTip = 'Specifies the value of the UserInput field.', Comment = '%';
                }
                Field(EnglishToNumeric; Rec.EnglishToNumeric)
                {
                    Caption = 'English To Numeric';

                }

                field("Boolean"; Rec."MyBoolean")
                {
                    ToolTip = 'Specifies the value of the Boolean field.', Comment = '%';
                }
                field("Date"; Rec."MyDate")
                {
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                }
                field("Decimal"; Rec."MyDec")
                {
                    ToolTip = 'Specifies the value of the Decimal field.', Comment = '%';
                }

                field("Integer"; Rec."MyInt")
                {
                    ToolTip = 'Specifies the value of the Integer field.', Comment = '%';
                }

                field(FlowField; Rec.FlowField)
                {
                    ToolTip = 'Specifies the value of the FlowField field.', Comment = '%';
                }

            }
        }
    }

    trigger OnOpenPage()
    begin


        if not Rec.get(1) then begin
            Rec.init();
            Rec.Insert();
        end;
    end;
}
