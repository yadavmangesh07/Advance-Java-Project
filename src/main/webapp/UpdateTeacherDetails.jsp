<%@ page import="java.sql.*, java.awt.*, javax.swing.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Teacher Details</title>
    <style >
    
    </style>
</head>
<body>
    <%
        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/universitymanagementsystem";
        String username = "root";
        String password = "root123";

        // Retrieve form parameters
        String empId = request.getParameter("empId");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        String branch = request.getParameter("branch");

        // Update teacher details in the database
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            String query = "update teachers set name=?, address=?, phone=?, email=?, course=?, branch=? where emp_id=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, address);
            pstmt.setString(3, phone);
            pstmt.setString(4, email);
            pstmt.setString(5, course);
            pstmt.setString(6, branch);
            pstmt.setString(7, empId);
            int updatedRows = pstmt.executeUpdate();
            
            if(updatedRows > 0) {
    %>
                <script>
                    alert("Teacher details updated successfully");
                    window.location.href = "Project.jsp";
                </script>
    <%
            } else {
                out.println("<p>Failed to update teacher details ad.</p>");
            }
        } catch (Exception e) {
            out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
            e.printStackTrace();
        }
    %>
</body>
</html>
