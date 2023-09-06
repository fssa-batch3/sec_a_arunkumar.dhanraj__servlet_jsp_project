package com.fssa.creckettApp.servlet;

import java.io.IOException;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.creckett.model.Turf;
import com.fssa.creckett.model.User;
import com.fssa.creckett.services.TurfService;
import com.fssa.creckett.services.exceptions.ServiceException;

/**
 * Servlet implementation class CreateTurfServlet
 */
@WebServlet("/CreateTurfServlet")
public class CreateTurfServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		String image = request.getParameter("image");
		String message = request.getParameter("message");

		HttpSession session = request.getSession();

		User createdBy = (User) session.getAttribute("loggedUser");

		Turf turf = new Turf(image, message);
		turf.setCreatedBy(createdBy);

		TurfService host = new TurfService();

		try {
			host.hostTurf(turf);
			response.sendRedirect("ListTurfsList");
		} catch (ServiceException e) {
			
			RequestDispatcher patcher= request.getRequestDispatcher("createTurf.jsp?error="+e.getMessage());
			patcher.forward(request, response);
			
		}

	}

}
