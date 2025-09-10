tableextension 80513 "Employee Extension" extends Employee
{
    fields
    {
        field(80500; "Airport No."; Code[3])
        {
            Caption = 'Airport No.';
            TableRelation = "Airport"."No.";
            DataClassification = CustomerContent;
        }

        // Salary type (fixed/hourly)
        field(80501; "Salary Type"; Enum "Salary Type")
        {
            Caption = 'Salary Type';
            DataClassification = CustomerContent;
        }
    }
}