page 80565 "Posted Request Document"
{
    PageType = Document;
    SourceTable = "Posted Request Header";
    ApplicationArea = All;
    Caption = 'Posted Request';
    UsageCategory = History;
    

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.") { Editable = false; }
                field(Description; Rec.Description) { Editable = false; }
                field("Posting Date"; Rec."Posting Date") { Editable = false; }
                field("Total Amount"; Rec."Total Amount") { Editable = false; }
            }

            part(Lines; "Posted Request Lines")
            {
                SubPageLink = "Document No." = FIELD("No.");
            }
        }
    }
}
