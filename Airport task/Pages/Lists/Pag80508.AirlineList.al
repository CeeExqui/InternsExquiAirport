page 80508 "Airline List"
{
    ApplicationArea = All;
    Caption = 'Airline List';
    PageType = List;
    SourceTable = Airline;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field(Callout; Rec.Callout)
                {
                    ToolTip = 'Specifies the value of the Callout field.', Comment = '%';
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ToolTip = 'Specifies the value of the Contact field.', Comment = '%';
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ToolTip = 'Specifies the value of the Contact No. field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
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
