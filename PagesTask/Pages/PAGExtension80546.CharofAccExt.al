pageextension 80550 "Chart Account Ext" extends "Chart of Accounts"
{
    layout
    {
        addafter(Balance)
        {
            field("Balance Test"; Rec."Balance Test")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the balance with Source Type and Source No. filters applied.';
            }
        }
    }

}