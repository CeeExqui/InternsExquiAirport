table 80571 "Book Header"
{
    Caption = 'Book Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }
        field(4; "Customer Phone"; Text[20])
        {
            Caption = 'Customer Phone';
        }
        field(5; "Status"; Enum "Book Entry Status")
        {
            Caption = 'Status';
        }
    }
    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
    }
}