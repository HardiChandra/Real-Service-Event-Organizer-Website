
package bean;



// class yang menyimpan data discount

public class Discount {

	private int idDiscount;
	private int idBooking;
	private int Discount;


public Discount() {}

	public Discount(int idDiscount, int idBooking , int Discount ) {
		this.idDiscount =idDiscount;
		this.idBooking = idBooking;
		this.Discount = Discount;

	}

	public int getidDiscount()
	{
		return idDiscount;
	}

	public int getidBooking()
		{
			return idBooking;
	}


	public int Discount()
	{
			return Discount;
	}


	public void setidDiscount(int a)
	{
		idDiscount = a;
	}
	public void setidBooking(int a)
	{
			idBooking= a;
	}

	public void setDiscount(int a)
	{
			Discount = a;
	}

}
