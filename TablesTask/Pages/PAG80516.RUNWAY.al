page 80516 "Runway List"
{
    PageType = List;
    SourceTable = Runway;
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Runway Card";
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Runway ID"; Rec."Runway ID") { }
                field("Airport Code"; Rec."Airport Code") { }
                field("Length (m)"; Rec."Length (m)") { }
                field("Width (m)"; Rec."Width (m)") { }
            }
        }
    }
}