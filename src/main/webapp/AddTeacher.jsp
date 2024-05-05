<%@ page import="java.util.Random" %>

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
        if (name.trim() === "") {
            alert("Please enter name");
            return false;
        }
        if (fname.trim() === "") {
            alert("Please enter father's name");
            return false;
        }
        if (dob.trim() === "") {
            alert("Please select date of birth");
            return false;
        }
        if (address.trim() === "") {
            alert("Please enter address");
            return false;
        }
        if (phone.trim() === "") {
            alert("Please enter phone number");
            return false;
        }
        if (email.trim() === "") {
            alert("Please enter email address");
            return false;
        }
        if (x.trim() === "") {
            alert("Please enter Class X percentage");
            return false;
        }
        if (xii.trim() === "") {
            alert("Please enter Class XII percentage");
            return false;
        }
        if (aadhar.trim() === "") {
            alert("Please enter Aadhar number");
            return false;
        }

        // Additional validation logic
        // You can add more validations here, such as checking email format, phone number format, etc.
        
        // Example: Email format validation
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            alert("Please enter a valid email address");
            return false;
        }

        return true; // return true if validation passes, false otherwise
    }
</script>

</head>
<body>
     <div class="container h-100">
    <div class="row justify-content-center align-items-center h-100">
        <div class="col-sm-10 col-md-8 col-lg-6">
            <h1 class="text-center mb-4">New Teacher Details</h1>
            <form action="AddTeacherServlet" method="post" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="fname">Father's Name:</label>
                    <input type="text" class="form-control" id="fname" name="fname" required>
                </div>
                <div class="form-group">
                    <label for="empId">Employee Id:</label>
                    <input type="text" class="form-control" id="empId" name="empId" value="101<%=Math.abs(new Random().nextLong() % 9000L) + 1000L %>" readonly>
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
                <div class="form-row">
                    <div class="col">
                        <label for="x">Class X (%):</label>
                        <input type="text" class="form-control" id="x" name="x" required>
                    </div>
                    <div class="col">
                        <label for="xii">Class XII (%):</label>
                        <input type="text" class="form-control" id="xii" name="xii" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="aadhar">Aadhar Number:</label>
                    <input type="text" class="form-control" id="aadhar" name="aadhar" required>
                </div>
                <div class="form-group">
                    <label for="course">Qualification:</label>
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
                    <label for="branch">Department:</label>
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
                    <button type="button" class="btn btn-secondary">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
</html>
