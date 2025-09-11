tableextension 80545 "G/L ACCOUNT EXTENSION" extends "G/L Account"
{
    fields
    {
        field(80545; "Balance Test"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("No."),
                                                        "G/L Account No." = field(filter(Totaling)),
                                                        "Business Unit Code" = field("Business Unit Filter"),
                                                        "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                        "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                        "Source No." = field("Source No. Filter"),
                                                        "Source Type" = field("Source Type Filter"),
                                                        "Dimension Set ID" = field("Dimension Set ID Filter")));
            Caption = 'Balance Test';
            Editable = false;
            FieldClass = FlowField;
        }

        field(80546; "Source Type Filter"; Enum "Gen. Journal Source Type")
        {
            Caption = 'Source Type Filter';
            FieldClass = FlowFilter;
        }

        field(80547; "Source No. Filter"; Code[20])
        {
            Caption = 'Source No. Filter';
            TableRelation = if ("Source Type Filter" = const(Customer)) Customer
            else
            if ("Source Type Filter" = const(Vendor)) Vendor
            else
            if ("Source Type Filter" = const("Bank Account")) "Bank Account"
            else
            if ("Source Type Filter" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Source Type Filter" = const(Employee)) Employee;
            FieldClass = FlowFilter;
        }
    }
}