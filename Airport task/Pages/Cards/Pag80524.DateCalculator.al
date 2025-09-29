page 80524 DateCalculator
{
    ApplicationArea = All;
    Caption = 'Date Calculator';
    PageType = Card;
    UsageCategory = Administration;
    layout
    {
        area(Content)
        {
            group(Initial)
            {
                Caption = 'Insert the Date';
                field(Day; InitialDate)
                {

                }


            }
            group(Compute)
            {
                Caption = 'Insert the values to be added or removed';
                field(CDay; Cday)
                {

                }
                field(CMoW; CMoW)
                {
                    Caption = 'Month/Week';

                }
                field(CYear; CYear)
                {
                    Caption = 'Year';


                }



                group(Footer)
                {
                    Caption = '';
                    field(Totallabel; Totallabel)
                    {
                        ShowCaption = false;
                        Editable = false;

                        trigger OnDrillDown()
                        var
                            MonthPlaceHolder: Label '<%1M>';
                            YearPlaceHolder: Label '<%1Y>';
                            SubText: Text[10];
                        begin
                            if (InitialDate = 0D) then Error('Enter a initial Date');
                            TempDate := InitialDate;
                            TempDate := TempDate + Cday;
                            SubText := StrSubstNo(MonthPlaceHolder, CMOw);
                            TempDate := CalcDate(SubText, TempDate);
                            SubText := StrSubstNo(YearPlaceHolder, Cyear);
                            TempDate := CalcDate(SubText, TempDate);

                            Message(TempDate.ToText());




                        end;
                    }

                }


            }

        }
    }
    var
        InitialDate: Date;
        InitialMonthWeek: Integer;
        InitialYear: Integer;
        CDay: Integer;
        CMoW: Integer;
        CYear: Integer;
        Total: Date;
        TempDate: Date;

        Totallabel: Label 'Calculate Date';
}