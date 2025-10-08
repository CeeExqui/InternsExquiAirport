page 80530 "Key lookup"
{
    ApplicationArea = All;
    Caption = 'Key lookup';
    PageType = List;
    SourceTable = "Key";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(TableName; Rec.TableName)
                {
                    ToolTip = 'Specifies the value of the TableName field.', Comment = '%';
                }
                field(TableNo; Rec.TableNo)
                {
                    ToolTip = 'Specifies the value of the TableNo field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Key"; Rec."Key")
                {
                    ToolTip = 'Specifies the value of the Key field.', Comment = '%';
                }
            }
        }
    }
}
