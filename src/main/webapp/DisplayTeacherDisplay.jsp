<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Teacher</title>
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
    <div class="container h-100">
        <div class="row justify-content-center mt-5 h-100">
            <div class="col-sm-10 col-md-8 col-lg-6">
                <h1 class="text-center mb-4 text-white">Search Teacher Details</h1>
                <form action="" method="get" class="mb-4">
                    <div class="form-group">
                        <label for="empId" class="text-white">Enter Employee ID:</label>
                        <input type="text" class="form-control" id="empId" name="empId">
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Search</button>
                        <button type="button" class="btn btn-secondary">Cancel</button>
                    </div>
                </form>
                <% 
                    // Database connection parameters
                    String url = "jdbc:mysql://localhost:3306/universitymanagementsystem";
                    String username = "root";
                    String password = "root123";

                    // Retrieve form parameter for employee ID
                    String empId = request.getParameter("empId");

                    // Database connection and search logic
                    if (empId != null && !empId.isEmpty()) {
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(url, username, password);
                            String query = "SELECT * FROM teachers WHERE emp_id=?";
                            PreparedStatement pstmt = conn.prepareStatement(query);
                            pstmt.setString(1, empId);
                            ResultSet rs = pstmt.executeQuery();

                            // Display teacher details if found
                            if (rs.next()) {
                %>
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Teacher Details</h5>
                                        <p class="card-text">Name: <%= rs.getString("name") %></p>
                                        <p class="card-text">Father's Name: <%= rs.getString("father_name") %></p>
                                        <p class="card-text">Date of Birth: <%= rs.getString("dob") %></p>
                                        <p class="card-text">Address: <%= rs.getString("address") %></p>
                                        <p class="card-text">Phone: <%= rs.getString("phone") %></p>
                                        <p class="card-text">Email: <%= rs.getString("email") %></p>
                                        <p class="card-text">Qualification: <%= rs.getString("course") %></p>
                                        <p class="card-text">Department: <%= rs.getString("branch") %></p>
                                    </div>
                                </div>
                <%          
                            } else {
                %>
                                <div class="alert alert-warning" role="alert">
                                    Teacher with Employee ID <%= empId %> not found.
                                </div>
                <%              
                            }
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
