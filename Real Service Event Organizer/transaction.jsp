<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,bean.*,java.util.*,java.io.*" errorPage="" %>

<%@ include file = "function.jsp"%>	
<%
String user = (String) session.getAttribute("user");
String pass = (String) session.getAttribute("pass");
String admin = (String) session.getAttribute("admin");

	database db = new database(application.getRealPath("WEB-INF/db.mdb")); //memanggil been db
	if(db.cekLogin(user,pass))//mengecek login
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
		tanggal date = new tanggal();//memanggil been tanggal
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
	if(admin.equals("1.0"))//mengecek admin
	{
	
	
	
	%>
	    <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="9%" height="36" bgcolor="#CCCCCC"><p align="center">id <br />
              Booking </p>            </td>
            <td width="22%" bgcolor="#CCCCCC"> <div align="center">Tanggal<br />
            Booking </div></td>
            <td width="11%" bgcolor="#CCCCCC"><div align="center">Event</div></td>
            <td width="14%" bgcolor="#CCCCCC"><div align="center">Team</div></td>
            <td width="13%" bgcolor="#CCCCCC"><div align="center">Service</div></td>
            <td width="11%" bgcolor="#CCCCCC"><div align="center">user</div></td>
            <td width="10%" bgcolor="#CCCCCC"><div align="center">Harga</div></td>
            <td width="10%" bgcolor="#CCCCCC"><div align="center">Discount</div></td>
          </tr>
		  
		  <%
		    String da  = request.getParameter("num");
		    String idEvent = request.getParameter("event");
	  		String idTeam = request.getParameter("team");
	        String tanggal = request.getParameter("tanggal");
	        String username = request.getParameter("user");
			
			 String prev = request.getParameter("num1");
	  		 int cek=0;
			 
			  paging d = new paging(da); // mengecek admin
	  		  if(da =="" || da ==null)
	  		  {
	 				response.sendRedirect("actionPage.jsp?event="+idEvent+"&team="+idTeam+"&tanggal="+tanggal+"&user="+username+"&error=Jumlah tampilan harus diisi");
	  		  }else if(d.cekNumber())
		  	  {
			  		response.sendRedirect("actionPage.jsp?event="+idEvent+"&team="+idTeam+"&tanggal="+tanggal+"&user="+username+"&error=Jumlah tampilan harus diisi dengan angka");
	  		
	 		   }else
	  		   {
			   
		  		String query = "";
				
				  d.setTotal(db.getJumlahHeaderBooking()); // mencari jumlah total query
				
						if(idEvent != "" && idEvent != null && !idEvent.equals("null")) // mengecek ata cari menurut event
							{
								query =query + " and b.idEvent = "+idEvent;
							}
		
						if(idTeam != "" && idTeam != null && !idTeam.equals("null"))// mengecek ata cari menurut team
							{
								query = query + " and b.idTeam  = "+idTeam ;
							}
		
						if(tanggal != "" && tanggal != null && !tanggal.equals("null")) // mengecek ata cari menurut tanggal
							{
								query = query + " and tanggal = "+tanggal.substring(0,tanggal.indexOf("-")) + " and month = "+tanggal.substring(tanggal.indexOf("-")+1,tanggal.lastIndexOf("-")-tanggal.indexOf("-")+1)+" and year ="+tanggal.substring(tanggal.length()-4,8) ;
							}
		
							if(username != "" && username != null && !username.equals("null"))
							{
									query =query + "  and username = '"+username+"'" ;
							}
							
							
							//memanggil been viewBooking
							
							
				ArrayList booking = db.viewBooking("select top "+d.getData(prev)+"  b.idBooking,tanggal,month,year,namaTeam,namaEvent,c.username from ms_header_Booking b, ms_login c, ms_event d, ms_team e where  b.idUser = c.idUser and b.idEvent = d.idEvent and e.idTeam = b.idTeam "+query +"");
				Iterator iterator1 = booking.iterator();
	
				while(iterator1.hasNext()) 
				{
					HeaderBooking bkg = (HeaderBooking) iterator1.next();
				
					if(d.cekDat(prev,cek))
					{
		  %>
          <tr>
            <td height="38">
			  <div align="center">
			    <%
				out.print(bkg.getidBooking());
			%>
            </div></td>
            <td>
			  <div align="center">
			    <%
	  		out.print(bkg.gettanggal()+" - "+dat[bkg.getmonth()]+" - "+bkg.getyear());
	  		 %>
	          </div></td>
            <td> 
			  <div align="center">
			    <%
	  			out.print(bkg.getevent());
	  		%>
	          </div></td>
            <td> 
			  <div align="center">
			    <%
	  			out.print(bkg.getteam());
	 		 %>
	          </div></td>
            <td><div align="left"><%=service(bkg.getidBooking())%></div></td>
            <td>
			  <div align="center">
			    <%
				out.print(bkg.getusername());
			%>
	          </div></td>
            <td><div align="center">
			<%
			out.print(TotalHarga(bkg.getidBooking()));
			%>
			</div></td>
            <td><div align="center"><br />
				
              <form id="form1" name="form1" method="post" action="./insertDiscount">
			  	<input name="idBooking" type="hidden" id="num" value="<%=bkg.getidBooking()%>" />
			  	<input name="num" type="hidden" id="num" value="<%=da%>" />
				<input name="num1" type="hidden" id="num1" value="<%=prev%>" />
			   	<input name="idEvent" type="hidden" id="num" value="<%=idEvent%>" />
	  			<input name="idTeam" type="hidden" id="num" value="<%=idTeam%>" />
	  			<input name="tanggal" type="hidden" id="num" value="<%=tanggal%>" />
	  			<input name="user" type="hidden" id="num" value="<%=username%>" />
                <input type="submit" name="Discount" value="Discount 20%" />
              </form>
              </div></td>
          </tr>
          <tr>
            <td height="13">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
		  <%
		  			}
					cek++;
		  
		  		}
		  %>
        </table>
    <%
	
		 
				 out.print(d.pageTree("transaction.jsp?event="+idEvent+"&team="+idTeam+"&tanggal="+tanggal+"&user="+username+"&"));
		  }
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