page 80564 "Posted Request List"
{
    PageType = List;
    SourceTable = "Posted Request Header";
    ApplicationArea = All;
    Caption = 'Posted';
    UsageCategory = History;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.") { //DrillDownPageId = "Posted Request Document"; LookupPageId = "Posted Request Document";
                }
                field(Description; Rec.Description) { }
                field("Posting Date"; Rec."Posting Date") { }
                field("Total Amount"; Rec."Total Amount") { }
            }
        }
    }
}
