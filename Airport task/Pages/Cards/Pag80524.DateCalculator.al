page 80524 DateCalculator
{
    ApplicationArea = all;
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
                Visible = isVisible;
                Caption = 'Insert the values to be added or removed';
                field(CDay; Cday)
                {
                    Caption = 'Day';

                }
                field(CMoW; CMoW)
                {
                    Caption = 'Month/Week';

                }
                field(DWY; DWY)
                {

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
                            WeekPlaceHolder: Label '<%1W>';
                            MonthPlaceHolder: Label '<%1M>';
                            YearPlaceHolder: Label '<%1Y>';
                            SubText: Text[10];
                        begin
                            if (InitialDate = 0D) then Error('Enter an initial date');
                            TempDate := InitialDate;
                            TempDate := TempDate + Cday;
                            if (DWY = true) then begin
                                SubText := StrSubstNo(WeekPlaceHolder, CMOw);
                                TempDate := CalcDate(SubText, TempDate);
                            end else begin
                                SubText := StrSubstNo(MonthPlaceHolder, CMOw);
                                TempDate := CalcDate(SubText, TempDate);
                            end;


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
        DWY: boolean;
        Totallabel: Label 'Calculate Date';
        isVisible: Boolean;

    trigger OnOpenPage()
    var
        FlagCode: Codeunit "Feature Flag Testing";
    begin
        
        isVisible := FlagCode.IsEnabled('featureflag1');
    end;


}