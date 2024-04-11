import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("unused")
@WebServlet("/AddTeacherServlet")
public class AddTeacherServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Database connection variables
        Connection conn = null;
        PreparedStatement pstmt = null;

        // Database credentials
        String dbUrl = "jdbc:mysql://localhost:3306/universitymanagementsystem";
        String dbUser = "root";
        String dbPassword = "root123";

        // Form parameters
        String name = request.getParameter("name");
        String fname = request.getParameter("fname");
        String empId = request.getParameter("empId");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String x = request.getParameter("x");
        String xii = request.getParameter("xii");
        String aadhar = request.getParameter("aadhar");
        String course = request.getParameter("course");
        String branch = request.getParameter("branch");

        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // Create SQL query to insert data
            String query = "INSERT INTO teachers (name, father_name, emp_id, dob, address, phone, email, x_percentage, xii_percentage, aadhar, course, branch) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, fname);
            pstmt.setString(3, empId);
            pstmt.setString(4, dob);
            pstmt.setString(5, address);
            pstmt.setString(6, phone);
            pstmt.setString(7, email);
            pstmt.setString(8, x);
            pstmt.setString(9, xii);
            pstmt.setString(10, aadhar);
            pstmt.setString(11, course);
            pstmt.setString(12, branch);

            // Execute the query
            pstmt.executeUpdate();

            // Redirect to a success page after adding data
            response.sendRedirect("success.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to an error page if an exception occurs
            response.sendRedirect("error.jsp");
        } finally {
            // Close resources
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to an error page if GET method is not supported
        response.sendRedirect("error.jsp");
    }
}
