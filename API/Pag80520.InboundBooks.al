xmlport 80520 "Books Import"
{
    Caption = 'Books Import';
    Direction = Import;
    Format = VariableText;
    FieldSeparator = ';';
    FieldDelimiter = '"';

    UseRequestPage = true;

    schema
    {
        textelement(Root)
        {
            tableelement(Book; Books)
            {
                AutoSave = true;
                fieldelement(BookNo; Book."Book No.") { }
                fieldelement(BookDescription; Book."Book Description") { }
                fieldelement(BookAuthor; Book."Book author") { }
                fieldelement(BookIssuedDate; Book."Book Issue Date") { }
                fieldelement(ExpectedReturnDate; Book."Expected Return Date") { }
                fieldelement(Blocked; Book.Blocked) { }


            }
        }
    }
}
