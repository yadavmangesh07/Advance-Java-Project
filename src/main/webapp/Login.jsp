<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<html>

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        /* Add your custom CSS styles here */
        body {
            background-image: url('Assets/nietlogo.jpg');
            background-size: cover;
            background-position: center;


        }

        .center {
            display: flex;
            justify-content: center;
            margin-top: 10rem;
            /* height: 100vh; */
        }
    </style>
</head>

<body>
    <div class="container-sm  " >

        <div class="login-box  " style="margin-top: 10rem;">
            <%
                // Database connection variables
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                // Database credentials
                String dbUrl = "jdbc:mysql://localhost:3306/universitymanagementsystem";
                String dbUser = "root";
                String dbPassword = "root123";

                // Form submission handling
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                if (username != null && password != null) {
                    try {
                        // Establish database connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                        // Create SQL query
                        String query = "select * from login where username=? and password=?";
                        pstmt = conn.prepareStatement(query);
                        pstmt.setString(1, username);
                        pstmt.setString(2, password);

                        // Execute query
                        rs = pstmt.executeQuery();

                        // Check if user exists
                        if (rs.next()) {
                            // Redirect to another page after successful login
                            response.sendRedirect("Project.jsp");
                        } else {
            %>
             <script>
                                    alert("Invalid username or password");
                                </script> 
             <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Close resources
                        if (rs != null) {
                            try {
                                rs.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
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
            %> 

            <div class="col-md-4 border  rounded bg-white p-4 m-auto ">
                <h1 class="text-center ">Welcome to NIET Cloud</h1>
                <form action="" method="post" class="">
                    <div class="mb-3">
                        <label for="username" class="form-label ">Username:</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label ">Password:</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary">Login</button>
                        <button type="button" class="btn btn-secondary"
                            onclick="window.location.href='index.jsp'">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>

</html>