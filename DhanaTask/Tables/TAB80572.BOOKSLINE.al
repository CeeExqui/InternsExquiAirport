table 80572 "Book Line"
{
    Caption = 'Book Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            TableRelation = "Book Header"."Entry No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }

        field(3; "Book No."; Code[20])
        {
            Caption = 'Book No.';
            TableRelation = "Books"."Book ID";
            trigger OnValidate()
            var
                BookRec: Record "Books";
            begin
                if BookRec.Get("Book No.") then
                    "Book Description" := BookRec."Book Description";
            end;
        }
        field(4; "Book Description"; Text[100])
        {
            Caption = 'Book Description';
            Editable = false;
        }
        field(5; "Amount"; Decimal)
        {
            Caption = 'Amount';
        }
    }
    trigger OnInsert()
    var
        Line: Record "Book Line";
    begin
        if "Line No." = 0 then begin
            Line.SetRange("Entry No.", "Entry No.");
            if Line.FindLast() then
                "Line No." := Line."Line No." + 1
            else
                "Line No." := 1;
        end;
    end;
}