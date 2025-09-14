page 80512 "Runway List"
{
    ApplicationArea = All;
    Caption = 'Runway List';
    PageType = List;
    SourceTable = RunWay;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
