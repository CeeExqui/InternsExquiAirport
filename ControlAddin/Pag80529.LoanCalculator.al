page 80529 LoanCalculator
{
    ApplicationArea = All;
    Caption = 'LoanCalculator';
    PageType = Card;

    layout
    {
        area(Content)
        {
            usercontrol(Control1; MyControlAddIn)
            {
                ApplicationArea = All;
                trigger ShowLoanSummary(Summary: Text)
                begin
                    Message('Loan Info: %1', Summary);
                end;
            }
        }
    }
}
