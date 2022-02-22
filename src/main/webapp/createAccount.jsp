<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	errorPage="errorHandler.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account Jsp</title>
</head>
<body>
	<%!Connection con;
	PreparedStatement ps;

	public void jspInit() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/employee", "root", "Password123$");
			ps = con.prepareStatement("insert into emp values(?,?,?,?,?)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void jsDestroy() {
		try {
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}%>

	<%
	int id = Integer.parseInt(request.getParameter("userid"));
	String name = request.getParameter("firstName");
	int age = Integer.parseInt(request.getParameter("age"));
	int salary = Integer.parseInt(request.getParameter("salary"));
	String desig = request.getParameter("desig");

	ps.setInt(1, id);
	ps.setString(2, name);
	ps.setInt(3, age);
	ps.setInt(4, salary);
	ps.setString(5, desig);

	int result = ps.executeUpdate();
	%>
  <%

	if(result > 0){
		out.println("<h4>Registered Successfully</h4>");
	}else{
		out.println("<h4>Problem occured while registering</h4>");
	}
	
	%>
	<%@include file="CreateAccount.html"%>

</body>
</html>