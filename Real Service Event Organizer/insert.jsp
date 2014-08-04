<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,bean.*,java.util.*,java.io.*" errorPage="" %>
<%
String user = (String) session.getAttribute("user");
String pass = (String) session.getAttribute("pass");
String admin = (String) session.getAttribute("admin");

	database db = new database(application.getRealPath("WEB-INF/db.mdb")); //memanggil been db
	if(db.cekLogin(user,pass))//melakukan cek login
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
<link href="class.css" rel="stylesheet" type="text/css" /></head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3" bgcolor="#E7E3E3"><img src="images/Up.png" width="881" height="83" /></td>
  </tr>
  <tr>
    <td width="33%" height="46">
	<%
		tanggal date = new tanggal(); //memanggil been tanggal
		String hari = date.getHari();
		
		out.print("Selamat "+hari+". "+user);
	%>
	</td>
    <td width="33%"><div align="right">Total Pengujung 
	<%
	out.print(db.getJumlah());//memprint out jumlah pengunjung
	
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

  <tr>
    <td height="57" colspan="2"><p>&nbsp;</p>
	  <div align="center">
	    <%
	if(admin.equals("1.0"))
	{
	%>
		<form method="post" action="./insertEvent">
          <table width="598" border="0" cellpadding="0" cellspacing="0">
		  
          <tr>
            <td height="44" colspan="3" bgcolor="#CCCCCC" class="judul">Insert Event </td>
            </tr>
          <tr>
            <td height="22" colspan="3" class="war" ><%
			String error1 = request.getParameter("error1");
			if(error1!=null && !error1.equals(""))
			{
				out.print(error1);
			}
	%></td>
          </tr>
          <tr>
            <td width="189" height="35" align="left">Nama Event</td>
            <td width="12">:</td>
            <td width="397"><div align="left">
              <input name="NamaEvent" type="text" id="NamaEvent" size="30" />
            </div></td>
          </tr>
          <tr>
            <td height="156" align="left" valign="top">Description</td>
            <td valign="top">:</td>
            <td height="156"><textarea name="eventKeterangan" cols="50" rows="9" id="eventKeterangan"></textarea></td>
          </tr>
          <tr>
            <td height="43" colspan="3"><input type="submit" name="Submit" value="Insert Event" /></td>
            </tr>
          </table>
	    </form>
			
	    <br />
		<form method="post" action="./insertService ">
	    <table width="601" border="0" cellpadding="0" cellspacing="0">
	        <tr>
	          <td height="41" colspan="3" bgcolor="#CCCCCC" class="judul">Insert Service </td>
            </tr>
	        <tr>
	          <td height="22" colspan="3" ><span class="war">
	            <%
			String error2 = request.getParameter("error2");
			if(error2!=null && !error2.equals(""))
			{
				out.print(error2);
			}
	%>
	          </span></td>
          </tr>
	        <tr>
	          <td width="181" height="26" align="left">Nama Service </td>
	          <td width="10">:</td>
	          <td width="410"><div align="left">
	            <input name="namaService" type="text" id="namaService" size="30" />
              </div></td>
            </tr>
	        <tr>
	          <td height="26" align="left" valign="top">Description</td>
	          <td valign="top">:</td>
	          <td><textarea name="serviceKeterangan" cols="50" rows="9" id="serviceKeterangan"></textarea></td>
            </tr>
	        <tr>
	          <td height="31" align="left">price</td>
              <td>:</td>
              <td><div align="left">
                <input name="harga" type="text" id="harga" />
              </div></td>
          </tr>
	        <tr>
	          <td height="33" colspan="3"><input type="submit" name="Submit2" value="Insert Service" /></td>
            </tr>
        </table>
		</form>
		<form method="post" action="./insertTeam">
	    <br />
	    <table width="603" border="0" cellpadding="0" cellspacing="0">
	        <tr>
	          <td height="35" colspan="3" bgcolor="#CCCCCC" class="judul">Insert Team </td>
            </tr>
	        <tr>
	          <td height="20" colspan="3" ><span class="war">
	            <%
			String error = request.getParameter("error");
			if(error!=null && !error.equals(""))
			{
				out.print(error);
			}
	%>
	          </span></td>
            </tr>
	        <tr>
	          <td width="187" height="31" align="left">Nama Team </td>
	          <td width="13">:</td>
	          <td width="424"><div align="left">
	            <input name="NamaTeam" type="text" id="NamaTeam" size="30" />
              </div></td>
            </tr>
	        <tr>
	          <td height="28" align="left" valign="top">Keterangan</td>
	          <td valign="top">:</td>
	          <td><textarea name="teamKeterangan" cols="50" rows="9" id="teamKeterangan"></textarea></td>
            </tr>
	        <tr>
	          <td height="41" colspan="3"><input type="submit" name="Submit3" value="Insert Team" /></td>
          </tr>
        </table>
		</form>
	    <%
	}
	%>
      </div>
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