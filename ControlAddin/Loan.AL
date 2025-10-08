controladdin MyControlAddIn
{

    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts =
        'index.js';
    StyleSheets =
        'style.css';
    StartupScript = 'startupScript.js';


    event ControlReady();
    event ShowLoanSummary(Summary: Text);

}