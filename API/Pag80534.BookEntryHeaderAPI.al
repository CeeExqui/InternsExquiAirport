page 80534 "BookEntryHeader API "
{
    APIGroup = 'library';
    APIPublisher = 'JadAwad';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'bookEntryHeaderAPI';
    DelayedInsert = true;
    EntityName = 'bookEntry';
    EntitySetName = 'bookentries';
    PageType = API;
    SourceTable = "Book Entry Header";

    ODataKeyFields = "SystemId";
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
                field(customerName; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                }
                field(customerEmail; Rec."Customer Email")
                {
                    Caption = 'Customer Email';
                }
                field(customerPhoneNo; Rec."Customer Phone No")
                {
                    Caption = 'Customer Phone No';
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                part(Lines; "BookEntryLine API")
                {
                    SubPageLink = "Entry No." = FIELD("Entry No.");
                    EntityName = 'bookEntryLine';
                    EntitySetName = 'bookentrylines';
                }
            }
        }
    }
}
