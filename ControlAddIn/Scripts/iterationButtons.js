var controlContainer;
var buttons = {};

function initializeIterationControls() {
    try {
        console.log('Initializing Iteration Simulator Controls...');
        //to clear any existing content
        document.body.innerHTML = '';
        
        //create the div container that will hold the buttons
        controlContainer = document.createElement('div');
        controlContainer.style.padding = '8px';
        controlContainer.style.backgroundColor = '#f8f9fa';
        controlContainer.style.border = '1px solid #dee2e6';
        controlContainer.style.borderRadius = '6px';
        controlContainer.style.fontFamily = 'Segoe UI';
        controlContainer.style.height = 'auto';
        controlContainer.style.minHeight = '120px';
        controlContainer.style.maxHeight = '200px';
        controlContainer.style.boxSizing = 'border-box';

        // create the title element
        var title = document.createElement('h3');
        title.innerText = 'Iteration Controls';
        title.style.margin = '0 0 15px 0';
        title.style.color = '#495057';
        title.style.textAlign = 'center';
        controlContainer.appendChild(title);
        
        //button container
        var buttonContainer = document.createElement('div');
        buttonContainer.style.display = 'grid';
        buttonContainer.style.gridTemplateColumns = 'repeat(auto-fit, minmax(100px, 1fr))';
        buttonContainer.style.gap = '10px';
        buttonContainer.style.marginBottom = '15px';
        
        //Buttons and design
        var buttonDefinitions = [
            { id: 'start', text: 'START', color: '#28a745'},
            { id: 'next', text: 'NEXT', color: '#17a2b8'},
            { id: 'skip', text: 'SKIP', color: '#ffc107'},
            { id: 'repeat', text: 'REPEAT', color: '#6f42c1'},
            { id: 'break', text: 'BREAK', color: '#fd7e14'},
            { id: 'exit', text: 'EXIT', color: '#dc3545'},
            { id: 'quit', text: 'QUIT', color: '#6c757d'}
        ];
        
        buttonDefinitions.forEach(function(btnDef) {
            var btn = createButton(btnDef);
            buttons[btnDef.id] = btn;
            buttonContainer.appendChild(btn);
        });
        
        controlContainer.appendChild(buttonContainer);
        //display the buttons
        document.body.appendChild(controlContainer);
        
        //tell BC that the buttons are ready for interaction
        setTimeout(function() {
            try {
                if (typeof Microsoft !== 'undefined' && Microsoft.Dynamics && Microsoft.Dynamics.NAV && Microsoft.Dynamics.NAV.InvokeExtensibilityMethod) {
                    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ControlReady', []);
                    console.log('Control Ready event sent');
                }
            } catch (e) {
                console.error('Error calling ControlReady:', e);
            }
        }, 100);
        
    } catch (e) {
        console.error('Error initializing Iteration Controls:', e);
    }
}

//classic button creation function
function createButton(btnDef) {
    var btn = document.createElement('button');
    btn.id = btnDef.id;
    btn.innerText = btnDef.text;
    btn.style.padding = '12px 16px';
    btn.style.fontSize = '14px';
    btn.style.fontWeight = 'bold';
    btn.style.border = 'none';
    btn.style.borderRadius = '6px';
    btn.style.cursor = 'pointer';
    btn.style.backgroundColor = btnDef.color;
    btn.style.color = btnDef.textColor || 'white';
    btn.style.transition = 'all 0.2s ease';
    btn.style.textTransform = 'uppercase';
    btn.style.letterSpacing = '0.5px';
    btn.style.boxShadow = '0 2px 4px rgba(0,0,0,0.1)';
    
    
    btn.onclick = function() {
        try {
            btn.style.transform = 'translateY(1px)';
            setTimeout(function() {
                btn.style.transform = 'translateY(0)';
            }, 100);
        
            updateStatus('Executing ' + btnDef.text + '...');

            if (typeof Microsoft !== 'undefined' && Microsoft.Dynamics && Microsoft.Dynamics.NAV && Microsoft.Dynamics.NAV.InvokeExtensibilityMethod) {
                Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ButtonClicked', [btnDef.id]);
                console.log('Button clicked:', btnDef.id);
            } else {
                console.error('BC API not available');
            }
        } catch (e) {
            console.error('Error handling button click:', e);
        }
    };
    
    return btn;
}

//make the buttons use ready
function updateStatus(message) {
    var statusDiv = document.getElementById('status');
    if (statusDiv) {
        statusDiv.innerText = message;
        statusDiv.style.color = '#495057';
    
        setTimeout(function() {
            statusDiv.innerText = 'Ready for next action';
            statusDiv.style.color = '#6c757d';
        }, 2000);
    }
}

function EnableButtons(enabledButtonsJson) {
    try {
        var enabledButtons = JSON.parse(enabledButtonsJson);
        
        Object.keys(buttons).forEach(function(buttonId) {
            var button = buttons[buttonId];
            var isEnabled = enabledButtons.indexOf(buttonId) !== -1;
            
            button.disabled = !isEnabled;
            button.style.opacity = isEnabled ? '1' : '0.5';
            button.style.cursor = isEnabled ? 'pointer' : 'not-allowed';
        });
        
        console.log('Buttons enabled:', enabledButtons);
    } catch (e) {
        console.error('Error enabling buttons:', e);
    }
}

//CSS animation
var style = document.createElement('style');
style.textContent = `
    @keyframes pulse {
        0% { box-shadow: 0 0 0 0 rgba(40, 167, 69, 0.7); }
        70% { box-shadow: 0 0 0 10px rgba(40, 167, 69, 0); }
        100% { box-shadow: 0 0 0 0 rgba(40, 167, 69, 0); }
    }
`;
document.head.appendChild(style);

document.addEventListener('DOMContentLoaded', initializeIterationControls);

if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initializeIterationControls);
} else {
    initializeIterationControls();
}