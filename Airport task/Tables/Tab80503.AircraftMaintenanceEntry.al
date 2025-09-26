table 80503 "Aircraft Maintenance Entry" //TODO add maintenance-employee
{
    Caption = 'Aircraft Maintenance Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer) //TODO auto increment make it integer
        {

            AutoIncrement = true;
            NotBlank = true;
        }
        field(2; "Aircraft Registration No."; Code[6])
        {
            TableRelation = "Air Craft"."Registration Number";
            NotBlank = true;

        }
        field(3; "Maintenance Start Date"; DateTime)
        {
            trigger OnValidate()
            begin
                validateStartDate();

            end;
        }
        field(4; "Maintenance End Date"; DateTime)
        {

            trigger OnValidate()
            begin
                validateEndDate();
            end;
        }
        field(5; "Total Maintenance Time"; Duration)
        {

        }
        field(6; "Description"; Text[255])
        {

        }
        field(7; "Cost Parts"; Decimal)
        {
            MinValue = 0;
            trigger OnValidate()
            begin
                CalculateCost();
            end;

        }
        field(8; "Cost Labor"; Decimal)
        {
            MinValue = 0;

            trigger OnValidate()
            begin
                CalculateCost();
            end;

        }
        field(9; "Total Cost"; Decimal) //TODO to test
        {
            Editable = false;
            InitValue = 0; //IT WORKSSSS
        }
        field(10; "Maintenance Type"; Code[10])
        {
            TableRelation = Maintenance;
        }
        field(11; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            // TableRelation = "Dimension Set Entry";

            // trigger OnLookup()
            // begin
            //     Rec.ShowDimensions();
            // end;

            // trigger OnValidate()
            // begin
            //     DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
            // end;
        }

        field(13; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                Rec.ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(14; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                Rec.ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");

            end;
        }

        field(15; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }

    }
    keys
    {
        key(Pk; "Entry No.")
        {
            Clustered = true;
        }
    }




    local procedure CalculateDuration()
    begin
        "Total Maintenance Time" := "Maintenance End Date" - "Maintenance Start Date";

    end;

    local procedure CalculateCost()
    begin
        "Total Cost" := "Cost Labor" + "Cost Parts";
    end;

    local procedure validateStartDate()
    begin
        if (Rec."Maintenance End Date" <> 0DT) then
            if (Rec."Maintenance End Date" < Rec."Maintenance Start Date") then begin
                Error('Cannot have an Start Date later than a End Date.');

            end else begin
                CalculateDuration();
            end;
    end;

    local procedure validateEndDate()
    begin
        if (Rec."Maintenance Start Date" <> 0DT) then
            if (Rec."Maintenance End Date" < Rec."Maintenance Start Date") then begin
                Error('Cannot have an end Date later than a start date.');

            end else begin
                CalculateDuration();
            end;

    end;



    procedure ShowDimensions() IsChanged: Boolean
    var
        OldDimSetID: Integer;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        // OnBeforeShowDimensions(Rec, xRec, IsHandled, IsChanged);
        if IsHandled then
            exit(IsChanged);

        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1', "Aircraft Registration No."));
        // OnShowDimensionsOnAfterEditDimensionSet(Rec, OldDimSetID);

        // VerifyItemLineDim();
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        Rec.Modify();

        IsChanged := OldDimSetID <> "Dimension Set ID";

        // OnAfterShowDimensions(Rec, xRec);
    end;


    // procedure VerifyItemLineDim()
    // var
    //     IsHandled: Boolean;
    // begin
    //     IsHandled := false;
    //     // OnBeforeVerifyItemLineDim(Rec, IsHandled);
    //     if IsHandled then
    //         exit;


    // end;



    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        // OnBeforeValidateShortcutDimCode(Rec, xRec, FieldNumber, ShortcutDimCode, IsHandled);
        if IsHandled then
            exit;

        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        // VerifyItemLineDim();

        // OnAfterValidateShortcutDimCode(Rec, xRec, FieldNumber, ShortcutDimCode);
    end;




    // [IntegrationEvent(false, false)]
    // local procedure OnBeforeShowDimensions(var SalesLine: Record "Aircraft Maintenance Entry"; xSalesLine: Record "Aircraft Maintenance Entry"; var IsHandled: Boolean; var IsChanged: Boolean)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnShowDimensionsOnAfterEditDimensionSet(var SalesLine: Record "Aircraft Maintenance Entry"; OldDimensionSet: Integer)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnBeforeVerifyItemLineDim(var SalesLine: Record "Aircraft Maintenance Entry"; var IsHandled: Boolean)
    // begin
    // end;


    // [IntegrationEvent(false, false)]
    // local procedure OnAfterShowDimensions(var SalesLine: Record "Aircraft Maintenance Entry"; xSalesLine: Record "Aircraft Maintenance Entry")
    // begin
    // end;


    // [IntegrationEvent(false, false)]
    // local procedure OnAfterValidateShortcutDimCode(var SalesLine: Record "Aircraft Maintenance Entry"; xSalesLine: Record "Aircraft Maintenance Entry"; FieldNumber: Integer; var ShortcutDimCode: Code[20])
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnBeforeValidateShortcutDimCode(var SalesLine: Record "Aircraft Maintenance Entry"; xSalesLine: Record "Aircraft Maintenance Entry"; FieldNumber: Integer; var ShortcutDimCode: Code[20]; var IsHandled: Boolean)
    // begin
    // end;


    var

        DimMgt: Codeunit DimensionManagement;
        Text054: Label 'Cancelled.';

        Text053: Label 'You have changed one or more dimensions on the %1, which is already shipped. When you post the line with the changed dimension to General Ledger, amounts on the Inventory Interim account will be out of balance when reported per dimension.\\Do you want to keep the changed dimension?';

}
