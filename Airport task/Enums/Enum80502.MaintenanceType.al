enum 80502 "Maintenance Type"
{
    Extensible = true;

    value(0; Service)
    {
        Caption = 'Service';
    }
    value(1; Replacement)
    {
        Caption = 'Replacement';
    }
    value(2; Salvage)
    {
        Caption = 'Salvage';
    }
}
