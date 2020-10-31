package bookmyflightwebsite;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet(
		name = "SignUpServlet",
		urlPatterns = "/verify"
		)
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		dbConnector db = new dbConnector();
		db.connect();

		
		
		String username = request.getParameter("username");
		String password = request.getParameter("password1");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int v = db.createUser(username, password, name, email, phone);
		if(v==-1) {
			request.setAttribute("status", "1");
			RequestDispatcher view = request.getRequestDispatcher("signup.jsp");
			view.forward(request, response);
		}
		else if(v==-2) {
			request.setAttribute("status", "2");
			RequestDispatcher view = request.getRequestDispatcher("signup.jsp");
			view.forward(request, response);
		}
		else if(v==-3) {
			request.setAttribute("status", "3");
			RequestDispatcher view = request.getRequestDispatcher("signup.jsp");
			view.forward(request, response);
		}
		else if(v==1) {
			HttpSession session = request.getSession(true); // reuse existing
			session.setAttribute("user", username);
			session.setMaxInactiveInterval(1200);
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			view.forward(request, response);
		}
	}

}
