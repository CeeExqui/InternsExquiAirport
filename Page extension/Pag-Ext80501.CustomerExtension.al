pageextension 80501 "Customer Extension" extends "Customer List"
{

    layout
    {
        modify("No.")
        {
            Caption = 'Customer No.';
        }

    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        message('hello, this is a on after');
    end;

}
