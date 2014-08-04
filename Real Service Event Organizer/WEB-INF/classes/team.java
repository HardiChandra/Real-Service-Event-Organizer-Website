package bean;



//class been yang bertugas menyimpan data team
public class team {

	private int idteam;
	private String namaTeam;
	private String keterangan;


public team() {}

	public team(int idteam, String namaTeam , String keterangan ) {
		this.idteam = idteam;
		this.namaTeam = namaTeam;
		this.keterangan = keterangan;

	}

	public int getidteam()
	{
		return idteam;
	}

	public String getnamaTeam()
	{
		return namaTeam;
	}


	public String getketerangan()
	{
			return keterangan;
	}


	public void setidteam(int a)
	{
		idteam = a;
	}
	public void setnamaTeam(String a)
	{
		namaTeam = a;
	}

	public void setketerangan(String a)
	{
			keterangan = a;
	}

}
