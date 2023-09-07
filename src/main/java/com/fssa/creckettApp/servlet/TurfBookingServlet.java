package com.fssa.creckettApp.servlet;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class TurfBookingServlet
 */
@WebServlet("/TurfBookingServlet")
public class TurfBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		User loggeduser = (User) session.getAttribute("loggedUser");

		if (loggeduser != null) {
			
			

			RequestDispatcher patcher = null;

			try {

				List<Turf> turfList  = new TurfService().turfList();
				request.setAttribute("turfList", turfList);

				patcher = request.getRequestDispatcher("getAllTurfList.jsp");

			} catch (ServiceException e) {
				patcher = request.getRequestDispatcher("getAllTurfList.jsp?error=" + e.getMessage());
			}

			patcher.forward(request, response);
			
			
		} else {
			response.sendRedirect("login.jsp?errorMessage=You need to login before booking the turf");
		}

	}

}
