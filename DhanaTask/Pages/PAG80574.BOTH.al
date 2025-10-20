page 80574 "Book Entry"
{
    PageType = Document;
    SourceTable = "Book Header";
    ApplicationArea = All;
    Caption = 'Book Entry';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; Editable = false; }
                field(Date; Rec.Date) { ApplicationArea = All; }
                field("Customer Name"; Rec."Customer Name") { ApplicationArea = All; }
                field("Customer Phone No"; Rec."Customer Phone") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
            }
            part(Lines; "Book Entry Subform")
            {
                SubPageLink = "Entry No." = FIELD("Entry No.");
                ApplicationArea = All;
            }
        }
    }
}
