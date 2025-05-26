<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dynamic Color Percentage</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Custom styles for the color box and overall layout */
        body {
            font-family: 'Inter', sans-serif; /* Using Inter font as per instructions */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh; /* Full viewport height */
            background-color: #f0f4f8; /* Light background */
            color: #334155; /* Darker text for contrast */
            padding: 1rem;
        }

        .container {
            background-color: #ffffff;
            border-radius: 1rem; /* Rounded corners */
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05); /* Subtle shadow */
            padding: 2rem;
            width: 100%;
            max-width: 400px; /* Max width for better readability on large screens */
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #colorBox {
            width: 120px;
            height: 120px;
            border: 2px solid #cbd5e1; /* Light border */
            border-radius: 0.75rem; /* Rounded corners */
            margin-bottom: 1.5rem;
            transition: background-color 0.3s ease-in-out; /* Smooth color transition */
        }

        .input-group {
            display: flex;
            flex-direction: column;
            width: 100%;
            margin-bottom: 1rem;
        }

        .input-group label {
            margin-bottom: 0.5rem;
            font-weight: 600; /* Semi-bold label */
            color: #475569;
        }

        .input-group input[type="number"] {
            padding: 0.75rem;
            border: 1px solid #cbd5e1;
            border-radius: 0.5rem; /* Rounded input fields */
            font-size: 1rem;
            outline: none; /* Remove default outline */
            transition: border-color 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }

        .input-group input[type="number"]:focus {
            border-color: #6366f1; /* Accent color on focus */
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2); /* Light shadow on focus */
        }

        #percentageDisplay {
            font-size: 1.25rem; /* Larger font for percentage */
            font-weight: 700; /* Bold percentage */
            color: #1e293b;
            margin-top: 1.5rem;
        }

        /* Responsive adjustments */
        @media (max-width: 600px) {
            .container {
                padding: 1.5rem;
            }
            #colorBox {
                width: 100px;
                height: 100px;
            }
            .input-group input[type="number"] {
                font-size: 0.9rem;
            }
            #percentageDisplay {
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h1 class="text-2xl font-bold mb-6 text-center">Color Percentage Converter</h1>

        <div id="colorBox" class="bg-white"></div>

        <div class="input-group">
            <label for="rangeInput">Range:</label>
            <input type="number" id="rangeInput" value="100" min="0">
        </div>

        <div class="input-group">
            <label for="valueInput">Value:</label>
            <input type="number" id="valueInput" value="50" min="0">
        </div>

        <p id="percentageDisplay" class="text-lg font-semibold"></p>
    </div>

    <script>
        function getColorFromPercentage(range, actualValue) {
            if (range === 0) {
                console.warn("Range cannot be zero. Returning a default white color.");
                return "rgb(255, 255, 255)";
            }
            let percentage = (actualValue / range) * 100;
            percentage = Math.max(0, Math.min(100, percentage));
            const hue = percentage * 1.2;
            const saturation = 100;
            const lightness = 50;
            return `hsl(${hue}, ${saturation}%, ${lightness}%)`;
        }

        
        const colorBox = document.getElementById('colorBox');
        const rangeInput = document.getElementById('rangeInput');
        const valueInput = document.getElementById('valueInput');
        const percentageDisplay = document.getElementById('percentageDisplay');
        function updateColor() {
            const range = parseFloat(rangeInput.value);
            const actualValue = parseFloat(valueInput.value);
            if (isNaN(range) || isNaN(actualValue)) {
                colorBox.style.backgroundColor = "#e2e8f0";
                percentageDisplay.textContent = "Please enter valid numbers.";
                return;
            }
            const color = getColorFromPercentage(range, actualValue);
            colorBox.style.backgroundColor = color;
            let percentage;
            if (range === 0) {
                percentage = 0;
                percentageDisplay.textContent = "Percentage: N/A (Range is 0)";
            } else {
                percentage = (actualValue / range) * 100;
                percentage = Math.max(0, Math.min(100, percentage));
                percentageDisplay.textContent = `Percentage: ${percentage.toFixed(2)}%`;
            }
        }
        rangeInput.addEventListener('input', updateColor);
        valueInput.addEventListener('input', updateColor);
        window.onload = updateColor;
    </script>
</body>
</html>
