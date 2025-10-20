page 80572 "Book Card"
{
    PageType = Card;
    SourceTable = "Books";
    ApplicationArea = All;
    Caption = 'Book Card';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Book No."; Rec."Book ID") { ApplicationArea = All; }
                field("Book Description"; Rec."Book Description") { ApplicationArea = All; }
                field("Book Author"; Rec."Author") { ApplicationArea = All; }
                field("Book Publish Date"; Rec."Published Date") { ApplicationArea = All; }
                field("Title"; Rec."Title") { ApplicationArea = All; }
            }
        }
    }
}
