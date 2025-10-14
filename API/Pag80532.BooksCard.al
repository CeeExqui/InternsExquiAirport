page 80532 "Books Card"
{
    ApplicationArea = All;
    Caption = 'Books Card';
    PageType = Card;
    SourceTable = Books;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Book No."; Rec."Book No.")
                {
                    ToolTip = 'Specifies the value of the Book No. field.', Comment = '%';
                }
                field("Book Description"; Rec."Book Description")
                {
                    ToolTip = 'Specifies the value of the Book Description field.', Comment = '%';
                }
                field("Book Author"; Rec."Book Author")
                {
                    ToolTip = 'Specifies the value of the Book Author field.', Comment = '%';
                }
                field("Book Issue Date"; Rec."Book Issue Date")
                {
                    ToolTip = 'Specifies the value of the Book Issue Date field.', Comment = '%';
                }
                field("Expected Return Date"; Rec."Expected Return Date")
                {
                    ToolTip = 'Specifies the value of the Expected Return Date field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                }
            }
        }
    }
}
