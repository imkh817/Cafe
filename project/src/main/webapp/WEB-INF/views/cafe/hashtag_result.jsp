<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- ... (your existing header content) ... -->
</head>
<body>
    <%-- Your existing HTML content --%>

    <%-- Check for form submission and retrieve form data --%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%
        if (request.getMethod().equalsIgnoreCase("post")) {
            String totalValue = request.getParameter("totalValue");
            String starRating = request.getParameter("starRating");
            String reviewCity = request.getParameter("reviewCity");

            // You can further process or display this data as needed
    %>

    <h2>Received Form Data</h2>
    <p>Total Value: <%= totalValue %></p>
    <p>Star Rating: <%= starRating %></p>
    <p>Review City: <%= reviewCity %></p>

    <%-- ... (Rest of your HTML) ... --%>

    <% } %>

    <!-- Other scripts and contents -->
</body>
</html>
