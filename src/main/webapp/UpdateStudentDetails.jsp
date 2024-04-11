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
        String aadhar = request.getParameter("aadhar");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        String branch = request.getParameter("branch");
        
        try {
            String url = "jdbc:mysql://localhost:3306/universitymanagementsystem";
            String username = "root";
            String password = "root123";
            String updateQuery = "UPDATE students SET address=?, phone=?, email=?, course=?, branch=? WHERE aadhar=?";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
            updateStmt.setString(1, address);
            updateStmt.setString(2, phone);
            updateStmt.setString(3, email);
            updateStmt.setString(4, course);
            updateStmt.setString(5, branch);
            updateStmt.setString(6, aadhar);
            int rowsAffected = updateStmt.executeUpdate();
            if (rowsAffected > 0) {
    %>
                <script>
                    alert("Student details updated successfully.");
                    window.location.href = "Project.jsp"; // Redirect to a different page after successful update
                </script>
    <%
            } else {
    %>
                <script>
                    alert("Failed to update student details. Please try again.");
                    window.history.back(); // Go back to the previous page
                </script>
    <%
            }
            conn.close();
        } catch (Exception e) {
            out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
            e.printStackTrace();
        }
    %>
</body>
</html>
