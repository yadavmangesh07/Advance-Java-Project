<%@ page import="java.sql.*, javax.swing.*, java.awt.*, java.awt.event.*, javax.swing.JOptionPane" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Teacher Details</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    
</head>
<body>
    <%
        // Check if the form is submitted to search for a Teacher by Aadhar number
        String empId = request.getParameter("empId");
        if (empId != null) {
            try {
                String url = "jdbc:mysql://localhost:3306/universitymanagementsystem";
                String username = "root";
                String password = "root123";
                String searchQuery = "SELECT * FROM teachers WHERE emp_id=?";
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, username, password);
                PreparedStatement searchStmt = conn.prepareStatement(searchQuery);
                searchStmt.setString(1, empId);
                ResultSet searchResult = searchStmt.executeQuery();
                if (searchResult.next()) {
                    // Teacher found, populate form fields with existing details
                    
                    String name = searchResult.getString("name");
                    String empid = searchResult.getString("emp_id");
                    String fname = searchResult.getString("father_name");
                    String dob = searchResult.getString("dob");
                   
                    String address = searchResult.getString("address");
                    String phone = searchResult.getString("phone");
                    String email = searchResult.getString("email");
                    String course = searchResult.getString("course");
                    String branch = searchResult.getString("branch");
    %>
    
    <h2>Teacher Information</h2>
                    <p>Name: <%= name %></p>
                    <p>Father's Name: <%= fname %></p>
                    <p>Date of Birth: <%= dob %></p>
                    <h2>Update Teacher Details</h2>
                    <form action="UpdateTeacherDetails.jsp" method="post" >
                                        <label for="name">Name:</label>
                    <input type="text"  id="name" name="name"value="<%= name %>" required><br><br>
                    
                        
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

                        
						<input type="hidden" id="empId" name="empId" value="<%= empid %>">
                        <input type="submit" value="Update">
                    </form>
    <%
                } else {
                    // Teacher not found, display error message
                    out.println("<p>Teacher with EmpID " + empId + " not found.</p>");
                }
                conn.close();
            } catch (Exception e) {
                out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
                e.printStackTrace();
            }
        }
    %>
    
    <h1>Update Teacher Details</h1>
    <form action="UpdateTeacher.jsp" method="post">
        <label for="searchAadhar">Enter Employee Id to Search:</label>
        <input type="text" id="empId" name="empId" required>
        <input type="submit" value="Search">
    </form>
</body>
</html>
