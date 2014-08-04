<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,bean.*,java.util.*,java.io.*" errorPage="" %>
<%
String user = (String) session.getAttribute("user");
String pass = (String) session.getAttribute("pass");
String admin = (String) session.getAttribute("admin");

	database db = new database(application.getRealPath("WEB-INF/db.mdb")); //memanggil objek been db
	if(db.cekLogin(user,pass))
	{
	
	String[] dat = new String[12]; // menyimpan nama bulan pada array dat
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
    <td width="33%" height="46"><%
		tanggal date = new tanggal(); //membentuk objek been date
		String hari = date.getHari(); //menapatkan nama hari
		
		out.print("Selamat "+hari+". "+user);
	%>
    </td>
    <td width="33%"><div align="right">Total Pengujung
      <%
	out.print(db.getJumlah());
	
	%>
    </div></td>
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
  <tr>
    <td height="57" colspan="2"><p>&nbsp;</p>
        <%
	if(admin.equals("1.0"))
	{
	   String idEvent = request.getParameter("event");
	   String idTeam = request.getParameter("team");
	   String tanggal = request.getParameter("tanggal");
	   String username = request.getParameter("user");
	%>
	<form method="post" action="transaction.jsp">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="41" colspan="3" bgcolor="#CCCCCC" class="judul">Masukan Jumlah Page </td>
        </tr>
      <tr>
        <td height="28" colspan="3"><span class="war">
          <%
			String error = request.getParameter("error"); // mendapatkan variabel error
			if(error!=null && !error.equals(""))
			{
				out.print(error);
			}
	%>
        </span></td>
      </tr>
      <tr>
        <td width="47%" height="36">Jumlah Page yang ingin di Tampilkan </td>
        <td width="1%">:</td>
        <td width="52%"><input name="num" type="text" id="num" /></td>
      </tr>
	  <input name="idEvent" type="hidden" id="num" value="<%=idEvent%>" />
	  <input name="idTeam" type="hidden" id="num" value="<%=idTeam%>" />
	  <input name="tanggal" type="hidden" id="num" value="<%=tanggal%>" />
	  <input name="user" type="hidden" id="num" value="<%=username%>" />
      <tr>
        <td height="31" colspan="3"><input type="submit" name="Submit" value="M a s u k" /></td>
        </tr>
      
    </table></form>
    <%
	}
	%>
        <p>&nbsp;</p></td>
  </tr>
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