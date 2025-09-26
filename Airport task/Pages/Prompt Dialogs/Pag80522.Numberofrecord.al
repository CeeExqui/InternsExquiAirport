page 80522 "Number of record"
{
    ApplicationArea = All;
    Caption = 'Number of record ';
    PageType = PromptDialog;
    Extensible = false;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Number of Records to be added"; NB)
                {

                }
            }
        }
    }
    var
        NB: Integer;

    procedure GetNB(): Integer
    begin
        exit(NB);
    end;
}
