page 80575 "api Book Entry"
{
    PageType = API;
    SourceTable = "Book Header";
    Caption = 'Book Entry';
    APIPublisher = 'Rony';
    APIGroup = 'library';
    APIVersion = 'v1.0';
    EntityName = 'bookEntry';
    EntitySetName = 'bookEntries';
    DelayedInsert = true;
    ODataKeyFields = "Entry No.";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field(entryNo; Rec."Entry No.") { Caption = 'Entry No.'; }
                field(documentDate; Rec."Date") { Caption = 'Document Date'; }
                field(customerName; Rec."Customer Name") { Caption = 'Customer Name'; }
                field(customerPhoneNo; Rec."Customer Phone") { Caption = 'Customer Phone No'; }
                field(status; Rec.Status) { Caption = 'Status'; }
            }
            part(lines; "api Book Entry Line")
            {
                EntityName = 'bookEntryLine';
                EntitySetName = 'bookEntryLines';
                SubPageLink = "Entry No." = FIELD("Entry No.");
            }
        }
    }
}
