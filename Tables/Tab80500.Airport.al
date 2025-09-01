table 80500 Airport
{
    Caption = 'Airport';

    fields
    {
        field(1; "No."; Code[4])
        {
            SqlDataType = "Varchar";

        }
        field(2; Name; Text[50])
        {
        }
        field(3; City; Text[50])
        {
        }
    }
    // keys
    // {
    //     key(PK; "")
    //     {
    //         Clustered = true;
    //     }
}

