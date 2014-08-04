<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="class.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" bgcolor="#E7E3E3"><img src="images/Up.png" width="881" height="83" /></td>
  </tr>
  <tr>
    <td height="34" colspan="4" class="judul"><div align="center">Login</div></td>
    <td width="27%" rowspan="6">&nbsp;</td>
  </tr>
  <tr>
    <td height="35" colspan="4" class="war">
	<%
			String error = request.getParameter("error");//mendapat kan passingan error
			if(error!=null && !error.equals(""))
			{
				out.print(error);
			}
	%></td>
  </tr>
  <form method="post" action="./UserLogin">
  <tr>
    <td width="15%" height="32">&nbsp;</td>
    <td width="14%">Username</td>
    <td width="1%">:</td>
    <td width="43%" height="32"><input name="username" type="text" id="username" /></td>
  </tr>
  <tr>
    <td height="33">&nbsp;</td>
    <td height="33"> Password </td>
    <td height="33">:</td>
    <td><input name="password" type="password" id="password" /></td>
  </tr>
  <tr>
    <td height="39">&nbsp;</td>
    <td height="39" colspan="3"><input type="submit" name="Submit" value="L O G I N" /> 
      <a href="registrasi.jsp" class="af">R e g i s t r a s i   </a></td>
  </tr>
  <tr>
    <td height="17" colspan="4">&nbsp;</td>
  </tr>
  </form>
  <tr>
    <td height="24" colspan="5" bgcolor="#E7E3E3"><div align="center">copyright&copy;2009Binusian2010</div></td>
  </tr>
</table>
</body>
</html>
