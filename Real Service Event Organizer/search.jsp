<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,bean.*,java.util.*,java.io.*" errorPage="" %>
<%@ include file = "function.jsp"%>	

<%
String user = (String) session.getAttribute("user");
String pass = (String) session.getAttribute("pass");
String admin = (String) session.getAttribute("admin");

	database db = new database(application.getRealPath("WEB-INF/db.mdb")); 
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
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
.style2 {font-size: 12px}
-->
</style>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3" bgcolor="#E7E3E3"><img src="images/Up.png" width="881" height="83" /></td>
  </tr>
  <tr>
    <td width="21%" height="46">
	<%
		tanggal date = new tanggal();
		String hari = date.getHari();
		
		out.print("Selamat "+hari+". "+user);
	%>
	</td>
    <td width="56%"><div align="right">Total Pengujung 
	<%
	out.print(db.getJumlah());
	
	%></div></td>
    <td width="23%" rowspan="2" valign="top"><p>&nbsp;</p>
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
      

    </table>
  </td>
  </tr>
  <tr>
    <td height="57" colspan="2">
	<%
	if(admin.equals("0.0"))
	{
	%>
	 <form method="post"  action="./DeleteBkg">
  <table width="100%" height="67" border="1" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="40" colspan="7" bgcolor="#CCCCCC" class="judul"><div align="center">History Booking </div></td>
    </tr>
    <tr>
      <td width="17%"  height="27" bgcolor="#666666"><div align="center" class="style1"></div>        <div align="center" class="style1">TANGGAL <br />
          BOOKING </div></td>
      <td width="12%" height="27" bgcolor="#666666"><div align="center" class="style1">USER</div></td>
      <td width="11%" bgcolor="#666666"><div align="center" class="style1">TEAM</div></td>
      <td width="15%" height="27" bgcolor="#666666"><div align="center" class="style1">SERVICE</div></td>
      <td width="11%" bgcolor="#666666"><div align="center" class="style1">EVENT</div></td>
      <td width="11%" bgcolor="#666666"><div align="center"><span class="style1">Harga</span></div></td>
      <td width="23%" bgcolor="#666666"><div align="center" class="style1">ACTION</div></td>
    </tr>
    <%
	   String idEvent = request.getParameter("event");
	   String idTeam = request.getParameter("team");
	   String tanggal = request.getParameter("tanggal");
	   String idService = request.getParameter("service");
	 
	  
	   String query = " ";
		
		if(idEvent != "" && idEvent != null)
		{
			query =query + " and b.idEvent = "+idEvent;
		}
		
		if(idTeam != "" && idTeam != null)
		{
			query = query + " and b.idTeam  = "+idTeam ;
		}
		
		if(tanggal != "" && tanggal != null)
		{
			query = query + " and tanggal = "+tanggal.substring(0,tanggal.indexOf("-")) + " and month = "+tanggal.substring(tanggal.indexOf("-")+1,tanggal.lastIndexOf("-")-tanggal.indexOf("-")+1)+" and year ="+tanggal.substring(tanggal.length()-4,8) ;
		}
		
		if(idService != "" && idService != null)
		{
			query =query + "  and EXISTS (select * from (select * from ms_detail_Booking  where idService = "+idService+")a where a.idBooking = b.idBooking)" ;
		}
		
//memanggil been viewBooking
		  		
				ArrayList booking = db.viewBooking("select b.idBooking,tanggal,month,year,namaTeam,namaEvent,c.username from ms_header_Booking b, ms_login c, ms_event d, ms_team e where  b.idUser = c.idUser and b.idEvent = d.idEvent and e.idTeam = b.idTeam "+query +" and  c.username = '"+user+"'");
				Iterator iterator1 = booking.iterator();
	
	 
	 			 
				
				while(iterator1.hasNext()) 
				{
					HeaderBooking bkg = (HeaderBooking) iterator1.next(); // memajukan data pada array selanjutnya
				
		  %>
    <tr>
      <td  height="15"> 
	  
	  <span class="style2">
	  
	  <%
	  out.print(bkg.gettanggal()+" - "+dat[bkg.getmonth()]+" - "+bkg.getyear());
	  %>
	   </span></td>
      <td width="12%"  height="27">
	    <span class="style2">
		
		<%
		out.print(bkg.getusername());
		%>
		</span></td>
      <td width="11%"   height="27">
	  <span class="style2">
	  
	  <%
	  out.print(bkg.getteam());
	  %>
	  </span></td>
      <td  width="15%"  height="27"><span class="style2"><%=service(bkg.getidBooking())%></span></td>
      <td width="11%">
	  <span class="style2">
	  
	  <%
	  out.print(bkg.getevent());
	  %>
	  </span></td>
	  <td width="11%"><div align="center">
	       <%
			out.print(TotalHarga(bkg.getidBooking()));
			%>
	    </div></td>
	  <input type="hidden" name="idBooking" value="<%=bkg.getidBooking()%>" />
      <td width="23%"  ><span class="style2"> 
	   	
        <input type="submit" name="Submit" value="Clear" />
         </span> 
		<%
		if(date.cekDateValid(bkg.gettanggal(),bkg.getmonth(),bkg.getyear()))//melakukan pengecekan data tanggal
		{
		%>
		| <span class="af"><a href="editHistory.jsp?idBooking=<%=bkg.getidBooking()%>" class="af">Change Date</a> </span>
		<%
		}
		%>	  </td>
    </tr>
    <%
		  		}
	%>
  </table>
   </form>
  <%
  }
  %>
	
  </td>
 
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