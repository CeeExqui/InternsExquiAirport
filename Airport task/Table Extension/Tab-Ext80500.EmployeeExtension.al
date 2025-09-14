tableextension 80500 "Employee Extension " extends Employee
{
    fields
    {
        field(80500; "Fixed Salary"; Boolean)
        {
        }

        field(85002; "Salary"; Decimal) { }
        field(85003; "Airport"; Code[20])
        {
            TableRelation = Airport."No.";
        }
        field(85004; "Remote"; Boolean) { }
    }
}

