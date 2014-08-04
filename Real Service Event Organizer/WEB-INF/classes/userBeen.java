package bean;



//class yang menyimpan data user
public class userBeen {

	private int idUser;
	private String nama;
	private String email;
	private int jeniskelamin;
	private String username;
	private String password;


public userBeen() {}

	public userBeen(int idUser, String nama,String email,int jeniskelamin,String username,String password ) {
		this.idUser = idUser;
		this.nama = nama;
		this.email = email;
		this.jeniskelamin = jeniskelamin;
		this.username = username;
		this.password = password;
	}

	public int getidUser()
	{
		return idUser;
	}
	public String getusername()
	{
		return username;
	}
	public String getnama()
	{
		return nama;
	}
	public String getemail()
	{
		return email;
	}
	public String getjeniskelamin()
	{

		if(jeniskelamin==1) return "Laki laki";
		else return "perempuan";
	}
	public String getpassword ()
	{
		return password ;
	}



	public void setnama(String a)
	{
		nama = a;
	}
	public void setusername(String a)
	{
		username= a;
	}
	public void setemail(String a)
	{
		email = a;
	}
	public void setjeniskelamin(int a)
	{
		jeniskelamin = a;
	}
	public void setpassword (String a)
	{
		password = a;
	}


}
