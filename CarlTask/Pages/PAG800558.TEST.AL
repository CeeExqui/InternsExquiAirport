page 80558 "Date Calculator"
{
    PageType = Card;
    SourceTable = "Date Calculator Table";
    ApplicationArea = All;
    UsageCategory = Tasks;
    Caption = 'Date Calculator';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Official Date"; Rec."Official Date") { }
                field("Operation"; Rec.Operation) { }
                field(Days; Rec.Days) { }
                field(Weeks; Rec.Weeks) { }
                field(Months; Rec.Months) { }
                field(Years; Rec.Years) { }
                field("Calculated Date"; Rec."Calculated Date") { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Calculate)
            {
                Caption = 'Calculate';
                ApplicationArea = All;
                Image = Calculate;

                trigger OnAction()
                var
                    CALC: Codeunit "Date CALC";
                begin
                    CALC.CalculateDate(Rec);
                    CurrPage.Update();
                end;
            }
        }
    }
}
