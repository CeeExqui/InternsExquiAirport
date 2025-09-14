table 80507 "Completed Flights"
{
    Caption = 'Completed Flights';
    DataClassification = ToBeClassified;
    Permissions = tabledata "Flights" = r; //TODO look into table data [table]
    //TODO see what permissions do

    fields
    {
        field(1; "Flight No."; Integer) //TODO auto increment entry number
        {

        }
        field(2; "Airline No."; Code[2]) //TODO cant have the same airplane flying at the same time 
        {

        }
        field(3; "Air Craft Registration No."; Code[6])
        {

        }
        field(4; "Full Callout"; Code[20])
        {


        }

        field(5; "Flight Departure"; DateTime)
        {

        }
        Field(6; "Flight Arrival"; DateTime)
        {

        }
        Field(7; "From Airport"; Text[50])
        {

        }
        field(8; "To Airport"; Text[50])
        {
            TableRelation = "Airport"."No.";

        }
        field(9; "Start Runway Name"; Code[50]) //TODO make it that runway HAS to belong to an airport
        {



        }//TODO ADD STATUS

        field(10; "Destination Runway Name"; Code[50])
        {

        }
        field(11; "Status"; Option)
        {
            OptionMembers = " ",Arriving,Landing;


        }
        field(12; "Is Completed ?"; Boolean)
        {

        }
    }

}
