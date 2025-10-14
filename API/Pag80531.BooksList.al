page 80531 "Books List"
{
    ApplicationArea = All;
    Caption = 'Books List';
    PageType = List;
    SourceTable = Books;
    CardPageId = "Books Card";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
                field("Blocked"; Rec.Blocked) { }

            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(Import)
            {
                Caption = 'Import Books';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Xmlport.Run(80520);
                end;
            }
            action(Export)
            {
                Caption = 'Export Books';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Books: record Books;
                begin
                    CurrPage.SetSelectionFilter(books);
                    Xmlport.Run(80501, true, false, books);
                end;
            }
        }
    }
}
