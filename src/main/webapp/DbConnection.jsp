<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
try{
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbconn1", "root", "Puja2002");
	
}catch(Exception e){
	e.printStackTrace();
}
if("POST".equalsIgnoreCase(request.getMethod())){
	 String name = request.getParameter("name");
	 String email = request.getParameter("email");
	 String gender = request.getParameter("gender");
	 String password = request.getParameter("password");
	       
	    
	    PreparedStatement pre = null;
	    int result = 0;
	    
	    
	    try{
	    	 String sql = "insert into register(name,email,gender,password) values (?,?,?,?)";
		    pre = conn.prepareStatement(sql);
	    	pre.setString(1, name);
	    	pre.setString(2, email);
	    	pre.setString(3, gender);
	    	pre.setString(4, password);
	    	result = pre.executeUpdate();
	    	if(result>0){
	    		out.println("Registration sucessfully");
	    	}
	    	else{
	    		out.println("Registration not sucessfully");
	    	}
	    	
	    }catch(Exception e){
	    	e.printStackTrace();
	    	
	    }
	    
}

%>

</body>
</html>