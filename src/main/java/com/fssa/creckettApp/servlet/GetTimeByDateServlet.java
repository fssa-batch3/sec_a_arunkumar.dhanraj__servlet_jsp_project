package com.fssa.creckettApp.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.fssa.creckett.services.TurfBookingService;
import com.fssa.creckett.services.exceptions.ServiceException;

/**
 * Servlet implementation class GetTimeByDateServlet
 */
@WebServlet("/GetTimeByDateServlet")
public class GetTimeByDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int turfId = Integer.parseInt(request.getParameter("turfId"));

		String date = request.getParameter("date");

		try {
			List<String> times = new TurfBookingService().getTimeByDate(turfId, date);
			
			JSONArray json = new JSONArray(times);
			response.getWriter().println(json);
			
			
		} catch (ServiceException e) {
			response.sendRedirect("/Pages/Turf/Pages/book.jsp?error="+e.getMessage());
		}

	}

}
