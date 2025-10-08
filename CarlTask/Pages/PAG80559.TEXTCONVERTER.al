page 80559 TextConverter
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = TextConverter;
    InsertAllowed = false;
    DeleteAllowed = false;


    layout
    {
        area(Content)
        {
            group(Input)
            {
                field(InputText; Rec.InputText)
                {
                    ApplicationArea = All;
                }
            }
            group(Output)
            {
                field(IntegerValue; Rec.IntegerValue)
                {
                    ApplicationArea = All;
                }
                field(DecimalValue; Rec.DecimalValue)
                {
                    ApplicationArea = All;
                }
                field(DateValue; Rec.DateValue)
                {
                    ApplicationArea = All;
                }
                field(BooleanValue; Rec.BooleanValue)
                {
                    ApplicationArea = All;
                    Caption = 'Boolean Value (YES/NO)';
                }
            }
            group(CustomerInfo)
            {
                field(CustomerName; Rec.CustomerName)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Convert)
            {
                Caption = 'Text Conversion';
                ApplicationArea = All;
                Image = Print;

                trigger OnAction()
                var
                    textcnv: Codeunit "Text Converter";
                begin
                    if Rec.InputText = '' then
                        Error('Text cannot be empty.');
                    textcnv.ConvertText(Rec);
                    CurrPage.Update();
                end;
            }
            action(Clear)
            {
                Caption = 'Clear Fields';
                ApplicationArea = All;
                Image = Delete;

                trigger OnAction()
                begin
                    Clear(Rec.InputText);
                    Clear(Rec.IntegerValue);
                    Clear(Rec.DecimalValue);
                    Clear(Rec.DateValue);
                    Clear(Rec.BooleanValue);
                    Clear(Rec.CustomerName);
                    Rec.Modify();
                    CurrPage.Update();
                end;
            }
        }
    }

}