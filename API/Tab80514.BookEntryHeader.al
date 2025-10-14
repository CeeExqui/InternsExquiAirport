table 80514 "Book Entry Header"
{
    Caption = ' Book Entry Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Document Date"; Date)
        {

        }
        field(3; "Customer Name"; Text[100]) { }
        field(4; "Customer Email"; Text[100])
        {
            ExtendedDatatype = EMail;
        }
        field(5; "Customer Phone No"; Text[50])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(6; Status; Option)
        {
            OptionMembers = " ",Open,Borrowed,Returned,Lost;
            OptionCaption = ', Open, Borrowed, Returned, Lost';
        }



    }


    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "Document Date" := Today;
    end;



}
