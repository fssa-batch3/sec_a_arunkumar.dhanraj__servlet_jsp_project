package com.fssa.creckettApp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class DeleteTurfServlet
 */
@WebServlet("/DeleteTurfServlet")
public class DeleteTurfServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		int turfId = Integer.parseInt(request.getParameter("id"));

		RequestDispatcher patcher = null;

		TurfService turfService = new TurfService();

		try {

			turfService.deleteTurf(turfId);

			List<Turf> turfList = turfService.turfList();

			request.setAttribute("turfList", turfList);

			patcher = request.getRequestDispatcher("getAllTurfList.jsp");
			patcher.forward(request, response);

		} catch (ServiceException e) {
			out.println(e.getMessage());
		}

	}

}
