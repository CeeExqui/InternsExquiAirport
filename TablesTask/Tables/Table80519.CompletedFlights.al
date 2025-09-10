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
        field(3; " Callout ID "; Code[20]) { }
        field(4; "Airline No."; Code[2]) { }
        field(5; "Airport Code"; Code[10]) { }
        field(6; "Runway ID"; Code[20]) { }
        field(7; "Flight Type"; Option) { OptionMembers = Arrival,Departure; }

        field(8; "Scheduled Time"; DateTime)
        {
            ObsoleteState = Pending;
            ObsoleteReason = 'Changed';
            ObsoleteTag = 'v1.3.0';
        }

        field(9; "Scheduled Date"; Date) { }
        field(10; "Departure Time"; Time)
        {
            Caption = 'Departure Time';
        }

        field(11; "Landing Time"; Time)
        {
            Caption = 'Landing Time';
        }
        field(12; "Status"; Enum "Flight Status") { }
        field(13; "From Airport Code"; Code[10])
        {
            Caption = 'From Airport';
            TableRelation = Airport."No.";
        }
        field(14; "To Airport Code"; Code[10])
        {
            Caption = 'To Airport';
            TableRelation = Airport."No.";
        }
    }

    keys
    {
        key(PK; "Flight ID") { Clustered = true; }
    }
}
