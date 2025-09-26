page 80517 "Query Test List"
{
    ApplicationArea = All;
    Caption = 'Query Test List';
    PageType = List;
    SourceTable = "Desc Temp Table";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ToolTip = 'Specifies the value of the Sell-to Customer Name field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';

                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                }
                field("VAT %"; Rec."VAT %")
                {
                    ToolTip = 'Specifies the value of the VAT % field.', Comment = '%';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ToolTip = 'Specifies the value of the Line Amount field.', Comment = '%';
                }

                field(Total; Total)
                {
                    ToolTip = 'Specifies the value of the Total field.', Comment = '%';
                }


            }
        }




    }

    actions
    {
        area(Navigation)
        {
            action("Description Filter")
            {
                trigger OnAction()
                var
                    DF: page "Description Filtering Card";
                begin
                    if DF.RunModal() = Action::OK then begin
                        Desc := '@' + Df.GetX() + '*';
                        message(Desc);

                        Filter(Desc);
                    end;
                end;
            }
        }
    }
    var
        Desc: Text[50];
        Total: Decimal;





    procedure Filter(Desc: Text[50])
    var
        MyQuery: Query "Description Dynamic Filter";
    begin
        MyQuery.SetFilter("Description", Desc);
        MyQuery.Open();
        Rec.deleteall(true);
        While MyQuery.Read() do begin
            Rec.Init();
            Rec.ID := Rec.ID + 1;
            Rec."No." := MyQuery."CompanyNo";
            Rec."Sell-to Customer Name" := MyQuery."Name";
            Rec."Posting Date" := MyQuery."PostingDate";
            Rec."Description" := MyQuery."Description";
            Rec."Quantity" := Myquery."Quantity";
            Rec."VAT %" := MyQuery."VAT";
            Rec."Line Amount" := MyQuery.LineAmount;
            Total := MyQuery.Count;
            Rec.Insert();

        end;
        MyQuery.Close();
    end;


    trigger OnOpenPage()
    begin
        Rec."ID" := 0;

    end;


}
