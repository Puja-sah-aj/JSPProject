<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <title>Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .container {
            width: 50%;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
            margin-top: 50px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            box-sizing: border-box;
        }
        .form-group input[type="submit"] {
            width: auto;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Registration Form</h2>
        <form action="index.jsp" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select id="gender" name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Register">
            </div>
        </form>
    </div>
    <%
 // Handling form submission
 if("POST".equalsIgnoreCase(request.getMethod())){
	 String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String gender = request.getParameter("gender");
	    String password = request.getParameter("password");
	    
	    Connection conn = null;
	   PreparedStatement pre = null;
	    
	    
	    try{
	    	
	    		Class.forName("com.mysql.jdbc.Driver");
	    		        
	    		        // Create Connection to the database
	    		        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbconn1", "root", "Puja2002");
	    		        String sql = "insert into register(name,email,gender,password) values (?,?,?,?)";
	    		        pre = conn.prepareStatement(sql);
	    		        pre.setString(1, name);
	    		        pre.setString(2, email);
	    		        pre.setString(3, gender);
	    		        pre.setString(4,password);
	    		      int i =  pre.executeUpdate();
	    		      if(i>0){
	    		    	  out.println("Registration successful!");
	    		      }
	    		      else{
	    		    	  out.println("Registration  not successful!");
	    		    	
	    		    }
	    	
	    }catch(Exception e){
	    e.printStackTrace();	
	    }
	    
	    
 }
    
    %>
</body>
</html>