report 80631 "Aircraft Report"
{
    Caption = 'Aircraft Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = AircraftLayout;

    dataset
    {
        dataitem(AircraftMaintenance; "Aircaft Maintenance")
        {
            RequestFilterFields = "Aircraft Registration No.", "End Date";
            column(Start_Date; "Start Date") { }
            column(End_Date; "End Date") { }
            column(Total_Cost; "Total Cost") { }
            dataitem(Aircraft; "Aircraft")
            {
                DataItemLink = "Registration No." = field("Aircraft Registration No.");
                column(RegistrationNo; "Registration No.") { }
                column(Model; "Model") { }
                column(Manufacturer; "Manufacturer") { }
                column(Capacity; "Capacity People") { }
                column(Total_Maintenance_Cost; "Total Maintenance Cost") { }
                column(Last_Maintenance_Date; "Last Maintenance Date") { }
                column(MaintenanceDateFilter; "Maintenance Date Filter") { }

                //trigger OnAfterGetRecord()
                //begin
                // DateFilter := '';
                // if AircraftMaintenance."End Date" <> 0D then
                //  DateFilter := Format(AircraftMaintenance."End Date");
                //  MaintenanceDateFilter := DateFilter;
                //   end;
            }
        }
    }
    rendering
    {
        layout(AircraftLayout)
        {
            Type = RDLC;
            LayoutFile = './ReportsLayout/AircraftReport.rdl';
        }
    }

    var
        TotalCost: Decimal;
        LastDate: Date;
        DateFilter: Text;
        MaintenanceDateFilter: Text;
}