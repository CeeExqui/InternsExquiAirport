table 80515 "Book Entry lines"
{
    Caption = 'Book Entry lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            TableRelation = "Book Entry Header"."Entry No.";

        }
        field(2; "Line No."; Integer)
        {
        }
        Field(3; "Book No."; Integer)
        {
            TableRelation = Books."Book No.";
            trigger OnValidate()
            begin
                CalcFields("Book Description");
            end;
        }
        field(4; "Book Description"; Text[255])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Books."Book Description" where("Book No." = field("Book No.")));
        }
        Field(5; "Amount"; Decimal)
        {
            NotBlank = true;
        }
    }
    keys
    {
        key(PK; "Entry No.", "Line No.")
        {
            Clustered = true;
            
        }
    }
}
