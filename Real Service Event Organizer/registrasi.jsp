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
    <td bgcolor="#E7E3E3"><img src="images/Up.png" width="881" height="83" /></td>
  </tr>
  <tr>
<td height="86"><table width="453" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="55" colspan="3" class="judul">Login</td>
    </tr>
  <tr>
    <td height="25" colspan="3" class="judul"><div align="center" class="war">
	<%
			String error = request.getParameter("error");//mendapatkan variabel passing error
			if(error!=null && !error.equals(""))
			{
				out.print(error);
			}
	%>
	</div></td>
  </tr>
	<form method="post" action="./UserRegister">
  <tr>
    <td width="165" height="38"><strong>Nama Lengkap </strong></td>
    <td width="4">:</td>
    <td width="284"><input name="nama" type="text" id="nama" size="30" /></td>
  </tr>
  <tr>
    <td height="38"><strong>Email </strong></td>
    <td width="4">:</td>
    <td width="284"><input name="email" type="text" id="email" size="30" /></td>
  </tr>
  <tr>
    <td height="33" valign="top"><strong>Jenis Kelamin </strong></td>
    <td valign="top">:</td>
    <td><p>
      <input name="radiobutton" type="radio" value="1" />
      Laki Laki</p>
      <p>
        <input name="radiobutton" type="radio" value="0" /> 
        Perempuan</p></td>
  </tr>
  <tr>
    <td height="34"><strong>Username</strong></td>
    <td>:</td>
    <td><input name="username" type="text" id="username" size="30" /></td>
  </tr>
  <tr>
    <td height="36"><strong>Password </strong></td>
    <td>:</td>
    <td><input name="password" type="password" id="password" /></td>
  </tr>
  <tr>
    <td height="43"><strong>Retype Password </strong></td>
    <td>:</td>
    <td><input name="RetPassword" type="password" id="RetPassword" /></td>
  </tr>
  <tr>
    <td height="83" colspan="3"><input name="daftar" type="submit" id="daftar" value="D a f t a r" />
      <input type="reset" name="Reset" value="K o s o n g k a n" /></td>
    </tr>
  <tr>
    <td height="17">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  </form>
</table></td>
</tr>
  <tr>
    <td height="24" bgcolor="#E7E3E3"><div align="center">copyright&copy;2009Binusian2010</div></td>
  </tr>
</table>
</body>
</html>
