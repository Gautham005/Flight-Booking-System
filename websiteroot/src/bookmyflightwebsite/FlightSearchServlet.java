package bookmyflightwebsite;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FlightSearchServlet
 */
@WebServlet(
		name = "FlightSearchServlet",
		urlPatterns = "/search-results"
)
public class FlightSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String journey_date = request.getParameter("journey_date");
		String no_of_travellers = request.getParameter("no_of_travellers");
		dbConnector db = new dbConnector();
		db.connect();
		ArrayList<String> result = db.getFlight(source, destination, journey_date, Integer.parseInt(no_of_travellers));
		request.setAttribute("flights", result);
		request.setAttribute("date", journey_date);
		request.setAttribute("source", source);
		request.setAttribute("destination", destination);
		request.setAttribute("count", Integer.parseInt(no_of_travellers));
		RequestDispatcher view = request.getRequestDispatcher("flight_results.jsp");
		view.forward(request, response);
	}

}
