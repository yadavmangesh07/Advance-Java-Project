import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FacultyLeaveServlet")
public class FacultyLeaveServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/universitymanagementsystem";
    private static final String JDBC_USER = "root"; // Replace with your actual username
    private static final String JDBC_PASSWORD = "root123"; // Replace with your actual password

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String facultyName = request.getParameter("facultyName");
        String facultyId = request.getParameter("facultyId");
        String startDate = request.getParameter("startDate");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Open a connection
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // SQL statement to insert data
            String sql = "INSERT INTO leave_applications (faculty_name, faculty_id, start_date) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            // Set values for the parameters
            pstmt.setString(1, facultyName);
            pstmt.setString(2, facultyId);
            pstmt.setString(3, startDate);

            // Execute the update and get number of rows affected
            int rowsAffected = pstmt.executeUpdate();

            // Redirect based on success or failure
            if (rowsAffected > 0) {
                response.sendRedirect("success.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to error page on exception
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    // Handle GET requests by redirecting to error page (optional)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("error.jsp");
    }
}
