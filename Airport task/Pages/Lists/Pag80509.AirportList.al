page 80509 "Airport List"
{
    ApplicationArea = All;
    Caption = 'Airport List';
    PageType = List;
    SourceTable = Airport;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(OperatingStatus; Rec.OperatingStatus)
                {
                    ToolTip = 'Specifies the value of the OperatingSatus field.', Comment = '%';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ToolTip = 'Specifies the value of the Post Code field.', Comment = '%';
                }
            }
        }
    }

}
