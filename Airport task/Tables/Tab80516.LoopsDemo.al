table 80516 "Loops Demo"
{
    Caption = 'Loops Demo';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Input"; Text[50])
        {
            Caption = '';
        }


        field(2; "SetOrder"; Text[30])
        {
            // TableRelation = "Cust. Ledger Entry" where(TableNo = const(21));

            trigger OnLookup()
            var

                FieldRec: Record "field";
            begin
                FieldRec.SetFilter(TableNo, '21');
                if Page.RunModal(9806, FieldRec) = Action::LookupOK then
                    Rec."SetOrder" := FieldRec.FieldName;

            end;

        }


        field(4; "ChosenFieldFilter"; Text[30])
        {
            trigger OnLookup()
            var

                FieldRec: Record "field";
            begin
                FieldRec.SetFilter(TableNo, '21');
                if Page.RunModal(9806, FieldRec) = Action::LookupOK then
                    Rec."ChosenFieldFilter" := FieldRec.FieldName;

            end;

            trigger OnValidate()
            begin
                Clear(Rec.FilterValue);

            end;


        }
        field(5; "FilterValue"; Text[250])
        {

        }

    }
    keys
    {
        key(PK; "Input")
        {
            Clustered = true;
        }
    }
    protected var
        testvar: integer;
}




//    field(2; "SetOrder"; Integer)
//     {
//         // TableRelation = "Cust. Ledger Entry" where(TableNo = const(21));

//         trigger OnLookup()
//         var

//             FieldRec: Record "key";
//         begin
//             FieldRec.SetFilter(TableNo, '21');
//             if Page.RunModal(80530, FieldRec) = Action::LookupOK then
//                 rEC.SetOrder := FieldRec."No.";
//         end;
//     }