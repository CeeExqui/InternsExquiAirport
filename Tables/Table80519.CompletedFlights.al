table 80523 "Completed Flights"
{

    Caption = 'Completed Flights';
    DataCaptionFields = "Status";
    DataClassification = CustomerContent;
    LookupPageId = "Completed Flights";
    DrillDownPageId = "Completed Flights";
    Access = Public;
    Permissions = tabledata "Completed Flights" = R;

    fields
    {
        field(1; "Flight ID"; Code[20]) { }
        field(2; "Aircraft Reg No."; Code[20]) { }
        field(3; "Airline No."; Code[2]) { }
        field(4; "Airport Code"; Code[10]) { }
        field(5; "Runway ID"; Code[10]) { }
        field(6; "Flight Type"; Option) { OptionMembers = Arrival,Departure; }
        field(7; "Scheduled Time"; DateTime)
        {
            ObsoleteState = Pending;
            ObsoleteReason = 'Changed';
            ObsoleteTag = 'v1.3.0';
        }
        field(8; "Scheduled Date"; Date) { }
        field(9; "Status"; Enum "Flight Status") { }
    }

    keys
    {
        key(PK; "Flight ID") { Clustered = true; }
    }
}