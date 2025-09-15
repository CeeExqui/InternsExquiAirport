pageextension 80527 test extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        modify(CustomerLedgerEntries)
        {


            trigger OnAfterAction()
            var
                myInt: Integer;
            begin
                Message('Now we can modify thank you ! ');
            end;
        }
    }



    var
        myInt: Integer;
}