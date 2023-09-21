package com.fssa.creckettApp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.creckett.model.Turf;
import com.fssa.creckett.services.TurfService;
import com.fssa.creckett.services.exceptions.ServiceException;

/**
 * Servlet implementation class UpdateTurfServlet
 */
@WebServlet("/UpdateTurfServlet")
public class UpdateTurfServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int turfId = Integer.parseInt(request.getParameter("id"));
		RequestDispatcher patcher = null;

		try {
			Turf turf = new TurfService().getTurfObject(turfId);

			request.setAttribute("updateTurf", turf);

			patcher = request.getRequestDispatcher("/Pages/Turf/Pages/updateTurf.jsp");

		} catch (ServiceException e) {
			patcher = request.getRequestDispatcher("/Pages/Turf/Turf.jsp?error=Cannot update now come after some time");
		}

		patcher.forward(request, response);

	}

//	for updating - After getting the values from form
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String imageUrl = request.getParameter("image");
		String details = request.getParameter("message");
		int turfId = Integer.parseInt(request.getParameter("id"));

		Turf updatedTurf = new Turf(turfId, imageUrl, details);

		try {

			new TurfService().updateTurf(updatedTurf);

			response.sendRedirect(request.getContextPath() + "/ListTurfsList");

		} catch (ServiceException e) {
			RequestDispatcher patcher = request
					.getRequestDispatcher("/Pages/Turf/Pages/updateTurf.jsp?error=" + e.getMessage());
			request.setAttribute("updateTurf", updatedTurf);
			patcher.forward(request, response);
		}

	}

}
