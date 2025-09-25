table 80563 "Posted Request Header"
{
    Caption = 'Posted Request Header';
    DataClassification = ToBeClassified;
    LookupPageId = "Posted Request Document";


    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Request ID';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(4; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
