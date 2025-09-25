table 80540 "Document Header"
{
    Caption = 'Document Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Request ID';
        }
        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(4; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
        }
        field(5; "Request Type Code"; Code[20])
        {
            Caption = 'Request Type';
            TableRelation = "Request Type";
        }
        field(6; Posted; Boolean)
        {
            Caption = 'Posted';
            Editable = false;
        }
        field(7; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            TableRelation = "Dimension Set Entry";
            Editable = false;

            trigger OnValidate()
            var
                OldDimSetID: Integer;
            begin
                OldDimSetID := xRec."Dimension Set ID";
                if "Dimension Set ID" <> OldDimSetID then
                    UpdateAllLineDim("Dimension Set ID", OldDimSetID);
            end;
        }

    }

    keys
    {
        key(PK; "No.") { Clustered = true; }
    }
    procedure UpdateTotals()
    var
        Line: Record "Document Line";
        Total: Decimal;
    begin
        Total := 0;
        Line.SetRange("Document No.", "No.");
        if Line.FindSet() then
            repeat
                Total += Line."Line Amount";
            until Line.Next() = 0;

        "Total Amount" := Total;
        Modify(true);
    end;

    procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        Line: Record "Document Line";
        DimMgt: Codeunit DimensionManagement;
        NewDimSetID: Integer;
    begin
        if NewParentDimSetID = OldParentDimSetID then
            exit;

        Line.SetRange("Document No.", "No.");
        if Line.FindSet(true) then
            repeat
                NewDimSetID :=
                  DimMgt.GetDeltaDimSetID(
                      Line."Dimension Set ID",
                      NewParentDimSetID,
                      OldParentDimSetID);

                if Line."Dimension Set ID" <> NewDimSetID then begin
                    Line."Dimension Set ID" := NewDimSetID;
                    Line.Modify(true);
                end;
            until Line.Next() = 0;
    end;




}
