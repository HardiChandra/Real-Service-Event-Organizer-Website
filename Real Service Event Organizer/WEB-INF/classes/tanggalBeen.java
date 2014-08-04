package bean;


// class been yang bertugas menyimpan data tanggal

import java.io.*;

public class tanggalBeen{

	private int date;
	private int month;
	private int year;
	private String mesage;
	private boolean ceking;


public tanggalBeen() {}

	public tanggalBeen(String date, String year, String month ) {

		try
		{
		this.date = Integer.parseInt(date);
		this.month = Integer.parseInt(month);
		this.year= Integer.parseInt(year);
		}catch(Exception e)
		{
			this.date = 0;
			this.month = 0;
			this.year= 0;
		}
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

	public String getmesage()
	{
			return mesage;
	}


	public boolean getceking()
	{
		return ceking;
	}




	public void cekDate()
	{
			if(date == 0)
				{
					mesage = "index.jsp?error=Date harus dipilih";
					ceking = true;
				}else if(month == 0)
				{
					mesage ="index.jsp?error=month harus dipilih";
					ceking = true;
				}else if(year == 0)
				{
					mesage ="index.jsp?error=year harus dipilih";
					ceking = true;
				}else if(month == 2 && (year % 4)==0 && date > 29)
					{
						mesage ="index.jsp?error=untuk bulan febuary tahun "+ year +" tidak ada hari "+date;
						ceking = true;
					}else if (month == 2 && year % 4!=0 && date > 28)
					{
						mesage ="index.jsp?error=untuk bulan febuary tahun "+ year +" tidak ada hari "+date;
						ceking = true;
					}else if( month != 2 && month % 2 == 0 && month < 8 && date > 30)
					{
						mesage ="index.jsp?error=untuk bulan "+month+" tahun "+ year +" tidak ada hari "+date;
						ceking = true;
					}else if(month != 2 && month % 2 != 0 && month < 8 && date > 30)
					{
						mesage ="index.jsp?error=untuk bulan "+month+"tahun "+ year +" tidak ada hari "+date;
						ceking = true;
					}else
					{
						ceking = false;
					}

	}




	public void setdate (int a)
	{
		date  = a;
	}
	public void setmonth(int a)
	{
		month = a;
	}
	public void setyear(int a)
	{
		year = a;
	}

}