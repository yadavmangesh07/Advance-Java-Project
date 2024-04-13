<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Add your CSS styles here */
        h1 {
            color: #007bff;
        }
    </style>
    <script>
    function validateForm() {
        var name = document.getElementById('name').value;
        var fname = document.getElementById('fname').value;
        var dob = document.getElementById('dob').value;
        var address = document.getElementById('address').value;
        var phone = document.getElementById('phone').value;
        var email = document.getElementById('email').value;
        var x = document.getElementById('x').value;
        var xii = document.getElementById('xii').value;
        var aadhar = document.getElementById('aadhar').value;

        // Simple validation - check if fields are empty
        if (name == "" || fname == "" || dob == "" || address == "" || phone == "" || email == "" || x == "" || xii == "" || aadhar == "") {
            alert("All fields are required");
            return false;
        }

        // Additional validation logic can be added here

        return true; // return true if validation passes, false otherwise
    }
</script>

</head>
<body>
    <div class="container" style="width: 50%; max-width: none; height: 50vh;">
    <h1 class="text-center mb-4">New Student Details</h1>
    <form action="AddStudentServlet" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="fname">Father's Name:</label>
            <input type="text" class="form-control" id="fname" name="fname" required>
        </div>
        <div class="form-group">
            <label for="dob">Date of Birth:</label>
            <input type="date" class="form-control" id="dob" name="dob" required>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" class="form-control" id="address" name="address" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone:</label>
            <input type="text" class="form-control" id="phone" name="phone" required>
        </div>
        <div class="form-group">
            <label for="email">Email Id:</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="x">Class X (%):</label>
            <input type="text" class="form-control" id="x" name="x" required>
        </div>
        <div class="form-group">
            <label for="xii">Class XII (%):</label>
            <input type="text" class="form-control" id="xii" name="xii" required>
        </div>
        <div class="form-group">
            <label for="aadhar">Aadhar Number:</label>
            <input type="text" class="form-control" id="aadhar" name="aadhar" required>
        </div>
        <div class="form-group">
            <label for="course">Course:</label>
            <select class="form-control" id="course" name="course">
                <option value="B.Tech">B.Tech</option>
                <option value="BBA">BBA</option>
                <option value="BCA">BCA</option>
                <option value="Bsc">Bsc</option>
                <option value="Msc">Msc</option>
                <option value="MBA">MBA</option>
                <option value="MCA">MCA</option>
                <option value="MCom">MCom</option>
                <option value="MA">MA</option>
                <option value="BA">BA</option>
            </select>
        </div>
        <div class="form-group">
            <label for="branch">Branch:</label>
            <select class="form-control" id="branch" name="branch">
                <option value="Computer Science">Computer Science</option>
                <option value="Electronics">Electronics</option>
                <option value="Mechanical">Mechanical</option>
                <option value="Civil">Civil</option>
                <option value="IT">IT</option>
            </select>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary mr-2">Submit</button>
            <button type="button" class="btn btn-secondary" onclick="window.location.href='index.jsp'">Cancel</button>
        </div>
    </form>
</div>

</body>
</html>

