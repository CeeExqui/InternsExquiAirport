page 80503 "Aircraft card"
{
    ApplicationArea = All;
    Caption = 'Aircraft card';
    PageType = Document;
    SourceTable = "Air Craft";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Registration Number"; Rec."Registration Number")
                {
                    ToolTip = 'Specifies the value of the Resgistration Number field.', Comment = '%';
                }
                field("Airline No."; Rec."Airline No.")
                {
                    ToolTip = 'Specifies the value of the Airline No. field.', Comment = '%';
                }

                field("Aircraft Classification"; Rec."Aircraft Classification")
                {
                    ToolTip = 'Specifies the value of the Aircraft Classification field.', Comment = '%';
                }
                field("Aircraft Type"; Rec."Aircraft Type")
                {
                    ToolTip = 'Specifies the value of the Aircraft Type field.', Comment = '%';
                }



                field("Has Cargo?"; Rec."Has Cargo?")
                {
                    ToolTip = 'Specifies the value of the Has Cargo? field.', Comment = '%';
                }

                field("Has people?"; Rec."Has people?")
                {
                    ToolTip = 'Specifies the value of the Has people? field.', Comment = '%';
                }
                field("People Capacity"; Rec."People Capacity")
                {
                    ToolTip = 'Specifies the value of the People Capacity field.', Comment = '%';
                }
                field("Capacity Cargo"; Rec."Capacity Cargo")
                {
                    ToolTip = 'Specifies the value of the Capacity Cargo field.', Comment = '%';
                }
                field("Cargo Unit of Measurement"; Rec."Cargo Unit of Measurement")
                {
                    ToolTip = 'Specifies the value of the Cargo Unit of Measurement field.', Comment = '%';
                }
                field("Last Maintenance Date"; Rec."Last Maintenance Date")
                {
                    ToolTip = 'Specifies the value of the Last Maintenance Date field.', Comment = '%';
                }
                field(Length; Rec.Length)
                {
                    ToolTip = 'Specifies the value of the Length field.', Comment = '%';
                }
                field(Width; Rec.Width)
                {
                    ToolTip = 'Specifies the value of the Width field.', Comment = '%';
                }
                field("Manufacturer Code"; Rec."Manufacturer Code")
                {
                    ToolTip = 'Specifies the value of the Manufacturer Code field.', Comment = '%';
                }
                field("Manufacturer Name"; Rec."Manufacturer Name")
                {
                    ToolTip = 'Specifies the value of the Manufacturer Name field.', Comment = '%';
                }
                field(Model; Rec.Model)
                {
                    ToolTip = 'Specifies the value of the Model field.', Comment = '%';
                }


                field("Total maintenance Cost"; Rec."Total maintenance Cost")
                {
                    ToolTip = 'Specifies the value of the Total maintenance Cost field.', Comment = '%';
                }

            }
            group(Maintenance)
            {

                part("Maintenance Parts"; "Maintenance List Part")
                {
                    // Provider = "General Info";
                    SubPageLink = "Aircraft Registration No." = field("Registration Number");
                    UpdatePropagation = Both;
                }
            }
        }
        area(FactBoxes)
        {
            part("General Info"; "Aircraft FactBox Header")
            {

                SubPageLink = "Registration Number" = field("Registration Number");



            }

            part("Repair Info"; "Aircraft FactBox Lines")
            {
                Provider = "Maintenance Parts";
                SubPageLink = "Entry No." = field("Entry No.");


            }

        }
    }
    actions
    {

        area(Navigation)
        {
            action(Dimensions)
            {
                AccessByPermission = TableData Dimension = R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Enabled = Rec."Registration Number" <> '';
                Image = Dimensions;
                ShortCutKey = 'Alt+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                trigger OnAction()
                begin
                    Rec.ShowDocDim();
                    CurrPage.SaveRecord();
                end;
            }
        }

    }




    trigger OnAfterGetCurrRecord()
    begin
        CurrPage."General Info".Page.Update();
    end;

    procedure updateCue()
    begin
        CurrPage."General Info".Page.Update();
    end;

    var
        LineNumber: Integer;



}