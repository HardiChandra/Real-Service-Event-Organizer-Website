package bean;

import java.util.*;
import java.sql.*;
import java.text.*;
import java.lang.*;



// class untuk melakukan koneksi dengan database dan melakukan segala akses yang menyangkut database
public class database{

	ArrayList dat = new ArrayList();
	String path;
	Connection con;
	Statement stmt;

	public database(String a)
	{
		path = a;
	}

	private void connectDB()
	{
		try
		{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con = DriverManager.getConnection("jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="+path);
			stmt = con.createStatement();
		}
		catch(Exception e)
		{


		}
	}




//melakukan update date/ tanggal bulan tahun
public boolean UpdateDate(String date , String month,String year,String idBooking)
		{
			try
			{
				connectDB();

				stmt.executeUpdate("update ms_header_Booking set tanggal ="+date+", month = "+month+", year = "+year+" where idBooking = "+idBooking+"");

				con.close();

				return true;

			}catch (Exception e) {

				return false;

				}
		}


	//mendapatkan status
	public String getAdmin(String username , String password)throws Exception
		{
			connectDB();
			String id;
			ResultSet rs = stmt.executeQuery("select admin from ms_login where username = '"+username+"' and password = '"+password+"'");
			if(rs.next())
			{

				id = rs.getString("admin");


				con.close();
				return id;
			}
			else
			{
				con.close();
				return null;
			}

		}



			public Integer getJumlahHeaderBooking()
				{
					Integer id;
								try
								{
								connectDB();

								ResultSet rs = stmt.executeQuery("select count(*) as jumlah from ms_header_Booking ");

									if(rs.next())
									{

										id = rs.getInt("jumlah");

										con.close();
										return id;
									}

								return 0;


								}catch (Exception e) {

									return 0;
								}

				}




				public Integer getJumlahEvent()
				{
					Integer id;
								try
								{
								connectDB();

								ResultSet rs = stmt.executeQuery("select count(*) as jumlah from ms_Event");

									if(rs.next())
									{

										id = rs.getInt("jumlah");

										con.close();
										return id;
									}

								return 0;


								}catch (Exception e) {

									return 0;
								}

				}


				public Integer getJumlahBooking(String idTeam)
				{
				try
				{
				connectDB();
				Integer id;
				ResultSet rs = stmt.executeQuery("select count(*) as jumlah from ms_header_Booking where idTeam ="+idTeam);
				if(rs.next())
				{

					id = rs.getInt("jumlah");


					con.close();
					return id;
				}
				else
				{
					con.close();
					return 0;
				}

				}catch (Exception e) {

					return 0;
				}

				}



			public Integer getJumlahService()
			{
				try
				{
				connectDB();
				Integer id;
				ResultSet rs = stmt.executeQuery("select count(*) as jumlah from ms_service");
				if(rs.next())
				{

					id = rs.getInt("jumlah");


					con.close();
					return id;
				}
				else
				{
					con.close();
					return 0;
				}

				}catch (Exception e) {

					return 0;
				}

			}


		//mendapatkan jumlah pengunjung
		public String getJumlah()
			{
				try
				{
				connectDB();
				String id;
				ResultSet rs = stmt.executeQuery("select count(*) as jumlah from ms_login where login = 1");
				if(rs.next())
				{

					id = rs.getString("jumlah");


					con.close();
					return id;
				}
				else
				{
					con.close();
					return null;
				}

				}catch (Exception e) {

					return null;
				}

			}



	//melakukan insert ke register
		public void UpdateLogin(String username , String password,String status)
		{
			try
			{
				connectDB();
				if(status.equals("login"))
				{

			stmt.executeUpdate("update ms_login set login = 1 where username = '"+username+"' and password = '"+password+"'");

			con.close();

				}else
				{
					stmt.executeUpdate("update ms_login set login = 0 where username = '"+username+"' and password = '"+password+"'");

					con.close();
				}
			}catch (Exception e) {


				}
		}


	//melakukan insert ke register
	public void InsertRegister(String nama, String email, String gender, String username , String password)throws Exception
		{
			connectDB();
			PreparedStatement ps = con.prepareStatement("insert into ms_login (nama,email,jeniskelamin,username,password,admin) values (?,?,?,?,?,0) ");
			ps.setString(1,nama);
			ps.setString(2,email);
			ps.setString(3,gender);
			ps.setString(4,username);
			ps.setString(5,password);
			ps.executeUpdate();


			con.close();
		}




