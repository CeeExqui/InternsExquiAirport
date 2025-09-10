page 80522 "Aircraft Callout List"
{
    PageType = List;
    SourceTable = "Aircraft Callout";
    ApplicationArea = All;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Callout ID"; Rec."Callout ID") { }
                field("Airline No."; Rec."Airline No.") { }
                field("Aircraft Reg No."; Rec."Aircraft Reg No.") { }
                field("Callout Code"; Rec."User Callout Code") { }
            }
        }
    }
}