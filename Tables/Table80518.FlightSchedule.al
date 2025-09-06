table 80522 "Flight Schedule"
{
    fields
    {
        field(1; "Flight ID"; Code[20])
        {
            Caption = 'Flight ID';
        }
        field(2; "Aircraft Reg No."; Code[20])
        {
            ObsoleteState = Pending;
            ObsoleteReason = 'Replaced by Callout ID';
            ObsoleteTag = 'v1.1.0';
            TableRelation = Aircraft."Registration No.";
        }

        field(3;" Callout ID "; Code[20])
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

                if not AircraftCallout.Get(" Callout ID ") then
                    Error('Callout not found.');

                if not Aircraft.Get(AircraftCallout."Aircraft Reg No.") then
                    Error('Related aircraft not found.');

                if not Runway.Get("Runway ID") then
                    Error('Runway not found.');

                if Aircraft."Aircraft Width (m)" >= Runway."Width (m)" then
                    Error(
                        'Aircraft width must be less than runway Width.',
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

        }
        field(9; "Status"; Enum "Flight Status")
        {
        }
        field(10; "From Airport Code"; Code[10])
        {
            Caption = 'From Airport';
            TableRelation = Airport."No.";
        }

        field(11; "To Airport Code"; Code[10])
        {
            Caption = 'To Airport';
            TableRelation = Airport."No.";
        }
    }
    keys
    {
        key(PK; "Flight ID") { Clustered = true; }
    }

    trigger OnModify()
    var
        Completed: Record "Completed Flights";
    begin
        if Status = Status::Completed then begin
            Completed.Init();
            Completed.TransferFields("Rec");
            Completed.Insert(true); // true = run trigger
            Rec.Delete(true);       // true = run OnDelete trigger
        end;
    end;
}