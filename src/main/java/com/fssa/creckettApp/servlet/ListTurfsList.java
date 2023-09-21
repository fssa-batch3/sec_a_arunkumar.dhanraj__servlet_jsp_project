package com.fssa.creckettApp.servlet;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class ListLoginUsersServlet
 */
@WebServlet("/ListTurfsList")
public class ListTurfsList extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Turf> turfList = null;

		RequestDispatcher patcher = null;

		try {

			turfList = new TurfService().turfList();
			request.setAttribute("turfList", turfList);

			patcher = request.getRequestDispatcher("Pages/Turf/Turf.jsp");

		} catch (ServiceException e) {
			patcher = request.getRequestDispatcher("Pages/Turf/Turf.jsp?error=Cannot show turf list");
		}

		patcher.forward(request, response);

	}

}
