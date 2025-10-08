table 80555 "Customer Meeting"
{
    Caption = 'Customer Meeting';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(3; "Customer Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Editable = false;
        }
        field(4; "Subject"; Text[100]) { }
        field(5; "Meeting Date"; Date) { }
        field(6; "Start Time"; Time) { }
        field(7; "End Time"; Time) { }
        field(8; "Location"; Text[100]) { }
        field(9; "Message"; Text[250]) { }
        field(10; "Email Sent"; Boolean) { Editable = false; }
        field(11; "Email Sent Date"; Date) { Editable = false; }
    }

    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
    }
}
