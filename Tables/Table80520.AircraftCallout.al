table 80524 "Aircraft Callout"
{
    Caption = 'Flight Schedule';
    DataCaptionFields = "Callout ID";
    DataClassification = CustomerContent;
    LookupPageId = "Aircraft Callout List";     
    DrillDownPageId = "Aircraft Callout List";  
    Access = Public;                           
    Permissions = tabledata "Aircraft Callout" = RIMD; 

    fields
    {
        field(1; "Callout ID"; Code[20]) { }
        field(2; "Airline No."; Code[2]) { TableRelation = Airline."No."; }
        field(3; "Aircraft Reg No."; Code[20]) { TableRelation = Aircraft."Registration No."; }
        field(4; "Suffix No."; Integer)
        {
            ObsoleteState = Removed; 
            ObsoleteReason = 'Replaced by Callout ID';
            ObsoleteTag = 'v1.1.0';
        }
    }
    keys
    {
        key(PK; "Callout ID") { Clustered = true; }
    }
    trigger OnInsert()
    begin
        "Callout ID" := "Airline No." + Format("Callout ID");
    end;
}