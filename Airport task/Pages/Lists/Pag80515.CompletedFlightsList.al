page 80515 "Completed Flights List"
{
    ApplicationArea = All;
    Caption = 'Completed Flights List';
    PageType = List;
    SourceTable = "Completed Flights";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Air Craft Registration No."; Rec."Air Craft Registration No.")
                {
                    ToolTip = 'Specifies the value of the Air Craft Registration No. field.', Comment = '%';
                }
                field("Airline No."; Rec."Airline No.")
                {
                    ToolTip = 'Specifies the value of the Airline No. field.', Comment = '%';
                }
                field("Destination Runway Name"; Rec."Destination Runway Name")
                {
                    ToolTip = 'Specifies the value of the Destination Runway Name field.', Comment = '%';
                }
                field("Flight Arrival"; Rec."Flight Arrival")
                {
                    ToolTip = 'Specifies the value of the Flight Arrival field.', Comment = '%';
                }
                field("Flight Departure"; Rec."Flight Departure")
                {
                    ToolTip = 'Specifies the value of the Flight Departure field.', Comment = '%';
                }
                field("Flight No."; Rec."Flight No.")
                {
                    ToolTip = 'Specifies the value of the Flight No. field.', Comment = '%';
                }
                field("From Airport"; Rec."From Airport")
                {
                    ToolTip = 'Specifies the value of the From Airport field.', Comment = '%';
                }
                field("Full Callout"; Rec."Full Callout")
                {
                    ToolTip = 'Specifies the value of the Full Callout field.', Comment = '%';
                }
                field("Is Completed ?"; Rec."Is Completed ?")
                {
                    ToolTip = 'Specifies the value of the Is Completed ? field.', Comment = '%';
                }
                field("Start Runway Name"; Rec."Start Runway Name")
                {
                    ToolTip = 'Specifies the value of the Start Runway Name field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("To Airport"; Rec."To Airport")
                {
                    ToolTip = 'Specifies the value of the To Airport field.', Comment = '%';
                }
            }
        }
    }
}

