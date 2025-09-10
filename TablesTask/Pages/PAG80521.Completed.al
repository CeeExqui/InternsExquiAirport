page 80521 "Completed Flights"
{
    PageType = List;
    SourceTable = "Completed Flights";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Flight ID"; Rec."Flight ID") { }
                field("Aircraft Reg No."; Rec."Aircraft Reg No.") { }
                field("Airline No."; Rec."Airline No.") { }
                field("Runway ID"; Rec."Runway ID") { }
                field("Scheduled Time"; Rec."Scheduled Date") { }
                field("Status"; Rec.Status) { }
            }
        }
    }
}