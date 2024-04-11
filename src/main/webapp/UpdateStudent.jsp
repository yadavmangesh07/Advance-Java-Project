<%@ page import="java.sql.*, javax.swing.*, java.awt.*, java.awt.event.*, javax.swing.JOptionPane" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student Details</title>
</head>
<body>
    <%
        // Check if the form is submitted to search for a student by Aadhar number
        String searchAadhar = request.getParameter("searchAadhar");
        if (searchAadhar != null) {
            try {
                String url = "jdbc:mysql://localhost:3306/universitymanagementsystem";
                String username = "root";
                String password = "root123";
                String searchQuery = "SELECT * FROM students WHERE aadhar=?";
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, username, password);
                PreparedStatement searchStmt = conn.prepareStatement(searchQuery);
                searchStmt.setString(1, searchAadhar);
                ResultSet searchResult = searchStmt.executeQuery();
                if (searchResult.next()) {
                    // Student found, populate form fields with existing details
                    
                    String name = searchResult.getString("name");
                    String fatherName = searchResult.getString("father_name");
                    String dob = searchResult.getString("dob");
                   
                    String address = searchResult.getString("address");
                    String phone = searchResult.getString("phone");
                    String email = searchResult.getString("email");
                    String course = searchResult.getString("course");
                    String branch = searchResult.getString("branch");
    %>
    
    <h2>Student Information</h2>
                    <p>Name: <%= name %></p>
                    <p>Father's Name: <%= fatherName %></p>
                    <p>Date of Birth: <%= dob %></p>
                    <h2>Update Student Details</h2>
                    <form action="UpdateStudentDetails.jsp" method="post">
                        
                        <label for="address">Address:</label>
                        <input type="text" id="address" name="address" value="<%= address %>" required><br><br>

                        <label for="phone">Phone:</label>
                        <input type="text" id="phone" name="phone" value="<%= phone %>" required><br><br>

                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="<%= email %>" required><br><br>

                        <label for="course">Course:</label>
                        <input type="text" id="course" name="course" value="<%= course %>" required><br><br>

                        <label for="branch">Branch:</label>
                        <input type="text" id="branch" name="branch" value="<%= branch %>" required><br><br>

                        <!-- Hidden field to store Aadhar number for updating -->
                        <input type="hidden" id="aadhar" name="aadhar" value="<%= searchAadhar %>">

                        <input type="submit" value="Update">
                    </form>
    <%
                } else {
                    // Student not found, display error message
                    out.println("<p>Student with Aadhar Number " + searchAadhar + " not found.</p>");
                }
                conn.close();
            } catch (Exception e) {
                out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
                e.printStackTrace();
            }
        }
    %>
    
    <h1>Update Student Details</h1>
    <form action="UpdateStudent.jsp" method="post">
        <label for="searchAadhar">Enter Aadhar Number to Search:</label>
        <input type="text" id="searchAadhar" name="searchAadhar" required>
        <input type="submit" value="Search">
    </form>
</body>
</html>
