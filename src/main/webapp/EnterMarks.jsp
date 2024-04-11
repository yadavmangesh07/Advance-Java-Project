<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Enter Marks</title>
    <style>
        /* Add your CSS styles here */
    </style>
</head>
<body>
    <div style="text-align: center;">
        <h1>Enter Marks of Student</h1>
        <form action="EnterMarksServlet" method="post">
            <label for="rollno">Select Roll Number:</label>
            <select id="rollno" name="rollno">
                <% try {
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "username", "password");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("select * from student");
                    while(rs.next()) { %>
                        <option value="<%= rs.getString("rollno") %>"><%= rs.getString("rollno") %></option>
                    <% }
                    con.close();
                } catch(Exception e) {
                    e.printStackTrace();
                } %>
            </select><br><br>
            
            <label for="semester">Select Semester:</label>
            <select id="semester" name="semester">
                <option value="1st Semester">1st Semester</option>
                <option value="2nd Semester">2nd Semester</option>
                <option value="3rd Semester">3rd Semester</option>
                <option value="4th Semester">4th Semester</option>
                <option value="5th Semester">5th Semester</option>
                <option value="6th Semester">6th Semester</option>
                <option value="7th Semester">7th Semester</option>
                <option value="8th Semester">8th Semester</option>
            </select><br><br>
            
            <label for="sub1">Enter Subject:</label>
            <input type="text" id="sub1" name="sub1"><br><br>
            <label for="marks1">Enter Marks:</label>
            <input type="text" id="marks1" name="marks1"><br><br>
            
            <!-- Repeat for other subjects and marks fields -->
            
            <input type="submit" value="Submit">
            <input type="button" value="Back" onclick="window.location.href='index.jsp'">
        </form>
    </div>
</body>
</html>
