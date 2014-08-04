import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.database;
import bean.service;

// class untuk menangani pembookingan dari user
public class booking extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		Integer i,j,n;

		HttpSession session = request.getSession();
		ServletContext application = getServletContext();

		PrintWriter out =  response.getWriter ();
		database db = new database (application.getRealPath("WEB-INF/db.mdb"));

		String[] dat = new String[db.getJumlahService()+1];
		String[] data = new String[db.getJumlahService()+1];

		String tanggal = request.getParameter("date");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		String idEvent = request.getParameter("event");
		String idTeam = request.getParameter("team");
		String user = (String) session.getAttribute("user");



		ArrayList service = db.viewService("select * from ms_service");
		Iterator iteratorSvc = service.iterator();

		j=-1;
		n=0;
		for(i=0;i<db.getJumlahService();i++)
		{

			service svc = (service) iteratorSvc.next();
			dat[i] = request.getParameter("checkbox"+svc.getidService());
			if(dat[i] != null)
			{
				j++;
				data[j] = dat[i];

			}


		}



		if(j == -1)
		{
			response.sendRedirect("service.jsp?date="+tanggal+"&year="+year+"&month="+month+"&team="+idTeam+"&event="+idEvent+"&error1=Service harus dipilih !!!");
		}else
		{
			if(db.InsertBookingHeader(tanggal,month,year,db.getIdUser(user),idTeam,idEvent))
			{


				for(i=0;i<=j;i++)
				{
					if(db.InsertBookingDetail(data[i],db.getIdBooking()))
					{
						n++;
					}
				}



				if(n != 0)
				{
					db.InsertPortfolio(db.getIdBooking(),idTeam);
					response.sendRedirect("viewHistory.jsp");
				}

			}else
			{
					response.sendRedirect("service.jsp?date="+tanggal+"&year="+year+"&month="+month+"&team="+idTeam+"&event="+idEvent+"&error1=Gagal melakukan insert !!!");
			}


		}



	}
}