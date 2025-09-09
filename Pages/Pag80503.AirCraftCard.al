page 80503 "Air Craft Card"
{
    ApplicationArea = All;
    Caption = 'Air Craft Card';
    PageType = Card;
    SourceTable = "Air Craft";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Aircraft Classification"; Rec."Aircraft Classification")
                {
                    ToolTip = 'Specifies the value of the Aircraft Classification field.', Comment = '%';
                }
                field("Aircraft Type"; Rec."Aircraft Type")
                {
                    ToolTip = 'Specifies the value of the Aircraft Type field.', Comment = '%';
                }
                field("Airline No."; Rec."Airline No.")
                {
                    ToolTip = 'Specifies the value of the Airline No. field.', Comment = '%';
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
                field("Manufacturer Code"; Rec."Manufacturer Code")
                {
                    ToolTip = 'Specifies the value of the Manufacturer Code field.', Comment = '%';
                }
                field(Model; Rec.Model)
                {
                    ToolTip = 'Specifies the value of the Model field.', Comment = '%';
                }
                field("People Capacity"; Rec."People Capacity")
                {
                    ToolTip = 'Specifies the value of the People Capacity field.', Comment = '%';
                }
                field("Resgistration Number"; Rec."Resgistration Number")
                {
                    ToolTip = 'Specifies the value of the Resgistration Number field.', Comment = '%';
                }
                field("Total maintenance Cost"; Rec."Total maintenance Cost")
                {
                    ToolTip = 'Specifies the value of the Total maintenance Cost field.', Comment = '%';
                }
            }
        }
    }
}
