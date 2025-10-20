xmlport 80521 "Books Export (TXT)"
{
    Caption = 'Books Export (TXT)';
    Direction = Export;
    Format = VariableText;
    FieldSeparator = ';';
    UseRequestPage = false;

    schema
    {
        textelement(Root)
        {
            tableelement(Book; Books)
            {
                XmlName = 'Book';

                fieldelement(BookNo; Book."Book ID") { }
                fieldelement(Desc; Book."Book Description") { }
                fieldelement(Author; Book."Author") { }
                fieldelement(Issued; Book."Published Date") { }
            }
        }
    }
}
