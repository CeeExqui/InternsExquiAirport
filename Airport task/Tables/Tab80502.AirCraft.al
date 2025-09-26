table 80502 "Air Craft"
{
    Caption = 'Air Craft';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Aircraft Maintenance EntryCard";
    fields
    {
        field(1; "Registration Number"; Code[6])
        {
            NotBlank = true;
            trigger OnValidate()
            begin
                validateRegistration();
            end;
        }
        field(2; "Aircraft Classification"; Option)
        {
            OptionMembers = Commercial,Military,Private;

        }
        field(3; "Aircraft Type"; Enum "Air Craft Type")
        {
            NotBlank = True;
            trigger OnValidate()
            begin
                validateAirlineNo();
            end;


        }
        field(4; "Manufacturer Code"; Code[10]) //TODO add a manufacturer Name
        {
            TableRelation = "Manufacturer".Code;
            trigger OnValidate()
            begin
                validManufacturerNo();
                validModel();
            end;

        }
        field(5; "Model"; Text[100])
        {

            TableRelation = if ("Manufacturer Code" = filter(<> '')) Model."Model Name" where("Manufacturer Name" = field("Manufacturer Code"));
            trigger OnValidate()
            begin
                ValidModel()
            end;
        }

        field(6; "People Capacity"; Integer)
        {
            MinValue = 0;
            trigger OnValidate()
            begin
                validatePeople();
            end;

        }
        field(7; "Capacity Cargo"; Decimal)
        {
            MinValue = 0;
            trigger OnValidate()
            begin
                validateCargo();
            end;

        }
        field(8; "Cargo Unit of Measurement"; Code[10]) //TODO notblank
        {
            TableRelation = "Unit of Measure".Code;

            trigger OnValidate()
            begin
                validateMeasurementUnit();
            end;
        }
        field(9; "Airline No."; Code[2]) //should add aircraft categ
        {
            TableRelation = Airline."No.";
            trigger OnValidate()
            begin
                validateAirlineNo();
            end;
        }
        field(10; "Total maintenance Cost"; Decimal)//change calc formula fields to decimal
        {

            FieldClass = FlowField;

            CalcFormula = sum("Aircraft Maintenance Entry"."Total Cost" where("Aircraft Registration No." = field("Registration Number")));
        }
        field(11; "Last Maintenance Date"; DateTime)
        {
            FieldClass = FlowField;
            CalcFormula = Max("Aircraft Maintenance Entry"."Maintenance End Date" WHERE("Aircraft Registration No." = field("Registration Number")));
        }
        field(12; "Width"; Decimal)
        {
            MinValue = 0;

        }
        field(13; "Length"; Decimal)
        {
            MinValue = 0;
        }
        field(14; "Has Cargo?"; Boolean)
        {
            trigger OnValidate()
            begin
                validateMeasurementUnit();
                validateCargo();
            end;

        }
        Field(15; "Has people?"; Boolean)
        {
            trigger OnValidate()
            begin
                validatePeople();
            end;
        }
        Field(16; "Manufacturer Name"; Text[50])
        {
            NotBlank = true;
            Editable = false;
            InitValue = '';

        }
        field(17; "Date"; DateTime)
        {
            FieldClass = FlowFilter;

        }
        field(18; "New Total maintenance Cost"; Decimal)
        {
            FieldClass = FlowField;

            CalcFormula = sum("Aircraft Maintenance Entry"."Total Cost" where("Aircraft Registration No." = field("Registration Number"),
                                                                                "Maintenance Start Date" = field("Date")));
        }


        field(19; "Dimension Set ID"; Integer)
        {
            Editable = false;

        }
        field(20; "Lines Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Aircraft Maintenance Entry" where("Aircraft Registration No." = field("Registration Number")));
        }

        field(21; "Shortcut Dimension 1 Code"; Code[20])
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
        field(22; "Shortcut Dimension 2 Code"; Code[20])
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
    }
    keys
    {
        key(PK; "Registration Number")
        {
            Clustered = true;
        }
    }


    var
        Manufacturer: Record Manufacturer;
        DimMgt: Codeunit DimensionManagement;
        HideValidationDialog: Boolean;
        Text064: Label 'You may have changed a dimension.\\Do you want to update the lines?';

        SalesHeader: Record "Air Craft";
        SalesLine: Record "Aircraft Maintenance Entry";


    local procedure validManufacturerNo()
    begin
        if (Manufacturer.get(Rec."Manufacturer Code")) then
            "Manufacturer Name" := Manufacturer.Name
        else
            clear("Manufacturer Name");


    end;

    local procedure validModel()
    var
        Model: Record Model;
    begin
        if (Rec."Manufacturer Name" <> '') then begin //it only runs if Manufacturer Name is set
            if (Model.get(Rec."Model")) then
                if (Model."Manufacturer Name" <> Rec."Manufacturer Name") then Error('Model do not belong to the manufacturer.')
        end
        else
            Error('Invalid Model');


    end;

    local procedure validatePeople()
    begin
        if (Rec."Has people?" = true) then
            if (Rec."People Capacity" = 0) then Error('Enter valid people capacity')
    end;

    local procedure validateCargo()
    begin
        if (Rec."Has Cargo?" = true) then
            if (Rec."Capacity Cargo" = 0) then Error('Please enter a valid Cargo weight')
    end;

    local procedure validateMeasurementUnit()
    begin
        if (Rec."Has Cargo?" = true) then
            if (Rec."Cargo Unit of Measurement" = '') then Error('Please enter a valid Cargo weight')
    end;

    local procedure validateAirlineNo()

    begin
        if (Rec."Aircraft Type" = "Aircraft Type"::Passenger) then
            if (Rec."Airline No." = '') then Error('Please enter an Airline No.')
    end;

    local procedure validateRegistration()
    begin
        if (xRec."Registration Number" <> '') then
            if (Rec."Registration Number" <> xRec."Registration Number") then
                Rec."Registration Number" := XRec."Registration Number";


    end;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        // OnBeforeShowDocDim(Rec, xRec, IsHandled);
        if IsHandled then
            exit;

        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            Rec, "Dimension Set ID", StrSubstNo('%1', "Registration Number"),
            "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        // OnShowDocDimOnBeforeUpdateSalesLines(Rec, xRec);
        if OldDimSetID <> "Dimension Set ID" then begin
            // OnShowDocDimOnBeforeSalesHeaderModify(Rec);
            Modify();
            if SalesLinesExist() then
                UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        end;
    end;


    procedure SalesLinesExist(): Boolean
    var
        IsHandled: Boolean;
        Result: Boolean;
    begin
        IsHandled := false;
        //OnBeforeSalesLinesExist(Rec, IsHandled, Result);
        if IsHandled then
            exit(Result);

        SalesLine.Reset();
        SalesLine.SetRange("Aircraft Registration No.", "Registration Number");
        exit(not SalesLine.IsEmpty());
    end;



    procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        ATOLink: Record "Assemble-to-Order Link";
        xSalesLine: Record "Aircraft Maintenance Entry";
        NewDimSetID: Integer;
        ShippedReceivedItemLineDimChangeConfirmed: Boolean;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        // OnBeforeUpdateAllLineDim(Rec, NewParentDimSetID, OldParentDimSetID, IsHandled, xRec);
        if IsHandled then
            exit;

        if NewParentDimSetID = OldParentDimSetID then
            exit;
        if not GetHideValidationDialog() and GuiAllowed then
            if not ConfirmUpdateAllLineDim(NewParentDimSetID, OldParentDimSetID) then
                exit;

        SalesLine.Reset();
        SalesLine.SetRange("Aircraft Registration No.", "Registration Number");
        SalesLine.LockTable();
        if SalesLine.Find('-') then
            repeat
                // OnUpdateAllLineDimOnBeforeGetSalesLineNewDimsetID(SalesLine, NewParentDimSetID, OldParentDimSetID);
                NewDimSetID := DimMgt.GetDeltaDimSetID(SalesLine."Dimension Set ID", NewParentDimSetID, OldParentDimSetID);
                // OnUpdateAllLineDimOnAfterGetSalesLineNewDimsetID(Rec, xRec, SalesLine, NewDimSetID, NewParentDimSetID, OldParentDimSetID);
                if SalesLine."Dimension Set ID" <> NewDimSetID then begin
                    xSalesLine := SalesLine;
                    SalesLine."Dimension Set ID" := NewDimSetID;

                    // if not GetHideValidationDialog() and GuiAllowed then
                    //     VerifyShippedReceivedItemLineDimChange(ShippedReceivedItemLineDimChangeConfirmed);

                    DimMgt.UpdateGlobalDimFromDimSetID(
                      SalesLine."Dimension Set ID", SalesLine."Shortcut Dimension 1 Code", SalesLine."Shortcut Dimension 2 Code");

                    // OnUpdateAllLineDimOnBeforeSalesLineModify(SalesLine, xSalesLine);
                    SalesLine.Modify();
                    // OnUpdateAllLineDimOnAfterSalesLineModify(SalesLine);
                end;
            until SalesLine.Next() = 0;

    end;


    local procedure ConfirmUpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer) Confirmed: Boolean;
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        // OnBeforeConfirmUpdateAllLineDim(Rec, xRec, NewParentDimSetID, OldParentDimSetID, Confirmed, IsHandled);
        if not IsHandled then
            Confirmed := Confirm(Text064);
    end;




    // local procedure VerifyShippedReceivedItemLineDimChange(var ShippedReceivedItemLineDimChangeConfirmed: Boolean)
    // begin
    //     if SalesLine.IsShippedReceivedItemDimChanged() then
    //         if not ShippedReceivedItemLineDimChangeConfirmed then
    //             ShippedReceivedItemLineDimChangeConfirmed := SalesLine.ConfirmShippedReceivedItemDimChange();
    // end;



    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        // OnBeforeValidateShortcutDimCode(Rec, xRec, FieldNumber, ShortcutDimCode, IsHandled);
        if IsHandled then
            exit;

        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        if "Registration Number" <> '' then
            Modify();

        if OldDimSetID <> "Dimension Set ID" then begin
            // OnValidateShortcutDimCodeOnBeforeUpdateAllLineDim(Rec, xRec, FieldNumber);
            if not IsNullGuid(Rec.SystemId) then
                Modify();
            if SalesLinesExist() then
                UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        end;

        // OnAfterValidateShortcutDimCode(Rec, xRec, FieldNumber, ShortcutDimCode);
    end;

    procedure GetHideValidationDialog(): Boolean
    begin
        exit(HideValidationDialog);
    end;


    // [IntegrationEvent(false, false)]
    // local procedure OnBeforeShowDocDim(var SalesHeader: Record "Air Craft"; xSalesHeader: Record "Air Craft"; var IsHandled: Boolean)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnShowDocDimOnBeforeUpdateSalesLines(var SalesHeader: Record "Air Craft"; xSalesHeader: Record "Air Craft")
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnShowDocDimOnBeforeSalesHeaderModify(var SalesHeader: Record "Air Craft")
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnBeforeSalesLinesExist(var SalesHeader: Record "Air Craft"; var IsHandled: Boolean; var Result: Boolean)
    // begin
    // end;


    // [IntegrationEvent(false, false)]
    // local procedure OnBeforeUpdateAllLineDim(var SalesHeader: Record "Air Craft"; NewParentDimSetID: Integer; OldParentDimSetID: Integer; var IsHandled: Boolean; xSalesHeader: Record "Air Craft")
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnBeforeConfirmUpdateAllLineDim(var SalesHeader: Record "Air Craft"; var xSalesHeader: Record "Air Craft"; NewParentDimSetID: Integer; OldParentDimSetID: Integer; var Confirmed: Boolean; var IsHandled: Boolean)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnUpdateAllLineDimOnBeforeGetSalesLineNewDimSetID(var SalesLine: Record "Aircraft Maintenance Entry"; NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnUpdateAllLineDimOnAfterGetSalesLineNewDimsetID(SalesHeader: Record "Air Craft"; xSalesHeader: Record "Air Craft"; SalesLine: Record "Aircraft Maintenance Entry"; var NewDimSetID: Integer; NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnUpdateAllLineDimOnBeforeSalesLineModify(var SalesLine: Record "Aircraft Maintenance Entry"; xSalesLine: Record "Aircraft Maintenance Entry")
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnUpdateAllLineDimOnAfterSalesLineModify(var SalesLine: Record "Aircraft Maintenance Entry")
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnBeforeValidateShortcutDimCode(var SalesHeader: Record "Air Craft"; xSalesHeader: Record "Air Craft"; FieldNumber: Integer; var ShortcutDimCode: Code[20]; var IsHandled: Boolean)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnValidateShortcutDimCodeOnBeforeUpdateAllLineDim(var SalesHeader: Record "Air Craft"; xSalesHeader: Record "Air Craft"; FieldNumber: Integer)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnAfterValidateShortcutDimCode(var SalesHeader: Record "Air Craft"; xSalesHeader: Record "Air Craft"; FieldNumber: Integer; var ShortcutDimCode: Code[20])
    // begin
    // end;


}
