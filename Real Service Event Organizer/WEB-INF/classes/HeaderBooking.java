package bean;



//class yang menyimpan data header booking
public class HeaderBooking {

	private int idBooking;
	private int tanggal;
	private int month;
	private int year;
	private String team;
	private String event;
	private String username;

public HeaderBooking() {}

	public HeaderBooking(int idBooking, int tanggal , int month ,int year, String team, String event, String username) {
		this.idBooking = idBooking;
		this.tanggal= tanggal;
		this.month = month;
		this.year = year;
		this.team = team;
		this.event = event;
		this.username = username;
	}

	public int getidBooking()
	{
		return idBooking;
	}

	public String getusername()
	{
			return username;
	}


	public int gettanggal()
	{
		return tanggal;
	}


	public int getmonth()
	{
			return month;
	}


	public int getyear()
	{
		return year;
	}


	public String getteam()
	{
		return team;
	}

	public String getevent()
	{
			return event;
	}


	public void setidBooking(int a)
	{
		idBooking = a;
	}
	public void settanggal(int a)
	{
		tanggal = a;
	}

	public void setmonth(int a)
	{
		month = a;
	}


	public void setyear(int a)
	{
		year = a;
	}


	public void setteam(String a)
	{
			team = a;
	}

	public void setevent(String a)
	{
			event = a;
	}


	public void getusername(String a)
	{
		username = a;
	}

}
