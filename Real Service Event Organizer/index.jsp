<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,bean.*,java.util.*,java.io.*" errorPage="" %>
<%
String user = (String) session.getAttribute("user");
String pass = (String) session.getAttribute("pass");
String admin = (String) session.getAttribute("admin");

	database db = new database(application.getRealPath("WEB-INF/db.mdb")); //memanggil been db
	if(db.cekLogin(user,pass))
	{
	
	String[] dat = new String[12];// menghilangkan nilai dari session yang namanya password
dat[0] = "Januari";
dat[1] = "Febuari";
dat[2] = "Maret";
dat[3] = "April";
dat[4] = "Mei";
dat[5] = "Juni";
dat[6] = "Juli";
dat[7] = "Agustus";
dat[8] = "September";
dat[9] = "Oktober";
dat[10] = "November";
dat[11] = "Desember";
	
%>
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
    <td colspan="3" bgcolor="#E7E3E3"><img src="images/Up.png" width="881" height="83" /></td>
  </tr>
  <tr>
    <td width="33%" height="46">
	<%
		tanggal date = new tanggal();//memanggil been tanggal
		String hari = date.getHari();
		
		out.print("Selamat "+hari+". "+user);
	%>
	</td>
    <td width="33%"><div align="right">Total Pengujung 
	<%
	out.print(db.getJumlah());//mengeluarkan jumlah pengunjung
	
	%></div></td>
    <td width="34%" rowspan="2" valign="top"><p>&nbsp;</p>
      <table width="179" border="0" align="center" cellpadding="0" cellspacing="0" class="gh">
      <tr>
        <td width="169" height="32" bgcolor="#CCCCCC"><div align="center">Menu</div></td>
	  </tr>
		<%
		if(admin.equals("1.0"))
		{
		%>
		  <tr>
        <td width="169" height="30" ><div align="center"><a href="index.jsp" class="af">Index</a></div></td>
	  </tr>
	  <tr>
        <td width="169" height="28" ><div align="center"><a href="insert.jsp" class="af">Master Insert</a></div></td>
	  </tr>
	  <tr>
        <td width="169" height="29" ><div align="center"><a href="teamProfile.jsp" class="af">Team Profile</a></div></td>
	  </tr>
	  <td width="169" height="29" ><div align="center"><a href="eventList.jsp" class="af">Event List Profile</a></div></td>
	  </tr>
	  <td width="169" height="29" ><div align="center"><a href="viewTransaction.jsp" class="af">View All Transaction</a></div></td>
	  </tr>
	  <tr>
        <td width="169" height="28" ><div align="center"><a href="logout.jsp" class="af">Logout</a></div></td>
	  </tr>
		<%
		}else if(admin.equals("0.0"))
		{
			%>
	  <tr>
        <td width="169" height="30" ><div align="center"><a href="index.jsp" class="af">Index</a></div></td>
	  </tr>
	  <tr>
        <td width="169" height="28" ><div align="center"><a href="booking.jsp" class="af">Booking</a></div></td>
	  </tr>
	  <tr>
        <td width="169" height="29" ><div align="center"><a href="viewHistory.jsp" class="af">View History</a></div></td>
	  </tr>
	  <tr>
        <td width="169" height="28" ><div align="center"><a href="logout.jsp" class="af">Logout</a></div></td>
	  </tr>
		<%
		}
		%>
      

    </table></td>
  </tr>
  <form method="post" action="booking.jsp">
  <tr>
    <td height="57" colspan="2" >
	<%
	if(admin.equals("0.0"))
		{
	%>
      <table width="379" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="45" colspan="3" bgcolor="#CCCCCC" ><div class="judul">Tanggal Event yang pilih &nbsp;&nbsp;&nbsp;&nbsp;</div> </td>
        </tr>
      <tr>
        <td height="22" colspan="3" ><div align="center" class="war"><%
			String error = request.getParameter("error");
			if(error!=null && !error.equals(""))
			{
				out.print(error);
			}
	%></div></td>
      </tr>
      <tr>
        <td width="150" height="29">List Date </td>
        <td width="8">:</td>
        <td width="276"><select name="date" id="date">
          <option value="0">--Pilih Salah Satu --</option>
			<%
			int i;
			for (i=1;i<=31;i++)
			{
			%>
		 <option value="<%=i%>"><%=i%></option>
		 <%
		 }
		 %>
        </select>        </td>
      </tr>
      <tr>
        <td height="29">List Month </td>
        <td>:</td>
        <td><select name="month" id="month">
		 <option value="0">--Pilih Salah Satu --</option>
		<%
			for (i=1;i<=12;i++)
			{
		%>
		 <option value="<%=i-1%>"><%=dat[i-1]%></option>
		 <%
		 }
		 %>
        </select>        </td>
      </tr>
      <tr>
        <td height="31">List Year </td>
        <td>:</td>
        <td><select name="year" id="year">
		 <option value="0">--Pilih Salah Satu --</option>
			<%
			for (i=2009;i<=2030;i++)
			{
			%>
		 <option value="<%=i%>"><%=i%></option>
		 	<%
		 	}
			%>
        </select>        </td>
      </tr>
      <tr>
        <td height="33">&nbsp;</td>
        <td>&nbsp;</td>
        <td><div align="right">
          <input name="N e x t" type="submit" id="N e x t" value="N e x t" />
        </div></td>
      </tr>
    </table>
	<%
	}else if(admin.equals("1.0"))
	{
	%>
	<table bgcolor="#CCCCCC" >
	<div class="judul">Welcome Administrator</div></table>
	<%
	}
	%>
    <p>&nbsp;</p></td>
  </tr>
    </form>
  <tr>
    <td height="24" colspan="3" bgcolor="#E7E3E3"><div align="center">copyright&copy;2009Binusian2010</div></td>
  </tr>
</table>
</body>
</html>
<%
	}else
	{
		response.sendRedirect("login.jsp?error=Anda harul melakukan login terlebih dahulu");
	}
%>