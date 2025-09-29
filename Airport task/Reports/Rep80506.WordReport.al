report 80506 "Certificate of Employment"
{
    Caption = 'Certificate of Employment';
    DefaultRenderingLayout = "MainLayout";
    ApplicationArea = all;
    UsageCategory = Administration;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.";

            column(CompanyName; COmp.Name) { }
            column(CompanyLogo; Comp.Picture)
            {
            }
            column(CompanyAddress; Comp.Address)
            {
            }
            column(CompanyNumber; Comp."Phone No.")
            {
            }
            column(DateofIssuance; DateofIssuance) { }

            column(FullName; "FullName")
            {
            }
            column(pronouns; pronouns) { }

            column(CountryRegionCode; "City")
            {
            }
            column(TerminationDate; "Termination Date")
            {
            }
            column(EmploymentDate; "Employment Date")
            {
            }
            column(JobTitle; "Job Title")
            {
            }
            column(Director; Director) { }
            column(HrManager; HrManager) { }
        }

    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(Gender; MorF)
                    {
                        OptionCaption = 'Male,Female';

                    }

                }
            }
        }
    }
    rendering
    {
        layout(MainLayout)
        {

            Type = Word;
            LayoutFile = 'CertificateTask.docx';
        }
    }
    trigger OnPreReport()
    begin
        DateofIssuance := WorkDate(Today);
        Comp.get();
        comp.CalcFields(Picture);

        setEmployeeInfo();
        setPronoun();
        setHr();
        setDirector();

        message(Fullname);
    end;

    procedure setEmployeeInfo()
    begin
        Fullname := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";

    end;

    procedure setHr()
    begin

        TableEmployee.SetFilter("Job Title", 'HR Manager');
        if TableEmployee.FindFirst() then
            HrManager := TableEmployee.FullName();

    end;

    procedure setDirector()
    begin

        TableEmployee.SetFilter("Job Title", 'Director');
        if TableEmployee.FindFirst() then Director := TableEmployee.FullName();


    end;

    procedure setPronoun()
    begin
        if (MorF = 2) then
            pronouns := 'her'
        else
            pronouns := 'his'
    end;

    var
        Comp: record "Company Information";
        Fullname: Text[100];
        FullLocation: Text[100];
        DateofIssuance: Date;
        MorF: Option;
        pronouns: Text[3];
        TableEmployee: record "Employee";
        HrManager: Text[100];
        Director: Text[100];
}
