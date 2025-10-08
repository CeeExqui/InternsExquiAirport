controladdin "IterationSimulatorControl"
{
    RequestedHeight = 200;
    MinimumHeight = 150;
    RequestedWidth = 600;
    MinimumWidth = 400;
    VerticalStretch = false;
    VerticalShrink = false;
    HorizontalStretch = true;
    HorizontalShrink = true;

    Scripts = 'Scripts/iterationButtons.js';
    StartupScript = 'Scripts/iterationButtons.js';

    event ControlReady();
    event ButtonClicked(ButtonType: Text);

    procedure EnableButtons(EnabledButtons: Text);
    procedure SetButtonStates(ButtonStates: Text);
}