report 80633 JobCertification
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = JobCertificationLayout;
    Caption = 'Job Certification Report';

    dataset
    {
        dataitem(EmployeeInfo; Employee)
        {
            RequestFilterFields = "No.";
            column(EmployeeNo; "No.") { }
            column(FirstName; "First Name") { }
            column(LastName; "Last Name") { }
            column(JobTitle; "Job Title") { }
            column(DOB; "Birth Date") { }
            column(HireDate; "Employment Date") { }
            column(CompanyName; CompanyName) { }
            column(CompanyAddress; CompanyAddress) { }
            column(CompanyPhone; CompanyPhone) { }
            column(CompanyEmail; CompanyEmail) { }
            column(LogoPicture; companyinfo.Picture) { }
            column(CurrentDate; Today) { }
            column(HRManagerName; HRManagerName) { }
            column(HRManagerTitle; HRManagerTitle) { }
            column(DirectorName; DirectorName) { }
            column(DirectorTitle; DirectorTitle) { }
        }

    }

    rendering
    {
        layout(JobCertificationLayout)
        {
            Type = Word;
            LayoutFile = './ReportsLayout/JobCertificationLayout.docx';
        }
    }
    var
        CompanyInfo: Record "Company Information";
        CompanyName: Text[100];
        CompanyAddress: Text[100];
        CompanyPhone: Text[30];
        CompanyEmail: Text[100];
        EmployeeRec: Record Employee;
        HRManagerName: Text[100];
        HRManagerTitle: Text[100];
        DirectorName: Text[100];
        DirectorTitle: Text[100];

    trigger OnPreReport()
    begin
        if CompanyInfo.Get() then begin
            CompanyName := CompanyInfo.Name;
            CompanyInfo.CalcFields(Picture);
            CompanyAddress := CompanyInfo.Address;
            CompanyPhone := CompanyInfo."Phone No.";
            CompanyEmail := CompanyInfo."E-Mail";
        end;
        EmployeeRec.SetRange("Job Title", 'HR Manager');
        if EmployeeRec.FindFirst() then begin
            HRManagerName := EmployeeRec."First Name" + ' ' + EmployeeRec."Last Name";
            HRManagerTitle := EmployeeRec."Job Title";
        end;
        EmployeeRec.Reset();
        EmployeeRec.SetRange("Job Title", 'Director');
        if EmployeeRec.FindFirst() then begin
            DirectorName := EmployeeRec."First Name" + ' ' + EmployeeRec."Last Name";
            DirectorTitle := EmployeeRec."Job Title";
        end;
    end;
}