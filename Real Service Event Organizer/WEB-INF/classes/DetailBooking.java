package bean;



//class been yang bertugas menampilkan data detailbookingan
public class DetailBooking {

	private int idBooking;
	private String service;


public DetailBooking() {}

	public DetailBooking(int idBooking,String service) {
		this.idBooking = idBooking;
		this.service = service;
	}

	public int getidBooking()
	{
		return idBooking;
	}



	public String getservice()
	{
			return service;
	}


	public void setidBooking(int a)
	{
		idBooking = a;
	}

	public void setservice(String a)
	{
		service = a;
	}



}
