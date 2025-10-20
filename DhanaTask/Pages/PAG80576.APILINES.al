page 80576 "api Book Entry Line"
{
    PageType = API;
    DelayedInsert = true;
    SourceTable = "Book Line";
    Caption = 'Book Entry Line';
    APIPublisher = 'Rony';
    APIGroup = 'library';
    APIVersion = 'v1.0';
    EntityName = 'bookEntryLine';
    EntitySetName = 'bookEntryLines';
    ODataKeyFields = "Entry No.", "Line No.";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(entryNo; Rec."Entry No.") { Caption = 'Entry No.'; }
                field(lineNo; Rec."Line No.") { Caption = 'Line No.'; }
                field(bookNo; Rec."Book No.") { Caption = 'Book No.'; }
                field(bookDescription; Rec."Book Description") { Caption = 'Book Description'; }
                field(amount; Rec.Amount) { Caption = 'Amount'; }
            }
        }
    }
}
