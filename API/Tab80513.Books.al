table 80513 Books
{
    Caption = 'Books';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Book No."; Integer)
        {
        }
        field(2; "Book Description"; Text[255])
        {

        }
        field(3; "Book Author"; Text[100])
        {

        }
        field(4; "Book Issue Date"; Date)
        {
            trigger OnValidate()
            begin
                DateCheck();
            end;
        }
        Field(5; "Expected Return Date"; Date)
        {
            trigger OnValidate()
            begin
                DateCheck();
            end;
        }
        field(6; "Blocked"; Boolean)
        {
            InitValue = false;
        }

    }
    keys
    {
        key(PK; "Book No.")
        {
            Clustered = true;
        }
    }
    procedure DateCheck()
    begin
        if ("Book Issue Date" <> 0D) and ("Expected Return Date" <> 0D) then
            if ("Book Issue Date" > "Expected Return Date") then error('You can''t have a return date later than a expected return date');
    end;
}
