table 80540 "Document Header"
{
    Caption = 'Document Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Request ID';
        }
        field(2; "Description"; Text[100])
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
        field(5; "Request Type Code"; Code[20])
        {
            Caption = 'Request Type';
            TableRelation = "Request Type";
        }
        field(6; Posted; Boolean)
        {
            Caption = 'Posted';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "No.") { Clustered = true; }
    }

    procedure UpdateTotals()
    var
        Line: Record "Document Line";
        Total: Decimal;
    begin
        Total := 0;
        Line.SetRange("Document No.", "No.");
        if Line.FindSet() then
            repeat
                Total += Line."Line Amount";
            until Line.Next() = 0;

        "Total Amount" := Total;
        Modify(true);
    end;
}
