tableextension 80502 "G/L Account Table extension" extends "G/L Account"
{
    fields
    {
        field(80500; "Source Type"; Enum "Gen. Journal Source Type")
        {
            FieldClass = FlowFilter;
        }
        field(80501; "Source No."; Code[20])
        {
            FieldClass = FlowFilter;
            Caption = 'Source No.';
            TableRelation = if ("Source Type" = const(Customer)) Customer
            else
            if ("Source Type" = const(Vendor)) Vendor
            else
            if ("Source Type" = const("Bank Account")) "Bank Account"
            else
            if ("Source Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Source Type" = const(Employee)) Employee;
        }
        field(80502; "New balance"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("No."),
                                                        "G/L Account No." = field(filter(Totaling)),
                                                        "Business Unit Code" = field("Business Unit Filter"),
                                                        "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                        "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                        "Dimension Set ID" = field("Dimension Set ID Filter"),
                                                        "Source Type" = field("Source Type"),
                                                        "Source No." = field("Source No.")));
            Caption = 'New Balance';
            Editable = false;
            FieldClass = FlowField;
        }
    }
}
