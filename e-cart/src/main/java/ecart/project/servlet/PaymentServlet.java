package ecart.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import ecart.project.connection.ConnectionPro;
import ecart.project.dao.PaymentDao;
import ecart.project.dao.UserDatabase;
import ecart.project.model.Payment;
import ecart.project.model.User;

/**
 * Servlet implementation class PaymentServlet
 */
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void paymentRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet PaymentServlet</title>");
			out.println("</head>");
			out.println("<body>");

			int cardno = Integer.parseInt(request.getParameter("cardno"));
			String validity = request.getParameter("validity");
            int cvv = Integer.parseInt(request.getParameter("cvv"));
            String name = request.getParameter("name");
			// make user object
			Payment paymentModel = new Payment(cardno, validity, cvv,name);

			// create a database model
			PaymentDao regPayment = new PaymentDao(ConnectionPro.getConnection());
			if (regPayment.savePayment(paymentModel)) {
				response.sendRedirect("login.jsp");
			} else {
				String errorMessage = "User Available";
				HttpSession regSession = request.getSession();
				regSession.setAttribute("RegError", errorMessage);
				response.sendRedirect("cart.jsp");
			}

			out.println("</body>");
			out.println("</html>");
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		paymentRequest(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		paymentRequest(request, response);
	}

}
