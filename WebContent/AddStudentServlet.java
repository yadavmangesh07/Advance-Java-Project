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

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String fatherName = request.getParameter("fname");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        float classX = Float.parseFloat(request.getParameter("x"));
        float classXII = Float.parseFloat(request.getParameter("xii"));
        String aadhar = request.getParameter("aadhar");
        String course = request.getParameter("course");
        String branch = request.getParameter("branch");

        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/universitymanagementsystem";
        String dbUser = "root";
        String dbPassword = "root123";

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Prepare SQL query
            String sql = "INSERT INTO students (name, father_name, dob, address, phone, email, class_x, class_xii, aadhar, course, branch) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);

            // Set parameters for the SQL query
            statement.setString(1, name);
            statement.setString(2, fatherName);
            statement.setString(3, dob);
            statement.setString(4, address);
            statement.setString(5, phone);
            statement.setString(6, email);
            statement.setFloat(7, classX);
            statement.setFloat(8, classXII);
            statement.setString(9, aadhar);
            statement.setString(10, course);
            statement.setString(11, branch);

            // Execute the SQL statement
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                // Redirect to success page if insertion is successful
                response.sendRedirect("success.jsp");
            } else {
                // Redirect to error page if insertion failed
                response.sendRedirect("error.jsp");
            }

            // Close the database connection
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Redirect to error page if any exception occurs
            response.sendRedirect("error.jsp");
        }
    }
}
