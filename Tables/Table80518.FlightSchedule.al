table 80522 "Flight Schedule"
{
    Caption = 'Flight Schedule';
    DataCaptionFields = "Flight ID", "Airline No.";
    DataClassification = CustomerContent;
    LookupPageId = "Flight Schedule List";     
    DrillDownPageId = "Flight Schedule List";  
    Access = Public;                           
    Permissions = tabledata "Flight Schedule" = RIMD; 

    fields
    {
        field(1; "Flight ID"; Code[20])
        {
            Caption = 'Flight ID';
        }
        field(2; "Aircraft Reg No."; Code[20])
        {
            TableRelation = Aircraft."Registration No.";
        }

        field(3; " Callout ID "; Code[20])
        {
            TableRelation = "Aircraft Callout"."Callout ID";
        }
        field(4; "Airline No."; Code[2])
        {
            TableRelation = Airline."No.";
        }
        field(5; "Airport Code"; Code[10])
        {
            TableRelation = Airport."No.";
        }
        field(6; "Runway ID"; Code[10])
        {
            Caption = 'Runway ID';
            TableRelation = Runway."Runway ID";
            trigger OnValidate()
            var
                AircraftCallout: Record "Aircraft Callout";
                Aircraft: Record Aircraft;
                Runway: Record Runway;
            begin
                if " Callout ID " = '' then
                    Error('Please select an aircraft callout before assigning a runway.');
                //make sure that the callout chosen exists
                if not AircraftCallout.Get(" Callout ID ") then
                    Error('Callout not found.');
                //check in the callout list for the reg no of the aircraft
                if not Aircraft.Get(AircraftCallout."Aircraft Reg No.") then
                    Error('Related aircraft not found.');
                //check if runway exists
                if not Runway.Get("Runway ID") then
                    Error('Runway not found.');
                //compare the runway and aircraft width
                if Aircraft."Aircraft Width (m)" >= Runway."Width (m)" then
                    Error(
                        'Aircraft width must be less than runway width.',
                        Aircraft."Aircraft Width (m)",
                        Runway."Width (m)"
                    );
            end;
        }
        field(7; "Flight Type"; Option)
        {
            OptionMembers = Arrival,Departure;
        }
        field(8; "Scheduled Time"; DateTime)
        {
            ObsoleteState = Pending;
            ObsoleteReason = 'Replaced by Scheduled Date and separate times.';
            ObsoleteTag = 'v1.2.0';
        }
        field(9; "Scheduled Date"; Date)
        {
            Caption = 'Scheduled Date';
        }
        field(10; "Departure Time"; Time)
        {
            Caption = 'Departure Time';
        }
        field(11; "Landing Time"; Time)
        {
            Caption = 'Landing Time';
        }
        field(12; "Status"; Enum "Flight Status")
        {
            trigger OnValidate()
            var
                fiveMin: Duration;
                oldLanding: Time;
                newLanding: Time;
                CompletedFlights: Record "Completed Flights";
            begin
                if (xRec.Status <> Rec.Status) and
                    ((Rec.Status = Rec.Status::Landed) or
                    (Rec.Status = Rec.Status::Departed) or
                    (Rec.Status = Rec.Status::Completed))
                then begin

                    CompletedFlights.Init();
                    CompletedFlights."Flight ID" := Rec."Flight ID";
                    CompletedFlights."Aircraft Reg No." := Rec."Aircraft Reg No.";
                    CompletedFlights."Airline No." := Rec."Airline No.";
                    CompletedFlights."Runway ID" := Rec."Runway ID";
                    CompletedFlights."Scheduled Date" := Rec."Scheduled Date";
                    CompletedFlights.Status := Rec.Status;

                    if CompletedFlights.Insert(true) then
                        Rec.Delete(true);
                end;
            end;

        }


        field(13; "From Airport Code"; Code[10])
        {
            Caption = 'From Airport';
            TableRelation = Airport."No.";
            trigger OnValidate()
            begin
                DifferentAirports();
            end;
        }

        field(14; "To Airport Code"; Code[10])
        {
            Caption = 'To Airport';
            TableRelation = Airport."No.";
            trigger OnValidate()
            begin
                DifferentAirports();
            end;
        }
    }

    keys
    {
        key(PK; "Flight ID") { Clustered = true; }
    }

    trigger OnInsert()
    begin
        DifferentAirports();
    end;


    local procedure DifferentAirports()
    begin
        if ("From Airport Code" <> '') and
           ("To Airport Code" <> '') and
           ("From Airport Code" = "To Airport Code")
        then
            Error('From Airport and To Airport cannot be the same.', "From Airport Code");
    end;

}
