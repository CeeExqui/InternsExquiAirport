report 80500 "Customer Report"
{
    ApplicationArea = All;
    Caption = 'Customer Report';
    UsageCategory = Administration;
    ProcessingOnly = true;


    dataset
    {
        dataitem(Customer; Customer)
        {
            trigger OnAfterGetRecord()
            begin

                Customer.Name := 'Jad';
                CurrReport.Break();
            end;

        }
    }


    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }


}
