package com.fssa.creckettApp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.creckett.services.TurfService;
import com.fssa.creckett.services.exceptions.ServiceException;

/**
 * Servlet implementation class DeleteTurfServlet
 */
@WebServlet("/DeleteTurfServlet")
public class DeleteTurfServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int turfId = Integer.parseInt(request.getParameter("id"));

		try {

			new TurfService().deleteTurf(turfId);

			response.sendRedirect(request.getContextPath() + "/ListTurfsList");

		} catch (ServiceException e) {
			RequestDispatcher patcher = request
					.getRequestDispatcher("/Pages/Turf/Turf.jsp?error=Cannot delete now come after some time");
			patcher.forward(request, response);

		}

	}

}
