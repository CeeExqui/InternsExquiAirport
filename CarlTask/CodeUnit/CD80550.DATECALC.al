codeunit 80550 "Date CALC"
{
    procedure CalculateDate(var CalculateRec: Record "Date Calculator Table")
    var
        DateForm: Text;
        Sign: Text[1];
    begin
        case CalculateRec."Operation" of
            CalculateRec."Operation"::Addition:
                Sign := '+';
            CalculateRec."Operation"::Substraction:
                Sign := '-';
        end;

        DateForm := '<';
        if CalculateRec.Days <> 0 then
            DateForm += Sign + Format((CalculateRec.Days)) + 'D';
        if CalculateRec.Weeks <> 0 then
            DateForm += Sign + Format((CalculateRec.Weeks)) + 'W';
        if CalculateRec.Months <> 0 then
            DateForm += Sign + Format((CalculateRec.Months)) + 'M';
        if CalculateRec.Years <> 0 then
            DateForm += Sign + Format((CalculateRec.Years)) + 'Y';
        DateForm += '>';
        if DateForm = '<>' then
            Error('Choose At Least One');

        CalculateRec."Calculated Date" := CalcDate(DateForm, CalculateRec."Official Date");
        CalculateRec.Modify();
    end;

}