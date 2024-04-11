<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Project</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar-brand {
            margin-right: auto; /* Moves NIET Cloud to the left corner */
        }

        .navbar-nav {
            margin: auto; /* Centers the menu items */
        }
        .full-screen {
    height: 100vh; /* 100% of viewport height */
    width: 100vw; /* 100% of viewport width */
    overflow: hidden; /* Hide scrollbars */
}

.full-screen-iframe {
    height: 100%; /* 100% of parent element's height (full-screen div) */
    width: 100%; /* 100% of parent element's width (full-screen div) */
}
        
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mr-5 h-10">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
           <!--  <img src="Assets/nietlogo.png" height="135px" width="100px" /> -->
           Niet Cloud

</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="newInfoDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            New Information
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="newInfoDropdown">
                            <li><a class="dropdown-item" href="AddTeacher.jsp">New Faculty Information</a></li>
                            <li><a class="dropdown-item" href="AddStudent.jsp">New Student Information</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="viewDetailsDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            View Details
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="viewDetailsDropdown">
                            <li><a class="dropdown-item" href="DisplayTeacherDisplay.jsp">Faculty Details</a></li>
                            <li><a class="dropdown-item" href="DisplayStudentDetails.jsp">Student Details</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="leaveDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Leave
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="leaveDropdown">
                            <li><a class="dropdown-item" href="#">Faculty Leave</a></li>
                            <li><a class="dropdown-item" href="#">Student Leave</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="leaveDetailsDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Leave Details
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="leaveDetailsDropdown">
                            <li><a class="dropdown-item" href="#">Faculty Leave Details</a></li>
                            <li><a class="dropdown-item" href="#">Student Leave Details</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="examDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Exam
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="examDropdown">
                            <li><a class="dropdown-item" href="#">Examination Results</a></li>
                            <li><a class="dropdown-item" href="#">Download Admit Card</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="updateDetailsDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Update Details
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="updateDetailsDropdown">
                            <li><a class="dropdown-item" href="UpdateTeacher.jsp">Update Faculty Details</a></li>
                            <li><a class="dropdown-item" href="UpdateStudent.jsp">Update Student Details</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="feeDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Fee
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="feeDropdown">
                            <li><a class="dropdown-item" href="#">Fee Structure</a></li>
                            <li><a class="dropdown-item" href="#">Pay Fee</a></li>
                        </ul>
                    </li>
                    
                </ul>
            </div>
            
                        <a class="nav-link text-white button" href="Login.jsp"><button class="btn btn-light">Log Out</button></a>
                    
        </div>
    </nav>
    <div class="full-screen">
        <!-- Your website content goes here -->
        <!-- For example, an iframe with the website URL -->
        <iframe src="https://www.niet.co.in" frameborder="0" class="full-screen-iframe"></iframe>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</body>
</html>
