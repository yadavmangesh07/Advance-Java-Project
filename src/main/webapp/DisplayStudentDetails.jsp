<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Student Details</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Add your CSS styles here */
        html, body {
    height: 100%; /* Set the height of html and body to 100% to cover the viewport */
    margin: 0; /* Remove default margin */
    padding: 0; /* Remove default padding */
}

body {
    background-image: url('Assets/nietlogo.jpg');
    background-size: cover; /* Cover the entire background */
    background-position: center; /* Center the background */
    background-repeat: no-repeat; /* Prevent background from repeating */
}
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Search Student Details</h1>
        <form class="form-inline mb-4" action="" method="get">
            <div class="form-group">
                <label for="studentId">Enter Student ID:</label>
                <input type="text" class="form-control ml-2" id="id" name="id" required>
            </div>
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
        <table class="table border rounded">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Father's Name</th>
                    <th>Date of Birth</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Aadhar Number</th>
                    <th>Course Name</th>
                    <th>Branch Name</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String studentId = request.getParameter("id");
                    if(studentId != null && !studentId.isEmpty()) {
                        try {
                            // Database connection parameters
                            String url = "jdbc:mysql://localhost:3306/universitymanagementsystem";
                            String username = "root";
                            String password = "root123";

                            // Establish database connection
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(url, username, password);

                            // Prepare SQL query
                            String query = "SELECT * FROM students WHERE id=?";
                            PreparedStatement pstmt = conn.prepareStatement(query);
                            pstmt.setString(1, studentId);

                            // Execute query and retrieve result set
                            ResultSet rs = pstmt.executeQuery();

                            // Iterate through result set and display student details
                            if(rs.next()) {
                                String name = rs.getString("name");
                                String fatherName = rs.getString("father_name");
                                String dob = rs.getString("dob");
                                String address = rs.getString("address");
                                String phone = rs.getString("phone");
                                String email = rs.getString("email");
                                
                                String aadhar = rs.getString("aadhar");
                                String course = rs.getString("course");
                                String branch = rs.getString("branch");
                                

                %>
                                <tr>
                                    <td><%= name %></td>
                                    <td><%= fatherName %></td>
                                    <td><%= dob %></td>
                                    <td><%= address %></td>
                                    <td><%= phone %></td>
                                    <td><%= email %></td>
                                    <td><%= aadhar %></td>
                                    <td><%= course %></td>
                                    <td><%= branch %></td>
                                </tr>
                <%
                            } else {
                %>
                                <tr>
                                    <td colspan="6">No student found for ID <%= studentId %></td>
                                </tr>
                <%
                            }
                            // Close resources
                            rs.close();
                            pstmt.close();
                            conn.close();
                        } catch (Exception e) {
                            out.println("<p>Error: " + e.getMessage() + "</p>");
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
