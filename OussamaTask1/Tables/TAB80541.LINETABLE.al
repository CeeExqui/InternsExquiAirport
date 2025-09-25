table 80541 "Document Line"
{
    Caption = 'Document Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; Integer) { Caption = 'Line No.'; }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Document Header";
        }
        field(3; "Item Description"; Text[100]) { Caption = 'Item Description'; }
        field(4; Quantity; Decimal)
        {
            Caption = 'Quantity';
            trigger OnValidate()
            begin
                CalcAmount();
            end;
        }
        field(5; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            trigger OnValidate()
            begin
                CalcAmount();
            end;
        }
        field(6; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            Editable = false;
        }
        field(7; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            TableRelation = "Dimension Set Entry";
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Document No.", "Line No.") { Clustered = true; }
    }

    trigger OnInsert()
    var
        Header: Record "Document Header";
        DimMgt: Codeunit DimensionManagement;
    begin
        if Header.Get("Document No.") then
            Header.UpdateTotals();
    end;

    trigger OnModify()
    var
        Header: Record "Document Header";
    begin
        if Header.Get("Document No.") then
            Header.UpdateTotals();
    end;

    trigger OnDelete()
    var
        Header: Record "Document Header";
    begin
        if Header.Get("Document No.") then
            Header.UpdateTotals();
    end;

    local procedure CalcAmount()
    begin
        "Line Amount" := Quantity * "Unit Price";
    end;
}
