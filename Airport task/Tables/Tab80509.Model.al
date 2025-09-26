table 80509 Model
{
    Caption = 'Model';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Model Name"; Code[50])
        {
            NotBlank = true;

        }
        field(2; "Manufacturer Name"; Text[50])
        {
            TableRelation = Manufacturer.Name;

            trigger OnValidate()
            var
                Manufacturer: Record Manufacturer;
            begin
                Manufacturer.SetFilter("Name", Rec."Manufacturer Name");
                if Manufacturer.IsEmpty() then
                    Error('Couldnt find the manufacturer');
            end;
        }
    }
    keys
    {
        key(PK; "Model Name")
        {
            Clustered = true;
        }
    }
}
