pageextension 80567 MyExtension extends "Bank Account Card"
{
    layout
    {
        addlast(General)
        {
            usercontrol(MyControlAddIn; "CTRLADDINTEST")
            {
                ApplicationArea = All;

                trigger ControlReady()
                begin
                end;

                trigger Notify(EventData: Text)
                begin
                    if EventData = 'openPage' then
                        Page.Run(Page::"Customer List");
                end;
            }
        }
    }
}
