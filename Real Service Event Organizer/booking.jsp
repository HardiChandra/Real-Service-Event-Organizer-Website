<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,bean.*,java.util.*,java.io.*" errorPage="" %>
<%
String user = (String) session.getAttribute("user");
String pass = (String) session.getAttribute("pass");
String admin = (String) session.getAttribute("admin");

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

	database db = new database(application.getRealPath("WEB-INF/db.mdb")); 
	if(db.cekLogin(user,pass) && admin.equals("0.0")) // mengecek apakah terjai login
	{

	String tanggal = request.getParameter("date");
	String month = request.getParameter("month");
	String year = request.getParameter("year");

	tanggalBeen tglBook = new tanggalBeen (tanggal,year,month); // memanggil been tanggalBeen
	tglBook.cekDate();
	if(tglBook.getceking())
	{
	response.sendRedirect(tglBook.getmesage());
	}else
	{
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
		tanggal date = new tanggal();
		String hari = date.getHari();
		
		out.print("Selamat "+hari+". "+user);
	%>
		</td>
   		<td width="33%"><div align="right">Total Pengujung 
	<%
	out.print(db.getJumlah());
	%>
			</div>
		</td>
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
      

   		  </table>
			
		</td>
  		</tr>
  
  		<tr>
    		<td height="57" colspan="2" align="center">

	  <p align="left">Tanggal Booking Anda 
	  <%
	  
	  out.print(tglBook.getdate() + " " + dat[tglBook.getmonth()-1] + " "+ tglBook.getyear());
	  %>  	
	  </p>
	  <%
	  if(admin.equals("0.0"))
		{
	  %>
	  		<form method="post" action="service.jsp">
	  
	  <table width="560" height="141" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="37" colspan="3" class="judul">Tahap Pemilihan Event dan Team </td>
        <td height="56" rowspan="2" class="judul">&nbsp;</td>
      </tr>
      <tr>
        <td height="28" colspan="3" class="judul"><div align="center" class="war">
		<%
			String error = request.getParameter("error");
			if(error!=null && !error.equals(""))
			{
				out.print(error);
			}
	%></div></td>
      </tr>
      <tr>
        <td width="120" height="22"> Event </td>
        <td width="11">:</td>
        <td width="198" align="left"><div align="left">
          <select name="event" id="event">
		  <option value="">--Pilih Salah satu event --</option>
		  <%
		  		
				ArrayList event = db.viewEvent("select * from ms_Event"); // memanggil been event
				Iterator iterator = event.iterator();
				
				
				while(iterator.hasNext()) 
				{
					event ev = (event) iterator.next();
				
		  %>
		  <option value="<%= ev.getidevent()%>"><%= ev.getevent()%></option>
		  <%
		  		}
		  %>
          </select>
        </div></td>
        <td width="134" align="left"><div align="left"><a href="eventList.jsp" class="af">Event List </a></div></td>
      </tr>
      <tr>
        <td>Available Team </td>
        <td>:</td>
        <td><div align="left">
          <select name="team" id="team">
		  
		    <option value="">--Pilih Salah satu event --</option>
		  <%
		  		
				ArrayList team = db.viewTeam("select * from ms_team a where NOT EXISTS (select * from (select b.* from ms_team b, ms_header_Booking c where b.idTeam = c.idTeam and tanggal ="+tglBook.getdate()+" and month ="+tglBook.getmonth()+" and year ="+tglBook.getyear()+")e where a.idTeam = e.idTeam)");
				Iterator iterator1 = team.iterator(); //menyimpan data team perupa arraylist ke iterator 1
				
				
				while(iterator1.hasNext()) 
				{
					team tm= (team) iterator1.next();
				
		  %>
		  <option value="<%= tm.getidteam()%>"><%= tm.getnamaTeam()%></option>
		  <%
		  		}
		  %>
          </select>
         
        </div></td>
		<input type="hidden" name="date" value="<%=tglBook.getdate()%>"/>
		<input type="hidden" name="month" value="<%=tglBook.getmonth()%>"/>
		<input type="hidden" name="year"  value="<%=tglBook.getyear()%>"/>
        <td><div align="left"><a href="teamProfile.jsp" class="af">Team Profile </a></div></td>
      </tr>
      <tr>
        <td height="30" colspan="3">
          
              <div align="right">
                <input type="submit" name="Submit" value="N e x t" />
              </div></td>
        <td height="30">&nbsp;</td>
      </tr>
    </table>
     </form>
	 <%
	 }
	 %>
	 
	  <p>&nbsp;</p>
   </td>
  </tr>
    
  <tr>
    <td height="24" colspan="3" bgcolor="#E7E3E3"><div align="center">copyright&copy;2009Binusian2010</div></td>
  </tr>
</table>
</body>
</html>
<%
	}

	}else
	{
		response.sendRedirect("login.jsp?error=Anda harul melakukan login terlebih dahulu");
	}
%>