page 80504 "Run Way Card"
{
    ApplicationArea = All;
    Caption = 'Run Way Card';
    PageType = Card;
    SourceTable = RunWay;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Airport No."; Rec."Airport No.")
                {
                    ToolTip = 'Specifies the value of the Airport No. field.', Comment = '%';
                }
                field("Runway Name"; Rec."Runway Name")
                {
                    ToolTip = 'Specifies the value of the Runway Name field.', Comment = '%';
                }
                field(Width; Rec.Width)
                {
                    ToolTip = 'Specifies the value of the Width field.', Comment = '%';
                }
                field(length; Rec.length)
                {
                    ToolTip = 'Specifies the value of the length field.', Comment = '%';
                }
            }
        }
    }
}
