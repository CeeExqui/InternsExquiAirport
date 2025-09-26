report 80502 "AirCraft Maintenance Report"
{
    ApplicationArea = All;
    Caption = 'AirCraft Maintenance Report';
    UsageCategory = Administration;
    DefaultRenderingLayout = InitialLayout;
    dataset
    {
        dataitem("Air Craft"; "Air Craft")
        {
            RequestFilterFields = "Airline No.";

            column(Airline_No_; "Airline No.") { }
            column(Model; Model) { }
            column(Manufacturer_Name; "Manufacturer Name") { }
            column(People_Capacity; "People Capacity") { }


            dataitem(AircraftMaintenanceEntry; "Aircraft Maintenance Entry")
            {

                DataItemLink = "Aircraft Registration No." = field("Registration number");

                RequestFilterFields = "Maintenance Start Date";

                column(MaintenanceStartDate; "Maintenance Start Date")
                {
                }
                column(MaintenanceEndDate; "Maintenance End Date")
                {
                }
                column(TotalCost; "Total Cost")
                {
                }

            }
        }


    }
    rendering
    {
        layout(InitialLayout)
        {

            type = RDLC;
            LayoutFile = 'TEST2.RDL';
        }
    }

}

