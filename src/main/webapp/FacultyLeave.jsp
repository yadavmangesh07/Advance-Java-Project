<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Faculty Leave Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 50px;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
            padding: 40px;
            margin-bottom: 50px;
            height:90vh;
        }

        h2 {
            color: #007bff;
            text-align: center;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            margin-top: 10px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        
        .form-group {
            padding: 15px;
        }
        
        .form-group label {
            padding-right: 10px;
        }

        .form-check {
            padding: 15px;
            margin-left: 25px;
        }

        .btn {
            margin-left: 20px;
        }
        label,input{
        padding:5px;}
        
        
        
    </style>
</head>
<body>
    <div class="container w-50">
        <h2>Faculty Leave Application</h2>
        <form action="FacultyLeaveServlet" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="facultyName">Faculty Name:</label>
                <input type="text" class="form-control" id="facultyName" name="facultyName" required>
            </div>
            <div class="form-group">
                <label for="facultyId">Faculty ID:</label>
                <input type="text" class="form-control" id="facultyId" name="facultyId" required>
            </div>
            <div class="form-group">
                <label for="startDate">Starting Date for Leave:</label>
                <input type="date" class="form-control" id="startDate" name="startDate" required>
            </div>
           
            <div class="form-check">
                <input  type="checkbox" class="form-check-input" id="acceptTerms" name="acceptTerms" required>
                <label class="form-check-label" for="acceptTerms">I accept the terms of leave</label>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</body>
</html>
