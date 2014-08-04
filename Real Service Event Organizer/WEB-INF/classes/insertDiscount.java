import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.database;


// class untuk melakukan insert discount
public class insertDiscount extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		HttpSession session = request.getSession();
		ServletContext application = getServletContext();

		String idBooking = request.getParameter("idBooking");
		String idEvent = request.getParameter("event");
	    String idTeam = request.getParameter("team");
	    String tanggal = request.getParameter("tanggal");
	    String username = request.getParameter("user");
		String da  = request.getParameter("num");
		String prev = request.getParameter("num1");

		if(idBooking != "" && idBooking != null && !idBooking.equals("null") )
		{
			database db = new database (application.getRealPath("WEB-INF/db.mdb"));
			if(db.InsertDiscount(idBooking))
			{
				response.sendRedirect("transaction.jsp?event="+idEvent+"&team="+idTeam+"&tanggal="+tanggal+"&user="+username+"&num="+da+"&num1="+prev+"");
			}
		}



	}
}