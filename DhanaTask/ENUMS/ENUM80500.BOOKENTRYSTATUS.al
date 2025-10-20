enum 80512 "Book Entry Status"
{
    Extensible = true;

    value(0; "Open")
    {
        Caption = 'Open';
    }
    value(1; "Returned")
    {
        Caption = 'Returned';
    }
    value(2; "Borrowed")
    {
        Caption = 'Borrowed';
    }
    value(3; "Lost")
    {
        Caption = 'Lost';
    }
}