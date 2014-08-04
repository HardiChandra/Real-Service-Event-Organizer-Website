import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.database;


// class untuk melakukan insert Service
public class insertService extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		HttpSession session = request.getSession();
		ServletContext application = getServletContext();

		String NamaService = request.getParameter("namaService");
		String Keterangan = request.getParameter("serviceKeterangan");
		String harga = request.getParameter("harga");

			database db = new database (application.getRealPath("WEB-INF/db.mdb"));

		if(NamaService  == "" || NamaService == null)
		{
			response.sendRedirect("insert.jsp?error2=Nama Service harus diisi !!!");
		}else if(Keterangan == "" || Keterangan == null)
		{
			response.sendRedirect("insert.jsp?error2=Description harus diisi !!!");
		}else if(harga == "" || harga == null)
		{
			response.sendRedirect("insert.jsp?error2=Harga harus diisi !!!");
		}else if(!db.cekInteger(harga))
		{
			response.sendRedirect("insert.jsp?error2=Harga harus diisi dengan angka !!!");
		}else
		{


			if(db.InsertService(NamaService,Keterangan,harga))
			{
				response.sendRedirect("insert.jsp?error2=Berhasil melakukan insert Data Service");
			}else
			{
				response.sendRedirect("insert.jsp?error2=Gagal melakukan insert Data Service");
			}
		}



	}
}