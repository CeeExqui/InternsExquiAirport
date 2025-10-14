page 80533 "BookEntryLine API"
{
    APIGroup = 'library';
    APIPublisher = 'JadAwad';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'bookEntryLineAPI';
    DelayedInsert = true;
    EntityName = 'bookEntryLine';
    EntitySetName = 'bookentrylines';
    PageType = API;
    SourceTable = "Book Entry lines";
    AutoSplitKey = true;

    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                }
                field(bookNo; Rec."Book No.")
                {
                    Caption = 'Book No.';
                }
                field(bookDescription; Rec."Book Description")
                {
                    Caption = 'Book Description';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(SystemId; Rec.SystemId) { }
            }
        }
    }
}
