pageextension 80604 "EmployeeCardExt" extends "Employee Card"
{
    actions
    {
        addlast(Processing)
        {
            action(PrintJobCertification)
            {
                ApplicationArea = All;
                Caption = 'Print Job Certification';
                Image = Print;

                trigger OnAction()
                var
                    EmployeeRec: Record Employee;
                begin
                    EmployeeRec := Rec;
                    EmployeeRec.SetRange("No.", Rec."No.");
                    Report.RunModal(Report::JobCertification, true, false, EmployeeRec);
                end;
            }
        }
    }
}
