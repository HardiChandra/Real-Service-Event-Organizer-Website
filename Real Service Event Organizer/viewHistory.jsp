<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,bean.*,java.util.*,java.io.*" errorPage="" %>
<%
String user = (String) session.getAttribute("user");
String pass = (String) session.getAttribute("pass");
String admin = (String) session.getAttribute("admin");

	database db = new database(application.getRealPath("WEB-INF/db.mdb")); 
	if(db.cekLogin(user,pass))
	{
	
	String[] dat = new String[12];// menyimpan nama bulan pada array dat
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
		tanggal date = new tanggal();
		String hari = date.getHari();
		
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
	if(admin.equals("0.0"))//mengecek admin dan user
	{
	%>
        <form method="post" action="search.jsp">
          <table width="427" height="196" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="31" colspan="3" bgcolor="#CCCCCC"><div align="right" class="judul">
                  <div align="center">Search History Data </div>
              </div></td>
            </tr>
            <tr>
              <td width="116" height="29">Event</td>
              <td width="14">:</td>
              <td width="297"><select name="event" id="event">
                  <option value="">--Pilih Salah satu --</option>
                  <%
		  		
				ArrayList event = db.viewEvent("select * from ms_Event");
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
              </td>
            </tr>
            <tr>
              <td height="28">Tanggal Event </td>
              <td width="14">:</td>
              <td width="297"><select name="tanggal" id="tanggal">
                  <option value="">-- Pilih Salah Satu --</option>
                  <%
		  		
				ArrayList booking = db.viewBooking("select * from ms_header_Booking a, ms_login b where a.idUser = b.idUser and username ='"+user+"'");
				Iterator iterator3 = booking.iterator();
				
				
				while(iterator3.hasNext()) 
				{
					HeaderBooking bkg= (HeaderBooking) iterator3.next(); // memajukan data paa array selanjutnya paa objek been bkg
				
		  %>
                  <option value="<%= bkg.gettanggal()%>-<%=bkg.getmonth()%>-<%=bkg.getyear()%>"><%= bkg.gettanggal()%> - <%= dat[bkg.getmonth()]%> - <%=bkg.getyear()%></option>
                  <%
		  		}
		  %>
                </select>
              </td>
            </tr>
            <tr>
              <td height="27">Team</td>
              <td>:</td>
              <td><select name="team" id="team">
                  <option value="">--Pilih Salah satu--</option>
                  <%
		  		
				ArrayList team = db.viewTeam("select * from ms_team ");//memanggil been viewTeam
				Iterator iterator1 = team.iterator();
				
				
				while(iterator1.hasNext()) 
				{
					team tm= (team) iterator1.next();
				
		  %>
                  <option value="<%= tm.getidteam()%>"><%= tm.getnamaTeam()%></option>
                  <%
		  		}
		  %>
                </select>
              </td>
            </tr>
            <tr>
              <td height="27">Service</td>
              <td>:</td>
              <td><select name="service" id="service">
                  <option value="">--Pilih Salah satu --</option>
                  <%
		  		
				ArrayList service = db.viewService("select * from ms_service ");//memanggil bean service
				Iterator iterator2 = service.iterator();
				
				
				while(iterator2.hasNext()) 
				{
					service svc= (service) iterator2.next();
				
		  %>
                  <option value="<%= svc.getidService()%>"><%= svc.getService()%></option>
                  <%
		  		}
		  %>
                </select>
              </td>
            </tr>
            <tr>
              <td height="29" colspan="3"><input name="Search" type="submit" id="Search" value="S e a r c h" /></td>
            </tr>
          </table>
        </form>
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