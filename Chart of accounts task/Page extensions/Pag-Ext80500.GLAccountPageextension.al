pageextension 80500 "G/L Account Page extension" extends "Chart of Accounts"
{

    layout
    {
        addafter(Balance)
        {
            field("New balance"; Rec."New balance")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the balance on this account.';
                AutoFormatExpression = '1,USD';
                AutoFormatType = 10;

            }

        }

    }
}