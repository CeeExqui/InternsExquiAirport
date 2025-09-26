page 80523 "Aircraft FactBox Lines"
{

    ApplicationArea = All;
    Caption = 'Aircraft FactBox Lines';
    PageType = CardPart;
    SourceTable = "Aircraft Maintenance Entry";
    UsageCategory = Administration;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Dimension Value"; Rec."Dimension Set ID")
                {
                    ToolTip = 'Specifies the value of the Dimension Value field.', Comment = '%';
                }
            }
        }
    }



}
