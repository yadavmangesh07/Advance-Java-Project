<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Details</title>
</head>
<body>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/universitymanagementsystem", "root", "root123");
        stmt = conn.createStatement();
        
        // Fetching data for choice dropdown
        rs = stmt.executeQuery("SELECT r FROM student");
        while(rs.next()) {
            out.println("<option value='" + rs.getString("rollno") + "'>" + rs.getString("rollno") + "</option>");
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<form method="post" action="studentDetails.jsp">
    <label>Search by Roll Number:</label>
    <select name="rollno">
        <%-- Populate options dynamically from the database --%>
    </select>
    <input type="submit" name="search" value="Search">
</form>

<%
    if (request.getParameter("search") != null) {
        String rollno = request.getParameter("rollno");
        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/universitymanagementsystem", "root", "root123");
            stmt = conn.createStatement();
            
            // Fetch student details based on roll number
            rs = stmt.executeQuery("SELECT * FROM students WHERE rollno='" + rollno + "'");
%>
            <table border="1">
    <thead>
        <tr>
            <th>Roll No</th>
            <th>Name</th>
            <th>Father's Name</th>
            <th>Date of Birth</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Class X (%)</th>
            <th>Class XII (%)</th>
            <th>Aadhar Number</th>
            <th>Course</th>
            <th>Branch</th>
            
        </tr>
    </thead>
    <tbody>
<%
// Iterate through the ResultSet and display each row in the table
while(rs.next()) {
%>
    <tr>
        <td><%= rs.getString("rollno") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("father_name") %></td>
        <td><%= rs.getDate("dob") %></td>
        <td><%= rs.getString("address") %></td>
        <td><%= rs.getString("phone") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getFloat("class_x") %></td>
        <td><%= rs.getFloat("class_xii") %></td>
        <td><%= rs.getString("aadhar") %></td>
        <td><%= rs.getString("course") %></td>
        <td><%= rs.getString("branch") %></td>
        <!-- Add other columns accordingly -->
    </tr>
<%
}
%>
    </tbody>
</table>
<%
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

</body>
</html>
