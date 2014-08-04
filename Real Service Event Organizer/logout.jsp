<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,bean.*,java.util.*,java.io.*" errorPage="" %>

<%

String username = (String) session.getAttribute("user");
String password = (String) session.getAttribute("pass");

database db = new database(application.getRealPath("WEB-INF/db.mdb")); 
db.UpdateLogin(username , password,"logout");

session.removeAttribute("user"); // menghilangkan nilai dari session yang namanya user
session.removeAttribute("pass");// menghilangkan nilai dari session yang namanya password
session.removeAttribute("admin");  

session.invalidate(); // menghancurkan session
response.sendRedirect("login.jsp"); // mengirim pesan logout berhasil
%>