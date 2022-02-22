<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	errorPage="errorHandler.jsp"%>

<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/employee";%>
<%!String user = "root";%>
<%!String psw = "Password123$";%>
<%
String id = request.getParameter("userid");
int salary= Integer.parseInt(request.getParameter("salary"));

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="update emp set salary=? where id="+personID;
ps = con.prepareStatement(sql);
ps.setInt(1,salary);

int i = ps.executeUpdate();
if(i > 0)
{
	
out.print("<h4>Record Updated Successfully</h4>");

}
else
{
out.print("<h4>There is a problem in updating Record.</h4>");
}
}
catch(SQLException sql)
{
//request.setAttribute("error", sql);
out.println(sql);
}
}
%>
<%@include file="update.html"%>

