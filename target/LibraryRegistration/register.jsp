<!DOCTYPE html>
<html>
<head>
    <title>Ticket Booking</title>
</head>
<body>
    <h2>Book Your Ticket Here</h2>
    <form action="register.jsp" method="post">
    	          
        <label>Name:</label>
        <input type="text" name="name" required><br><br> 
         
        <label>Email:</label>
        <input type="email" name="email" required><br><br>    

        <label>Password:</label>
        <input type="password" name="password" required><br><br>

        <label>Source</label>
        <input type="text" name="Source"><br><br>
        
        <label>Destination</label>
        <input type="text" name="Destination"><br><br>
        
        <label>Train Number</label>
        <input type="text" name="Train Number"><br><br>

        <input type="submit" value="Book Now">
    </form>

    <%-- Simple JSP to display submitted values --%>
    <%
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String Source = request.getParameter("Source");
        String Destination= request.getParameter("Destination");
        String TrainNumber = request.getParameter("Train Number");
        if (name != null && email != null) {
    %>
        <h3>Booking Successful!</h3>
        <p><b>Name:</b> <%= name %></p>
        <p><b>Source</b> <%= Source %></p>
        <p><b>Destination</b> <%= Destination %></p>
        <p><b>Train Number</b> <%= TrainNumber %></p>
    <%
        }
    %>
</body>
</html>
