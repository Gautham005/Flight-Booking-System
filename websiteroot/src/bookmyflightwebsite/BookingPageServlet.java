package bookmyflightwebsite;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BookingPageServlet
 */
@WebServlet(
		name = "BookingPageServlet",
		urlPatterns = "/book"
		)
public class BookingPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession s = request.getSession(false);
		if(s==null || s.getAttribute("user")==null) {
			response.sendRedirect("login.jsp");
		}
		else {
			String temp = (String)request.getParameter("flight");
			String arr[] = temp.split("_");
			dbConnector db = new dbConnector();
			db.connect();
			int price = Integer.parseInt(arr[1]) * db.getPrice(arr[0]);
			request.setAttribute("price", price);
			request.setAttribute("count", Integer.parseInt(arr[1]));
			request.setAttribute("wallet", db.getBalance((String)s.getAttribute("user")));
			request.setAttribute("date", arr[2]);
			request.setAttribute("flightno", arr[0]);
			request.getRequestDispatcher("BookingConfirmation.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int i=0;
		HttpSession s = request.getSession(false);
		if(s==null || s.getAttribute("user")==null) {
			response.sendRedirect("login.jsp");
		}
		ArrayList<String> name = new ArrayList<>();
		ArrayList<String> dob = new ArrayList<>();
		ArrayList<String> gender = new ArrayList<>();
		
		while(request.getParameter("pname"+i)!=null) {
			log(request.getParameter("pname"+i));
			name.add((String) request.getParameter("pname"+i));
			dob.add((String) request.getParameter("dob"+i));
			gender.add((String) request.getParameter("gender"+i));
			i++;
		}
		dbConnector db = new dbConnector();
		db.connect();
		String date = request.getParameter("date");
		String price = request.getParameter("price");
		String flight_no = request.getParameter("flightno");
		log(flight_no);
		int bid = db.createBooking(name, dob, gender, Integer.parseInt(price), (String)s.getAttribute("user"), date, flight_no);
		response.sendRedirect("bookConfirmed?id="+bid);

	}

}
