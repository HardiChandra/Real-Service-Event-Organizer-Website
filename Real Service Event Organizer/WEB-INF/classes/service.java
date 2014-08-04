package bean;



//class been yang bertugas menyimpan data service

public class service {

	private int idService;
	private String Service;
	private String Deskripsi;
	private String Harga;

public service() {}

	public service(int idService, String Service , String Deskripsi ,String Harga) {
		this.idService = idService;
		this.Service = Service;
		this.Deskripsi = Deskripsi;
		this.Harga = Harga;

	}

	public int getidService()
	{
		return idService;
	}

	public String getService()
	{
		return Service;
	}


	public String getDeskripsi()
	{
			return Deskripsi;
	}


	public String getHarga()
	{
				return Harga;
	}

	public void setidService(int a)
	{
		idService = a;
	}
	public void setService(String a)
	{
		Service = a;
	}

	public void setDeskripsi(String a)
	{
			Deskripsi = a;
	}


	public void setHarga(String a)
	{
				Harga = a;
	}


}
