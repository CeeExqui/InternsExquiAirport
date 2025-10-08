function initializeControlAddIn() {
    try {
        console.log('Starting Control Add-in initialization...');
        
        // Clear any existing content
        document.body.innerHTML = '';
        
        var container = document.createElement('div');
        container.style.padding = '10px';
        container.style.backgroundColor = '#f8f9fa';
        container.style.border = '1px solid #dee2e6';
        container.style.borderRadius = '8px';
        container.style.fontFamily = 'Segoe UI, Tahoma, Geneva, Verdana, sans-serif';
        container.style.height = '100%';
        container.style.boxSizing = 'border-box';
        container.style.textAlign = 'center';

        // Button
        var btn = document.createElement('button');
        btn.innerText = 'Open Customer Ledger Entries';
        btn.style.padding = '12px 24px';
        btn.style.fontSize = '16px';
        btn.style.cursor = 'pointer';
        btn.style.backgroundColor = '#0078d4';
        btn.style.color = 'white';
        btn.style.border = 'none';
        btn.style.borderRadius = '4px';
        btn.style.fontWeight = '600';
        btn.style.transition = 'background-color 0.3s ease';
        
        // Add hover effect
        btn.onmouseenter = function() {
            btn.style.backgroundColor = '#106ebe';
        };
        btn.onmouseleave = function() {
            btn.style.backgroundColor = '#0078d4';
        };
        
        btn.onclick = function() {
            try {
                if (typeof Microsoft !== 'undefined' && Microsoft.Dynamics && Microsoft.Dynamics.NAV && Microsoft.Dynamics.NAV.InvokeExtensibilityMethod) {
                    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Notify', ['openPage']);
                } else if (window.external && window.external.notify) {
                    window.external.notify('openPage');
                } else {
                    console.error('No BC API available');
                }
            } catch (e) {
                console.error('Error invoking Notify method:', e);
                alert('Error: ' + e);
            }
        };

        // Add button to container
        container.appendChild(btn);
        
        // Add container to page
        document.body.appendChild(container);
        
        // Tell BC we're ready
        setTimeout(function() {
            try {
                if (typeof Microsoft !== 'undefined' && Microsoft.Dynamics && Microsoft.Dynamics.NAV && Microsoft.Dynamics.NAV.InvokeExtensibilityMethod) {
                    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ControlReady', []);
                    console.log('ControlReady called');
                }
            } catch (e) {
                console.error('Error calling ControlReady:', e);
            }
        }, 100);
        
    } catch (e) {
        console.error('error initializing Control Add-In:', e);
        document.body.innerHTML = '<div style="color: red; padding: 20px;">Error: ' + e.message + '</div>';
    }
}

// Initialize when page loads
document.addEventListener('DOMContentLoaded', initializeControlAddIn);