page 80553 "My Document"
{
    PageType = Document;
    SourceTable = "Document Header";
    ApplicationArea = All;
    Caption = 'Request Order';
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.") { }
                field(Description; Rec.Description) { }
                field("Posting Date"; Rec."Posting Date") { }
                field("Total Amount"; Rec."Total Amount") { }
            }


            part(Lines; "Line List")
            {
                SubPageLink = "Document No." = field("No.");
            }
        }


        area(factboxes)
        {
            part(HeaderInfo; "Header FactBox")
            {
                SubPageLink = "No." = FIELD("No.");
            }
            part(LineInfo; "Line FactBox")
            {
                Provider = Lines;
                SubPageLink = "Line No." = FIELD("Line No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(PostRequest)
            {
                Caption = 'Post Request';
                ApplicationArea = All;

                trigger OnAction()
                var
                    Line: Record "Document Line";
                    PostedHeader: Record "Posted Request Header";
                    PostedLine: Record "Posted Request Line";
                begin
                    // Insert Posted Header first
                    PostedHeader.Init();
                    PostedHeader."No." := Rec."No.";
                    PostedHeader.Description := Rec.Description;
                    PostedHeader."Posting Date" := Rec."Posting Date";
                    PostedHeader."Total Amount" := Rec."Total Amount";
                    PostedHeader.Insert();

                    // Insert Posted Lines
                    Line.SetRange("Document No.", Rec."No.");
                    if Line.FindSet() then
                        repeat
                            PostedLine.Init();
                            PostedLine."Document No." := Line."Document No.";
                            PostedLine."Item Description" := Line."Item Description";
                            PostedLine.Quantity := Line.Quantity;
                            PostedLine."Unit Price" := Line."Unit Price";
                            PostedLine."Line Amount" := Line."Line Amount";
                            PostedLine."Posting Date" := Rec."Posting Date";
                            PostedLine.Insert();
                        until Line.Next() = 0;

                    Message('Request %1 posted. Header and lines moved to Posted Requests.', Rec."No.");
                end;
            }

        }
        area(Navigation)
        {
            group(DimensionsGroup)
            {
                Caption = 'Dimensions';
                Image = Dimensions;

                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        DimMgt: Codeunit DimensionManagement;
                        OldDimSetID: Integer;
                    begin
                        OldDimSetID := Rec."Dimension Set ID";

                        Rec."Dimension Set ID" :=
                          DimMgt.EditDimensionSet(Rec."Dimension Set ID", Rec."No.");

                        if Rec."Dimension Set ID" <> OldDimSetID then begin
                            Rec.Modify(true);
                            Rec.UpdateAllLineDim(Rec."Dimension Set ID", OldDimSetID); 
                        end;
                    end;
                }
            }
        }


    }
}
