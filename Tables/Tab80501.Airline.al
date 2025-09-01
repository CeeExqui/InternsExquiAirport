table 80501 Airline
{
    Caption = 'Airline';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[2])
        {
        }
        field(2; "Name"; Text[50]) { }
        field(3; "Contact Name"; Text[100])
        {
            Caption = 'Contact';
            OptimizeForTextSearch = true;
            ToolTip = 'Specifies the name of the person you regularly contact when you do business with this customer.';

        }
        field(4; "Phone Number"; Text[30])
        {
            Caption = 'Phone No.';
            OptimizeForTextSearch = true;
            ExtendedDatatype = PhoneNo;
            ToolTip = 'Specifies the customer''s telephone number.';
        }
        field(5; "Total Ammount of Aircraft"; Integer)
        {
            //flowfield
        }
    }

}
