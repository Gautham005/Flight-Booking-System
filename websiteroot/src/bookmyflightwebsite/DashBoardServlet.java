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
 * Servlet implementation class DashBoardServlet
 */
@WebServlet(
		name = "DashBoardServlet",
		urlPatterns = "/dash"
		)
public class DashBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashBoardServlet() {
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
			String username  = (String) s.getAttribute("user");
			dbConnector db = new dbConnector();
			db.connect();
			ArrayList<String> bookings = db.getBookingHistory(username);
			ArrayList<String> transactions = db.getTransactionHistory(username);
			String userdetails = db.getUserDetails(username);
			int balance = db.getBalance(username);
			request.setAttribute("bookings", bookings);
			request.setAttribute("transactions", transactions);
			request.setAttribute("userd", userdetails);
			request.setAttribute("balance", balance);
			
			request.getRequestDispatcher("dashboard.jsp").forward(request, response);
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
