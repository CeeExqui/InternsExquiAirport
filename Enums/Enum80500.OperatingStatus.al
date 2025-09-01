enum 80500 "Operating Status"
{
    Extensible = true;

    value(0; Open)
    {
        Caption = 'Open';
    }
    value(1; Closed)
    {
        Caption = 'Closed';
    }
    value(2; "Under maintenance")
    {
        Caption = 'Under maintenance';
    }
}
