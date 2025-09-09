page 80500 "Airline Card"
{
    ApplicationArea = All;
    Caption = 'Airline Card';
    PageType = Card;
    SourceTable = Airline;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ToolTip = 'Specifies the value of the Contact field.', Comment = '%';
                }
                field("Phone Number"; Rec."Phone Number")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
                field("Total Ammount of Aircraft"; Rec."Total Ammount of Aircraft")
                {
                    ToolTip = 'Specifies the value of the Inventory field.', Comment = '%';
                }

            }
        }
    }
}
