controladdin "MME Xmas Control"
{
    RequestedHeight = 300;
    RequestedWidth = 500;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;

    Scripts = 'src/Controls/js/Control.main.js';
    StyleSheets = 'src/Controls/css/controlAddIn.css';
    StartupScript = 'src/Controls/js/Control.startup.js';

    // The event is raised from Control AddIn, when it is loaded and ready to use from AL
    event OnInitialized()

    // Call the JScript function to change the blogpost image and assign the URL
    procedure SetUrl(url: Text; imageName: Text);

    // Open a neu Browser Window with this URL
    procedure OpenUrl(url: Text);
}