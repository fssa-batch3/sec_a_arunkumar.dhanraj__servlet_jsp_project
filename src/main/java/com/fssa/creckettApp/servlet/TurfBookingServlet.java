package com.fssa.creckettApp.servlet;

import java.io.IOException;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.creckett.model.Turf;
import com.fssa.creckett.model.TurfBooking;
import com.fssa.creckett.model.User;
import com.fssa.creckett.services.TurfBookingService;
import com.fssa.creckett.services.exceptions.ServiceException;

/**
 * Servlet implementation class TurfBookingServlet
 */
@WebServlet("/TurfBooking")
public class TurfBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int turfId = Integer.parseInt(request.getParameter("turfId"));

		RequestDispatcher patcher = null;

		try {
			TurfBooking turf = new TurfBookingService().getTurfBooking(turfId);

			patcher = request.getRequestDispatcher("Pages/Turf/Pages/book.jsp");
			request.setAttribute("turf", turf);

		} catch (ServiceException e) {
			e.printStackTrace();
			patcher = request.getRequestDispatcher("Pages/Turf/Turf.jsp?error=" + e.getMessage());
		}
		patcher.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int turfId = Integer.parseInt(request.getParameter("turfId"));

		String dateStr = request.getParameter("date");
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate date = LocalDate.parse(dateStr, dateFormatter);

		String time = request.getParameter("time");

		RequestDispatcher patcher = null;

		try {
			Turf turf = new Turf();
			turf.setTurfId(turfId);

			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("loggedUser");

			TurfBooking booking = new TurfBooking(turf, user, date, time);

			new TurfBookingService().bookTurf(booking);

			request.getRequestDispatcher("/Pages/Turf/Pages/BookedTurf.jsp").forward(request, response);

		} catch (ServiceException e) {
			e.printStackTrace();
			patcher = request.getRequestDispatcher("ListTurfsList?error=Cannot book the turf now");
			patcher.forward(request, response);

		}

	}

}
