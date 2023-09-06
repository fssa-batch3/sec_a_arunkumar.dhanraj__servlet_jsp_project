package com.fssa.creckettApp.servlet;

import java.io.IOException;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.creckett.model.Match;

/**
 * Servlet implementation class GetAllMatchServlet
 */
@WebServlet("/GetAllMatchServlet")
public class GetAllMatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Match> matches = new ArrayList<>();

		matches.add(new Match(LocalDate.now(), "Chennai"));
		matches.add(new Match(LocalDate.now(), "Guduvancherry"));
		matches.add(new Match(LocalDate.now(), "Perungudi"));

		request.setAttribute("matches", matches);
		RequestDispatcher dispatcher = request.getRequestDispatcher("jspPractice/matchList.jsp");
		dispatcher.forward(request, response);

	}
// java eclipce ee
}
