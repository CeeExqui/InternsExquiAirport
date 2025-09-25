table 80562 "Posted Request Line"
{
    Caption = 'Posted Request Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Posted Request No.';
            TableRelation = "Posted Request Header";
        }
        field(3; "Item Description"; Text[100]) { }
        field(4; Quantity; Decimal) { }
        field(5; "Unit Price"; Decimal) { }
        field(6; "Line Amount"; Decimal) { }
        field(7; "Posting Date"; Date) { }
    }

    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
    }
}
