<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	errorPage="errorHandler.jsp"%>


<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/employee";%>
<%!String user = "root";%>
<%!String psw = "Password123$";%>
<%
String id = request.getParameter("userid");


if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="delete from emp where id=?";
ps = con.prepareStatement(sql);
ps.setInt(1,personID);

int i = ps.executeUpdate();

if(i > 0)
{
	
out.print("<h4> Record deleted Successfully </h4>");

}
else
{
out.print("<h4>There is a problem in deleting Record.</h4>");
}
}
catch(SQLException sql)
{
//request.setAttribute("error", sql);
out.println(sql);
}
}
%>
<%@include file="delete.html"%>










