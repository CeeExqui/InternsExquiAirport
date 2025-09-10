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
            NotBlank = true;
        }
        field(2; "Aircraft Reg No."; Code[20])
        {
            TableRelation = Aircraft."Registration No.";
            NotBlank = true;
        }

        field(3; "Callout ID"; Code[20])
        {
            TableRelation = "Aircraft Callout"."User Callout Code" where("Airline No." = field("Airline No."));
        }

        field(4; "Airline No."; Code[2])
        {
            TableRelation = Airline."No.";
        }
        field(5; "Airport Code"; Code[10])
        {
            TableRelation = Airport."No.";
            ObsoleteState = Removed;
            ObsoleteReason = 'Changed Runway Functionality';
            ObsoleteTag = 'v1.4.0';

        }
        field(6; "Runway ID"; Code[10])
        {
            Caption = 'Runway ID';
            TableRelation =
            if ("Flight Type" = const(Arrival)) Runway."Runway ID" where("Airport Code" = field("To Airport Code"))
            else if ("Flight Type" = const(Departure)) Runway."Runway ID" where("Airport Code" = field("From Airport Code"))
            else
            Runway."Runway ID";
            trigger OnValidate()
            var
                AircraftCallout: Record "Aircraft Callout";
                Aircraft: Record Aircraft;
                Runway: Record Runway;
            begin
                if "Callout ID" = '' then
                    Error('Please select an aircraft callout before assigning a runway.');
                //make sure that the callout chosen exists
                if not AircraftCallout.Get("Callout ID") then
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
                begin
                    if "Callout ID" = '' then
                        Error('Please select an aircraft callout before assigning a runway.');

                    if not AircraftCallout.Get("Callout ID") then
                        Error('Callout not found.');

                    if not Aircraft.Get(AircraftCallout."Aircraft Reg No.") then
                        Error('Related aircraft not found.');

                    if not Runway.Get("Runway ID") then
                        Error('Runway not found.');

                    case "Flight Type" of
                        "Flight Type"::Arrival:
                            begin
                                if "To Airport Code" = '' then
                                    Error('Select the To Airport before choosing a runway.');

                                if Runway."Airport Code" <> "To Airport Code" then
                                    Error('Selected runway belongs to airport %1, but this flight arrives to %2.',
                                          Runway."Airport Code", "To Airport Code");
                            end;

                        "Flight Type"::Departure:
                            begin
                                if "From Airport Code" = '' then
                                    Error('Select the From Airport before choosing a runway.');

                                if Runway."Airport Code" <> "From Airport Code" then
                                    Error('Selected runway belongs to airport %1, but this flight departs from %2.',
                                          Runway."Airport Code", "From Airport Code");
                            end;
                    end;
                end;
            end;

        }
        field(7; "Flight Type"; Option) //Done
        {
            OptionMembers = " ",Arrival,Departure;
            ValuesAllowed = 1, 2;
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
        field(12; "Status"; Enum "Flight Status") //DONE 
        {
            trigger OnValidate()
            var
                CompletedFlights: Record "Completed Flights";
            begin
                if (xRec.Status <> Rec.Status) and
                ((Rec.Status = Rec.Status::Landed) or
                    (Rec.Status = Rec.Status::Departed) or
                    (Rec.Status = Rec.Status::Completed))
                then begin
                    CompletedFlights.Init();
                    CompletedFlights.TransferFields(Rec);
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
        key(PK; "Flight ID", "Airline No.", "Callout ID") { Clustered = true; }
        key(ArrivalsByAirport; "Flight Type", "To Airport Code", "Scheduled Date") { }
        key(DeparturesByAirport; "Flight Type", "From Airport Code", "Scheduled Date") { }
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
