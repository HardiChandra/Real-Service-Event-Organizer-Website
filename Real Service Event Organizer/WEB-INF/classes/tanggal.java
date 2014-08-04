package bean;

import java.util.*;
import java.io.*;


//class been yang bertugas menyimpan tanggal
public class tanggal{

String hari;

public tanggal(){
	 hari = "belum ada";

	}

	public String getHari()
	{
	Date tgl;
	int jam;
	tgl = new Date();

	jam = tgl.getHours();
	if(jam <= 11 && jam >= 3 ) hari = "Pagi";
	else if(jam == 12 ) hari = "Siang";
	else if(jam > 12 || jam < 3 ) hari = "Malam";

	return hari;
	}

	public boolean cekDateValid(int date,int month,int year)
	{
		long  i = 0;
		long  j = 0;
		Date tgl;

		Date tanggal = new Date();
		tanggal.setDate(date);
		tanggal.setMonth(month);
		tanggal.setYear(year-1900);

		tgl = new Date();

		j =  (tanggal.getTime() - tgl.getTime() )/86400000;

		if(j > 20)
		{
			return true;
		}else
		{
			return false;
		}
	}


}
