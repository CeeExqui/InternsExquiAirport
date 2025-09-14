page 80501 "Airport Card"
{
    ApplicationArea = All;
    Caption = 'Airport Card';
    PageType = Card;
    SourceTable = Airport;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }

                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }

                field(OperatingSatus; Rec.OperatingStatus)
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
