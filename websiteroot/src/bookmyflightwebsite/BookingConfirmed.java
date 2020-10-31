package bookmyflightwebsite;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BookingConfirmed
 */
@WebServlet(
		name= "BookingConfirmed",
		urlPatterns = "/bookConfirmed"
		)
public class BookingConfirmed extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingConfirmed() {
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
			String b_id = request.getParameter("id");
			dbConnector db = new dbConnector();
			db.connect();
			ResultSet res = db.getBookingDetails(b_id);
			String fno;
			try {
				res.next();

				fno = res.getString("flight_no");
				String airline_name = db.getFlightName(fno);
				String source = db.getSource(fno);
				String destination = db.getDestination(fno);
				String date = res.getString("date_of_travel");
				String amount = res.getString("amount");
				String n = res.getString("no_of_travellers");
				request.setAttribute("airline", airline_name + "-" + fno);
				request.setAttribute("bid", b_id);
				request.setAttribute("source", source);
				request.setAttribute("destination", destination);
				request.setAttribute("date", date);
				request.setAttribute("no", n);
				request.setAttribute("amount", amount);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("bookingConfirmed.jsp").forward(request, response);

		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
