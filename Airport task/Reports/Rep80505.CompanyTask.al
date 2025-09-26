report 80505 CompanyTask
{
    ApplicationArea = All;
    Caption = 'Item availability per location';
    UsageCategory = Administration;
    DefaultRenderingLayout = "MainLayout";







    dataset
    {





        dataitem(Item; Item)
        {
            RequestFilterFields = "No.";

            column(Logo; Comp.Picture) { }
            column(CompName; CompName) { }
            column(CompAddress; CompAddress) { }
            column(CompPhone; CompPhone) { }

            column(No; "No.")
            {

            }
            column(Description; Description)
            {
            }
            column(Inventory; Inventory)
            {
            }
            column(Picture; Picture)
            {
            }


            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = field("No.");
                column(Location; "Location Code")
                { }
                column(Quantity; Quantity) { }

                trigger OnPreDataItem()
                begin


                end;

            }
            //     trigger OnPreDataItem()
            //     begin
            //         Item.SetFilter("No.", '<>0');
            //     end;



        }


    }

    rendering
    {
        layout(MainLayout)
        {

            Type = RDLC;
            LayoutFile = 'CompanyTask.RDL';
        }
    }
    trigger OnPreReport()
    begin
        if (Comp.get()) then begin
            CompName := Comp.Name;
            CompAddress := Comp.Address;
            CompPhone := Comp."Phone No.";
            Comp.CalcFields(Picture);
        end;

    end;

    var
        Comp: record "Company Information";

        CompName: Text[100];
        CompAddress: Text[100];
        CompPhone: Text[30];


}
