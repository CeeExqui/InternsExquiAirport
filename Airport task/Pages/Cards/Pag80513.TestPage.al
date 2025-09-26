page 80513 "TestPage"
{
    ApplicationArea = All;
    Caption = 'TestPage';
    PageType = Card;
    SourceTable = "Error table";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Test 2"; Rec."Test 2")
                {
                    ToolTip = 'Specifies the value of the Test 2 field.', Comment = '%';
                }
                field(test; Rec.test)
                {
                    ToolTip = 'Specifies the value of the test field.', Comment = '%';
                }
            }
        }
    }
}
