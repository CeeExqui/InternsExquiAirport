controladdin "CTRLADDINTEST"
{
    RequestedHeight = 80;
    MinimumHeight = 60;
    RequestedWidth = 300;
    MinimumWidth = 200;
    VerticalStretch = false;
    VerticalShrink = false;
    HorizontalStretch = true;
    HorizontalShrink = true;

    Scripts = 'Scripts/start.js';
    StartupScript = 'Scripts/start.js';

    event ControlReady();
    event Notify(EventData: Text);
}