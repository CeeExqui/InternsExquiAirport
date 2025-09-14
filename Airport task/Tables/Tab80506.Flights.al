table 80506 Flights
{
    Caption = 'Flights';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Flight No."; Integer) //TODO auto increment entry number
        {
            AutoIncrement = true;
            Editable = false;

        }
        field(2; "Airline No."; Code[2]) //TODO cant have the same airplane flying at the same time 
        {
            TableRelation = "Airline"."No.";
            NotBlank = true;
            trigger OnValidate()
            begin
                callouts();

            end;
        }
        field(3; "Air Craft Registration No."; Code[6])
        {
            TableRelation = "Air Craft"."Registration Number";
            NotBlank = true;

        }
        field(4; "Full Callout"; Code[20])
        {
            TableRelation = if ("Airline No." = const('')) Airline."Callout"
            else if ("Airline No." = filter(<> '')) Airline."Callout" where("No." = field("Air Craft Registration No."));
            ValidateTableRelation = false;
            NotBlank = true;


            trigger OnValidate()
            begin
                callouts();
            end;

        }

        field(5; "Flight Departure"; DateTime)
        {
            NotBlank = true;
            trigger OnValidate()
            begin
                validateFlightDeparture();
            end;
        }
        Field(6; "Flight Arrival"; DateTime)
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                validateFlightArrival();
            end;
        }
        Field(7; "From Airport"; Code[3])
        {
            TableRelation = "Airport"."No.";

            trigger OnValidate()
            begin
                ValidateAirport();
                // validateStartAirport();
            end;
        }
        field(8; "To Airport"; Text[50])
        {
            TableRelation = "Airport"."No.";

            trigger OnValidate()
            begin
                validateAirport();
                validateEndAirport();
            end;
        }
        field(9; "Start Runway Name"; Code[50]) //TODO make it that runway HAS to belong to an airport
        {
            TableRelation = if ("From Airport" = filter(<> '')) "RunWay"."Runway Name" WHERE("Airport No." = field("From Airport"));
            NotBlank = true;

            trigger OnValidate()
            begin
                RunwayLimit(Rec."Start Runway Name");
                validateRunway("Start Runway Name");

            end;



        }//TODO ADD STATUS

        field(10; "Destination Runway Name"; Code[50])
        {
            TableRelation = if ("To Airport" = filter(<> '')) "RunWay"."Runway Name" WHERE("Airport No." = field("To Airport"));
            NotBlank = true;

            trigger OnValidate()
            var

            begin
                validateRunway(Rec."Destination Runway Name");
                RunwayLimit(Rec."Destination Runway Name");
            end;
        }
        field(11; "Status"; Option)
        {
            OptionMembers = " ",Arriving,Landing;

            ValuesAllowed = 1, 2;
        }
        field(12; "Is Completed ?"; Boolean)
        {
            trigger OnValidate()
            begin
                move();
            end;
        }
    }

    keys
    {
        key(PK; "Flight No.")
        {
            Clustered = true;
        }
    }

    var
        call: Code[2];
        Runway: Record Runway;

    local procedure RunwayLimit(RunwayName: code[50]) //TODO fix this
    var
        Runway: Record "RunWay";
        Aircraft: Record "Air Craft";
    begin
        if (Runway.get(RunwayName) and Aircraft.get(Rec."Air Craft Registration No.")) then
            if (Aircraft.Width > Runway.Width) then
                Error('Aircraft too wide for the runway.')

            else
                Error('Please enter an Air Craft Registration No first.');

    end;

    local procedure callouts() //todo remove take it form table relation
    var
        callout: Record Airline;
    begin
        if (callout.get("Airline No.")) then
            if (Rec."Full Callout" <> '') then
                if (callout.Callout <> CopyStr(Rec."Full Callout", 1, 2)) then Error('Invalid callout prefix');

    end;



    local procedure move() //TODO find another way
    var
        destination: Record "Completed Flights";
    begin

        destination.Init();
        destination.TransferFields(Rec);
        destination.Insert(True);

    end;

    local procedure validateFlightDeparture()
    begin
        if (Rec."Flight Arrival" <> 0DT) then
            if (Rec."Flight Arrival" < Rec."Flight Departure") then
                Error('Cannot have an end Date later than a start date.');


    end;

    local procedure validateFlightArrival()
    begin
        if (Rec."Flight Departure" <> 0DT) then
            if (Rec."Flight Arrival" < Rec."Flight Departure") then
                Error('Cannot have an end Date later than a start date.');


    end;

    local procedure validateAirport()
    begin
        if (Rec."From Airport" = Rec."To Airport") then
            Error('Cannot have the same Airport as start and end points.');

    end;

    // local procedure validateStartAirport()

    // begin
    //     checkStatus();
    //     case Rec.Status of
    //         1:

    //     end;

    //     end;

    local procedure validateEndAirport()
    begin
        checkStatus();
        if (Rec.Status = 2) then
            if ("From Airport" = '') then
                Error('Please select a landing airport.')
    end;

    local procedure checkStatus()
    begin
        if (Rec.Status = 0) then Error('Please select the status of the flight');

    end;


    local procedure validateRunway(RunwayName: Code[50])
    Var
        Runway: Record RunWay;
    begin

    end;

}
//TODO for later look into Record.SetFilter()
