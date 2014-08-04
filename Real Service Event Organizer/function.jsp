



<%!
//merupakan fungsi service untuk memuncurkan service yang ada menurut idBooking
public String  service(int idBooking)
{

String dat = " ";
ServletContext application = getServletContext();

	database db = new database(application.getRealPath("WEB-INF/db.mdb")); 

	ArrayList bg  = db.viewDetailBooking("select idBooking,service from ms_detail_Booking b,ms_service a  where a.idservice = b.idservice and  idBooking = "+idBooking);
		
		 Iterator h  = bg.iterator();
		
		while(h.hasNext()) 
		{
		 DetailBooking ba = (DetailBooking) h.next();
		
		 dat = dat + "<li>"+ ba.getservice() + " </li><br>";
		}
		 dat = dat + "";
		return dat;
}
%>



<%!
//merupakan fungsi portofolio untuk memuncurkan portofolio yang ada menurut idTeam
public String  portofolio(int idTeam)
{

	
	String[] d = new String[12];
d[0] = "Januari";
d[1] = "Febuari";
d[2] = "Maret";
d[3] = "April";
d[4] = "Mei";
d[5] = "Juni";
d[6] = "Juli";
d[7] = "Agustus";
d[8] = "September";
d[9] = "Oktober";
d[10] = "November";
d[11] = "Desember";


String dat = " ";
ServletContext application = getServletContext();

	database db = new database(application.getRealPath("WEB-INF/db.mdb")); 

	ArrayList bg  = db.viewPortofolio("select  a.idPortofolio,a.idBooking,tanggal,month,year,namaEvent,username from ms_portofolio a,ms_header_Booking b, ms_team c ,ms_login d, ms_event e where a.idBooking = b.idBooking and a.idTeam = c.idTeam and d.idUser = b.idUser and e.idEvent = b.idEvent and c.idTeam = "+idTeam);
		
		 Iterator h  = bg.iterator();
		
		while(h.hasNext()) 
		{
		Portofolio ba = (Portofolio) h.next();
		
		 dat = dat + " <tr><td width='27%' height='27'><div align='center'>"+ ba.getusername()+"</div></td><td width='25%'><div align='center'>"+ ba.getdate() +" - "+d[ba.getmonth()]+ " - "+ba.getyear()+"</div></td><td width='23%'><div align='center'>"+ba.getevent()+"</div></td><td width='25%'><div align='left'>"+service(ba.getidBooking())+"</div></td></tr>";
		}
		 dat = dat + "";
		return dat;
}
%>


<%!
//merupakan fungsi untuk memunculkan harga
public int TotalHarga(int idBooking)
{
int a = 0;
int b;
ServletContext application = getServletContext();

	database db = new database(application.getRealPath("WEB-INF/db.mdb")); 

	a = db.Harga(idBooking);
		
		ArrayList bg = db.viewDiscount("select * from Discount where idBooking = "+idBooking); 
		
		 Iterator h  = bg.iterator();
		
		while(h.hasNext()) 
		{
		Discount ba = (Discount) h.next();
		
		b = (int) ba.Discount() * a / 100;
		
		a = a - b;
		}
		 
		return a;
}
%>