		public boolean InsertDiscount(String idBooking)
		{
			Integer i = 20;
			try
			{
			connectDB();
			PreparedStatement ps = con.prepareStatement("insert into discount (idBooking,discount) values (?,?) ");
			ps.setString(1,idBooking);
			ps.setInt(2,i);
			ps.executeUpdate();


			con.close();
			return true;
			}catch (Exception e) {
					return false;

			}
		}



		public boolean InsertBookingHeader(String date,String month, String year,String user, String idTeam, String idEvent)
		{
			try
			{
					connectDB();
					PreparedStatement ps = con.prepareStatement("insert into ms_header_Booking (tanggal,month,year,idTeam,idEvent,idUser) values (?,?,?,?,?,?) ");
					ps.setString(1,date);
					ps.setString(2,month);
					ps.setString(3,year);
					ps.setString(4,idTeam);
					ps.setString(5,idEvent);
					ps.setString(6,user);
					ps.executeUpdate();


					con.close();
					return true;

			}catch (Exception e) {
					return false;

			}
		}



		public String getIdUser(String user)
		{
			String id;
			try
			{
				connectDB();
				ResultSet rs = stmt.executeQuery("select idUser from ms_login where username = '"+user+"'");
				rs.next();


				id = rs.getString("idUser");
				con.close();
				return id;

			}catch (Exception e) {
				return null;

			}
		}



		public Integer getIdBooking()
		{
		Integer idBooking = 0;
			try
			{
					connectDB();

					ResultSet rs1= stmt.executeQuery("select idBooking from ms_header_Booking order by idBooking desc");

					rs1.next();

					idBooking = rs1.getInt("idBooking");

						con.close();
						return idBooking;

			}catch (Exception e) {

				return 0;

			}
		}





		public Integer Harga(int a)
		{
			Integer totalHarga = 0;
			try
			{
				connectDB();

				ResultSet rs1= stmt.executeQuery("select harga from ms_service a, ms_detail_Booking b where a.idService = b.idService and idBooking = "+a);

				while(rs1.next())
				{
					totalHarga = totalHarga + rs1.getInt("harga");
				}

				return totalHarga;
			}catch (Exception e) {

				return 0;

			}

		}



		public boolean InsertBookingDetail(String idService,int idBooking)
				{
					try
					{
							connectDB();
							PreparedStatement ps = con.prepareStatement("insert into ms_detail_Booking (idBooking,idService) values (?,?) ");
							ps.setInt(1,idBooking);
							ps.setString(2,idService);
							ps.executeUpdate();


							con.close();
							return true;

					}catch (Exception e) {
							return false;
					}
				}



		public void InsertPortfolio(int idBooking, String idTeam)
				{
							try
							{
									connectDB();
									PreparedStatement ps = con.prepareStatement("insert into ms_portofolio (idBooking,idTeam) values (?,?) ");
									ps.setInt(1,idBooking);
									ps.setString(2,idTeam);
									ps.executeUpdate();


									con.close();


							}catch (Exception e) {

							}
				}


		//melakukan cek login
		public boolean cekLogin(String username , String password)
		{
		connectDB();
		String user;
		String pass;
		try
		{
		ResultSet rs = stmt.executeQuery("select username,password from ms_login where username = '"+username+"' and password = '"+password+"'");
		if(rs.next())
		{

			user = rs.getString("username");
			pass = rs.getString("password");

			if(user.equals(username) && pass.equals(password))
			{
			con.close();
			return true;
			}else
			{
			con.close();
			return false;
			}
		}
		else
		{
			con.close();
			return false;
		}

		}catch (Exception e) {
			return false;
		}
	}




public ArrayList viewDiscount(String query)
		{
			dat.clear();
			connectDB();
			try {
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
					Discount sp = new Discount(rs.getInt(1),rs.getInt(2),rs.getInt(3));
					dat.add(sp);
				}
				con.close();
				return dat;
			} catch (Exception e) {
				return null;
			}
		}


public ArrayList viewEvent(String query)
		{
			dat.clear();
			connectDB();
			try {
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
					event sp = new event(rs.getInt(1),rs.getString(2),rs.getString(3));
					dat.add(sp);
				}
				con.close();
				return dat;
			} catch (Exception e) {
				return null;
			}
		}


