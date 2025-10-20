xmlport 80520 "Books Import (TXT)"
{
    Caption = 'Books Import (TXT)';
    Direction = Import;
    Format = VariableText;
    FieldSeparator = ';';
    UseRequestPage = false;

    schema
    {
        textelement(Root)
        {
            tableelement(Book; Books)
            {
                AutoSave = true;
                XmlName = 'Book';

                fieldelement(BookNo; Book."Book ID") { }
                fieldelement(Desc; Book."Book Description") { }
                fieldelement(Author; Book."Author") { }
                fieldelement(Issued; Book."Published Date") { }
            }
        }
    }
}
