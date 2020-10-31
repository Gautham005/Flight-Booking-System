package bookmyflightwebsite;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(
		name = "LoginServlet",
		urlPatterns = "/authenticate"
	)
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


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

		
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Boolean val = db.authenticateUser(username, password);
		request.setAttribute("status", val);
		if(val==true) {
			HttpSession session = request.getSession(true); // reuse existing
			if(request.getParameter("rememberMe")!=null) {
				Cookie usern = new Cookie("username", username);
				Cookie pass = new Cookie("password", password);
				usern.setMaxAge(12000);
				pass.setMaxAge(12000);
				response.addCookie(usern);
				response.addCookie(pass);
			}
			
			session.setAttribute("user", username);
			session.setMaxInactiveInterval(1200);
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			view.forward(request, response);
		}
		else {
			RequestDispatcher view = request.getRequestDispatcher("login.jsp");
			view.forward(request, response);
		}
	}

}
