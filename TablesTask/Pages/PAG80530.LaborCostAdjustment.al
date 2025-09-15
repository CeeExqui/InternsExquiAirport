page 80530 "Labor Cost Adjustment"
{
    PageType = Card;
    SourceTable = "Aircaft Maintenance";
    ApplicationArea = All;
    UsageCategory = Tasks;
    Caption = 'Labor Cost Adjustment';
    Editable = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Aircraft Registration No."; Rec."Aircraft Registration No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Maintance Type"; Rec."Maintance Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Current Labor Cost"; Rec."Labor Cost")
                {
                    ApplicationArea = All;
                    Caption = 'Current Labor Cost';
                    Editable = false;
                }
                field("New Labor Cost"; NewLaborCost)
                {
                    ApplicationArea = All;
                    Caption = 'New Labor Cost';

                    trigger OnValidate()
                    begin
                        if NewLaborCost < 0 then
                            Error('Labor cost cannot be negative.');

                        UpdateTotalCostPreview();
                    end;
                }
                field("Current Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = All;
                    Caption = 'Current Total Cost';
                    Editable = false;
                }
                field("New Total Cost"; NewTotalCost)
                {
                    ApplicationArea = All;
                    Caption = 'New Total Cost';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Save")
            {
                ApplicationArea = All;
                Caption = 'Save';
                Image = Save;
                ToolTip = 'Save the labor cost changes';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    MessageConfirmation: Text;
                begin
                    if NewLaborCost = 0 then
                        Error('Please enter a new labor cost value.');

                    MessageConfirmation := StrSubstNo('Are you sure you want to save the labor cost change from %1 to %2?', Rec."Labor Cost", NewLaborCost);

                    if Confirm(MessageConfirmation, true) then begin
                        Rec."Labor Cost" := NewLaborCost;

                        Rec.Modify(true);
                        Message('Labor cost has been successfully saved and updated to %1.', NewLaborCost);
                        CurrPage.Close();
                    end;
                end;
            }
            action("Cancel")
            {
                ApplicationArea = All;
                Caption = 'Cancel';
                Image = Cancel;
                ToolTip = 'Cancel the labor cost adjustment';
                Promoted = true;
                PromotedCategory = Process;


                trigger OnAction()
                begin
                    CurrPage.Close();

                end;
            }
        }
    }

    var
        NewLaborCost: Decimal;
        NewTotalCost: Decimal;

    trigger OnOpenPage()
    begin
        NewLaborCost := Rec."Labor Cost";
        UpdateTotalCostPreview();
    end;



    local procedure UpdateTotalCostPreview()
    begin
        Rec."Total Cost" := Rec."Part Cost" + NewLaborCost;
    end;
}
