package bean;

import java.util.*;
import java.io.*;


//class yang menyimpan data pagging
public class paging{

String data;
Integer jumlahPage;
Integer jml;
Integer Total;



	public paging(String a){
	 data = a;

	}

	public boolean cekNumber()
	{

		try
		{
		jumlahPage = Integer.parseInt(data);
		return false;
		}catch(Exception e)
		{
			return true;
		}
	}


	public Integer getData(String a)
	{
		Integer y;

				try
				{

				y = Integer.parseInt(a);
				jml = y * jumlahPage;

				return jml;

				}catch(Exception e)
				{
					return jumlahPage;
				}

	}




	public void setTotal(int Jumlah)
	{
		Total = Jumlah;
	}

	public Integer getTotal()
	{
		return Total;
	}



	public boolean cekDat(String a,int b)
	{
		Integer y;
		Integer P;
				try
				{

				y = Integer.parseInt(a);
				P = (y-1) * jumlahPage;

				if(b>=P) return true;
				else return false;

				}catch(Exception e)
				{
					return true;
				}
	}



	public String pageTree(String link)
	{

		Integer k = 1;
		Integer i;



		String isi = "<table  border='0' cellpadding='1' cellspacing='1'><tr><td width='49' bgcolor='#CCCCCC' align='center'>Paging</td>";

		for(i=1;i<=Total;i = i+jumlahPage)
		{
		   isi +="<td width='20'><a href='"+link+"num="+jumlahPage+"&num1="+k+"'>"+k+"</a></td>";
		   k++;
		}

		isi +="</tr></table>";

		return isi;
	}


}