public ArrayList viewTeam(String query)
	{
		dat.clear();
		connectDB();
		try {
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				team sp = new team(rs.getInt(1),rs.getString(2),rs.getString(3));
				dat.add(sp);
			}
			con.close();
			return dat;
		} catch (Exception e) {
			return null;
		}
	}


public ArrayList viewService(String query)
	{
		dat.clear();
		connectDB();
		try {
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				service sp = new service(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
				dat.add(sp);
			}
			con.close();
			return dat;
		} catch (Exception e) {
			return null;
		}
	}



	public ArrayList viewBooking(String query)
		{
			dat.clear();
			connectDB();
			try {
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
					HeaderBooking sp = new HeaderBooking(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getString(7));
					dat.add(sp);
				}
				con.close();
				return dat;
			} catch (Exception e) {
				return null;
			}
		}




	public ArrayList viewDetailBooking(String query)
		{
			dat.clear();
			connectDB();
			try {
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
					DetailBooking sp = new DetailBooking(rs.getInt(1),rs.getString(2));
					dat.add(sp);
				}
				con.close();
				return dat;
			} catch (Exception e) {
				return null;
			}
		}



public ArrayList viewPortofolio(String query)
		{
			dat.clear();
			connectDB();
			try {
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
					Portofolio sp = new Portofolio(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getInt(5),rs.getString(6),rs.getString(7));
					dat.add(sp);
				}
				con.close();
				return dat;
			} catch (Exception e) {
				return null;
			}
		}


















		public boolean DeleteTeam(String idTeam)
		{

					connectDB();




				try {
					connectDB();
						stmt.executeUpdate("DELETE FROM ms_team WHERE idTeam = "+idTeam);
						con.close();
				return true;
				} catch (Exception e) {
						return false;
				}




		}





		public boolean DeleteEvent(String idEvent)
		{

							connectDB();




						try {
							connectDB();
								stmt.executeUpdate("DELETE FROM ms_Event WHERE idEvent = "+idEvent);
								con.close();
						return true;
						} catch (Exception e) {
								return false;
						}




		}





		public boolean DeleteBooking(String booking)
		{
			try {
					connectDB();
						stmt.executeUpdate("DELETE FROM ms_header_Booking WHERE idBooking = "+booking);
						stmt.executeUpdate("DELETE FROM ms_detail_Booking WHERE idBooking = "+booking);
						stmt.executeUpdate("DELETE FROM discount WHERE idBooking = "+booking);
						stmt.executeUpdate("DELETE FROM ms_portofolio WHERE idBooking = "+booking);
				return true;
				} catch (Exception e) {
						return false;
				}
		}


		public boolean cekUsername(String username)throws Exception
		{
			connectDB();
			String user;
			String pass;
				ResultSet rs = stmt.executeQuery("select * from ms_login where username = '"+username+"' ");
				if(rs.next())
				{

					con.close();
					return true;

				}else
				{
					con.close();
					return false;
				}

		}




		public boolean InsertTeam(String namaTeam,String Description)
						{
							try
							{
									connectDB();
									PreparedStatement ps = con.prepareStatement("insert into ms_team (namaTeam,Keterangan) values (?,?) ");
									ps.setString(1,namaTeam);
									ps.setString(2,Description);
									ps.executeUpdate();


									con.close();
									return true;

							}catch (Exception e) {
									return false;
							}
				}


		public boolean InsertEvent(String namaEvent,String Description)
			{
									try
									{
											connectDB();
											PreparedStatement ps = con.prepareStatement("insert into ms_Event (namaEvent,Keterangan) values (?,?) ");
											ps.setString(1,namaEvent);
											ps.setString(2,Description);
											ps.executeUpdate();


											con.close();
											return true;

									}catch (Exception e) {
											return false;
									}
			}



			public boolean InsertService(String namaService,String Description,String harga)
			{
												try
												{
														connectDB();
														PreparedStatement ps = con.prepareStatement("insert into ms_service (Service,Deskripsi,Harga) values (?,?,?) ");
														ps.setString(1,namaService);
														ps.setString(2,Description);
														ps.setString(3,harga);
														ps.executeUpdate();


														con.close();
														return true;

												}catch (Exception e) {
														return false;
												}
			}



			public boolean cekInteger(String data)
			{
				int a;
				try
				{
					a=Integer.parseInt(data);
					return true;
				}catch (Exception e) {
					return false;
				}
			}


}