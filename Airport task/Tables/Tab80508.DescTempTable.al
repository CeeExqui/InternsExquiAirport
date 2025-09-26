table 80508 "Desc Temp Table"
{
    Caption = 'Desc Temp Table';
    DataClassification = ToBeClassified;
    TableType = Temporary;
    fields
    {
        field(1; "ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "No."; Code[20])
        {

        }
        field(3; "Sell-to Customer Name"; Text[100]) { }
        field(4; "Posting Date"; Date) { }
        field(5; Description; Text[100]) { }
        field(6; Quantity; Decimal) { }
        field(7; "Unit Price"; Decimal) { }
        field(8; "VAT %"; Decimal) { }
        field(9; "Line Amount"; Decimal)
        {

        }
        field(10; "Total"; Decimal)
        {
        }

    }


    keys
    {
        // key(PK; "ID")
        // {
        //     Clustered = true;
        // }
    }
    trigger OnModify()
    begin
        CalcTotal();
    end;

    procedure CalcTotal()
    begin
        Rec.Total := (Rec."VAT %" * rec."Line Amount" * 0.01) + Rec."Line Amount";
    end;
}
