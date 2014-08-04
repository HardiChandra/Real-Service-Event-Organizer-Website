package bean;


//class been yang bertugas menyimpan data portofolio

public class Portofolio {

	private int idPortofolio;
	private int idBooking;
	private int date;
	private int month;
	private int year;
	private String event;
	private String username;



public Portofolio() {}

	public Portofolio(int idPortofolio,int idBooking,int date,int month,int year,String event,String username) {
		this.idPortofolio = idPortofolio;
		this.idBooking = idBooking;
		this.date = date;
		this.month = month;
		this.year = year;
		this.event = event;
		this.username = username;

	}

	public int getidPortofolio()
	{
		return idPortofolio;
	}

	public int getidBooking()
	{
			return idBooking;
	}

	public int getdate()
	{
			return date;
	}

	public int getmonth()
	{
			return month;
	}

	public int getyear()
	{
		return year;
	}


	public String getevent()
	{
			return event;
	}


	public String getusername()
	{
				return username;
	}


	public void setidPortofolio(int a)
	{
		idPortofolio = a;
	}


	public void setidBooking(int a)
	{
			idBooking = a;
	}

	public void setdate(int a)
	{
			date = a;
	}

	public void setmonth(int a)
	{
			month= a;
	}

	public void setyear(int a)
	{
			year= a;
	}

	public void setevent(String a)
	{
			event = a;
	}

	public void setusername(String a)
		{
				username = a;
	}


}
