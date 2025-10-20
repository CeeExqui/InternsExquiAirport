table 80570 "Books"
{
    Caption = 'Books';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Book ID"; Code[20])
        {
            Caption = 'Book ID';
        }
        field(2; "Title"; Text[100])
        {
            Caption = 'Title';
        }
        field(3; "Author"; Text[50])
        {
            Caption = 'Author';
        }
        field(4; "Published Date"; Date)
        {
            Caption = 'Published Date';
        }
        field(5; "Book Description"; Text[250])
        {
            Caption = 'Book Description';
        }
    }
    keys
    {
        key(PK; "Book ID") { Clustered = true; }
    }
}