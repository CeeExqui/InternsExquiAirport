(function () {
    const container = document.getElementById('controlAddIn');

    container.insertAdjacentHTML('beforeend',`
        <div class="container">
            <h1>Loan Calculator</h1>
            <p>Loan Amount $
                <input onchange="calculateLoan()" class="input" type="number" id="loan-amount" min="1" max="500000" value="10000">
            </p>
            <p>Interest Rate %
                <input onchange="calculateLoan()" class="input" type="number" id="interest-rate" min="0" max="100" value="10" step=".1">
            </p>
            <p>Months to pay
                <input onchange="calculateLoan()" class="input" type="number" id="months-to-pay" min="6" max="48" value="12">
            </p>
            <p class="payment" id="payment">Monthly Payment:</p>
                        <button id="sendInfo">Send Info</button>
        </div>
    `);
})();

const sendBtn = document.getElementById('sendInfo');
    sendBtn.addEventListener('click', function () {
        const loan = document.getElementById('loan-amount').value;
        const rate = document.getElementById('interest-rate').value;
        const months = document.getElementById('months-to-pay').value;

        const summary = `Loan Amount: $${loan}, Rate: ${rate}%, Months: ${months}`;
        
        // This will trigger the AL side (in your controladdin object)
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ShowLoanSummary', [summary]);
        });

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ControlReady", []);
