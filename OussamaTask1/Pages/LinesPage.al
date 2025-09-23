page 80552 "Line List"
{
    PageType = ListPart;
    SourceTable = "Document Line";
    ApplicationArea = All;
    Caption = 'Request Lines';
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.") { }
                field("Document No."; Rec."Document No.") { }
                field("Item Description"; Rec."Item Description") { }
                field(Quantity; Rec.Quantity) { }
                field("Unit Price"; Rec."Unit Price") { }
                field("Line Amount"; Rec."Line Amount") { }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = All;
                    Caption = 'Dimensions';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Dimensions)
            {
                Caption = 'Dimensions';
                Image = Dimensions;
                ApplicationArea = All;

                trigger OnAction()
                var
                    DimMgt: Codeunit DimensionManagement;
                begin
                    Rec."Dimension Set ID" := DimMgt.EditDimensionSet(Rec."Dimension Set ID", Rec."Document No.");
                    Rec.Modify(true);
                end;
            }
        }
    }
}
