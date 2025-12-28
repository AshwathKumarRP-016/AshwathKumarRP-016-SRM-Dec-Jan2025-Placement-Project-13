<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP Addition Program</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .result {
            margin-top: 30px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 4px;
            border-left: 4px solid #4CAF50;
        }
        .result h3 {
            margin-top: 0;
            color: #333;
        }
        .calculation {
            font-size: 18px;
            color: #333;
            font-weight: bold;
        }
        .error {
            color: #f44336;
            margin-top: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Addition Program</h1>
        
        <form method="post">
            <div class="form-group">
                <label for="number1">Enter First Number:</label>
                <input type="number" id="number1" name="number1" step="any" required>
            </div>
            
            <div class="form-group">
                <label for="number2">Enter Second Number:</label>
                <input type="number" id="number2" name="number2" step="any" required>
            </div>
            
            <button type="submit" class="btn">Calculate Sum</button>
        </form>
        
        <%
            // Java Scriptlet to calculate the sum
            String num1Str = request.getParameter("number1");
            String num2Str = request.getParameter("number2");
            int num1 = 0, num2 = 0;
            boolean hasResult = false;
            String errorMessage = null;
            
            // Check if parameters exist (form has been submitted)
            if (num1Str != null && num2Str != null && !num1Str.isEmpty() && !num2Str.isEmpty()) {
                try {
                    // Convert parameters to integers
                    num1 = Integer.parseInt(num1Str);
                    num2 = Integer.parseInt(num2Str);
                    hasResult = true;
                } catch (NumberFormatException e) {
                    errorMessage = "Please enter valid integers only.";
                }
            }
        %>
        
        <% if (hasResult) { %>
            <div class="result">
                <h3>Calculation Result:</h3>
                <p class="calculation">
                    <%= num1 %> + <%= num2 %> = <strong><%= num1 + num2 %></strong>
                </p>
                <p>Sum of <%= num1 %> and <%= num2 %> is: <strong><%= num1 + num2 %></strong></p>
            </div>
        <% } else if (errorMessage != null) { %>
            <div class="result">
                <h3>Error:</h3>
                <p class="error"><%= errorMessage %></p>
                <p>Please try again with valid integers.</p>
            </div>
        <% } else if (num1Str != null || num2Str != null) { %>
            <div class="result">
                <h3>Notice:</h3>
                <p>Please enter both numbers to calculate the sum.</p>
            </div>
        <% } %>
        
        <div style="margin-top: 30px; padding: 15px; background-color: #f0f8ff; border-radius: 4px; font-size: 14px;">
            <h4>How it works:</h4>
            <ol>
                <li>Enter two numbers in the form above</li>
                <li>Click "Calculate Sum" button</li>
                
            </ol>
            
        </div>
    </div>
</body>
</html>