page 80518 "Description Filtering Card"
{
    ApplicationArea = All;
    Caption = 'Please enter a Desciprtion filter';
    PageType = PromptDialog;
    Extensible = false;
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(x; x)
                {
                    caption = 'Description';
                }
            }
        }
    }
    var
        x: Text[50];

    procedure GetX(): Text
    begin
        exit(x);
    end;
}
