table 80568 "Date Calculator Table"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Official Date"; Date) { Caption = 'Official Date'; }
        field(2; "Operation"; Option)
        {
            Caption = 'Mathematical Operation';
            OptionMembers = Addition,Substraction;
        }
        field(3; "Days"; Integer) { }
        field(4; "Weeks"; Integer) { }
        field(5; "Months"; Integer) { }
        field(6; "Years"; Integer) { }
        field(7; "Calculated Date"; Date)
        {
            Caption = 'Calculated Date';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Official Date") { Clustered = true; }
    }
}