<!DOCTYPE html>
<html>
<head>
    <title>Doctor Appointment</title>
</head>
<body>
    <h2>Book a Doctor Appointment</h2>
    <form action="register.jsp" method="post">
        
        <label>Patient Name:</label>
        <input type="text" name="patientName" required><br><br>

        <label>Email:</label>
        <input type="email" name="email" required><br><br>

        <label>Phone Number:</label>
        <input type="text" name="phone" required><br><br>

        <label>Select Department:</label>
        <select name="department" required>
            <option value="">--Select--</option>
            <option value="Cardiology">Cardiology</option>
            <option value="Neurology">Neurology</option>
            <option value="Orthopedics">Orthopedics</option>
            <option value="Pediatrics">Pediatrics</option>
            <option value="General Medicine">General Medicine</option>
        </select><br><br>

        <label>Preferred Doctor:</label>
        <input type="text" name="doctorName"><br><br>

        <label>Appointment Date:</label>
        <input type="date" name="appointmentDate" required><br><br>

        <label>Appointment Time:</label>
        <input type="time" name="appointmentTime" required><br><br>

        <input type="submit" value="Book Appointment">
    </form>

    <%-- JSP code to display the submitted appointment details --%>
    <%
        String patientName = request.getParameter("patientName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String department = request.getParameter("department");
        String doctorName = request.getParameter("doctorName");
        String appointmentDate = request.getParameter("appointmentDate");
        String appointmentTime = request.getParameter("appointmentTime");

        if (patientName != null && appointmentDate != null) {
    %>
        <h3>Appointment Booked Successfully!</h3>
        <p><b>Patient Name:</b> <%= patientName %></p>
        <p><b>Email:</b> <%= email %></p>
        <p><b>Phone:</b> <%= phone %></p>
        <p><b>Department:</b> <%= department %></p>
        <p><b>Doctor:</b> <%= doctorName %></p>
        <p><b>Date:</b> <%= appointmentDate %></p>
        <p><b>Time:</b> <%= appointmentTime %></p>
    <%
        }
    %>
</body>
</html>
