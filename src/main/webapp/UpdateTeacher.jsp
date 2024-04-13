<%@ page import="java.sql.*, javax.swing.*, java.awt.*, java.awt.event.*, javax.swing.JOptionPane" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Teacher Details</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 50px;
            
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
            padding: 40px;
            margin-bottom: 50px;
        }

        h2 {
            color: #007bff;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            margin-top:10px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
    
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
    
    <div class="container">
    <div class="row">
        <div class="col-md-6">
            <h2>Teacher Information</h2>
            <p>Name: <%= name %></p>
            <p>Father's Name: <%= fname %></p>
            <p>Date of Birth: <%= dob %></p>
        </div>
        <div class="col-md-6">
            <h2>Update Teacher Details</h2>
            <form action="UpdateTeacherDetails.jsp" method="post">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%= name %>" required>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" class="form-control" id="address" name="address" value="<%= address %>" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="<%= phone %>" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
                </div>
                <div class="form-group">
                    <label for="course">Course:</label>
                    <input type="text" class="form-control" id="course" name="course" value="<%= course %>" required>
                </div>
                <div class="form-group">
                    <label for="branch">Branch:</label>
                    <input type="text" class="form-control" id="branch" name="branch" value="<%= branch %>" required>
                </div>
                <input type="hidden" id="empId" name="empId" value="<%= empid %>">
                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
    </div>

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
    <div class="row">
    <div class="col-sm-6">
        <div class="form-group">
            <label for="searchAadhar">Enter Employee Id to Search:</label>
            <input type="text" class="form-control  " id="empId" name="empId" required>
        </div>
        </div>
        </div>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>
</div>

</body>
</html>
