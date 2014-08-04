package bean;



//class been yang menampilkan data event
public class event {

	private int idEvent;
	private String namaEvent;
	private String keterangan;


public event() {}

	public event(int idEvent, String namaEvent , String keterangan ) {
		this.idEvent = idEvent;
		this.namaEvent = namaEvent;
		this.keterangan = keterangan;

	}

	public int getidevent()
	{
		return idEvent;
	}

	public String getevent()
	{
		return namaEvent;
	}


	public String getketerangan()
	{
			return keterangan;
	}


	public void setidevent(int a)
	{
		idEvent = a;
	}
	public void setevent(String a)
	{
		namaEvent = a;
	}

	public void setketerangan(String a)
	{
		keterangan = a;
	}

}
