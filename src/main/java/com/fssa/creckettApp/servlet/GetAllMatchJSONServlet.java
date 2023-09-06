package com.fssa.creckettApp.servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.fssa.creckett.model.Match;

/**
 * Servlet implementation class GetAllMatchJSONServlet
 */
@WebServlet("/GetAllMatchJSONServlet")
public class GetAllMatchJSONServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Match> matches = new ArrayList<>();

		matches.add(new Match(LocalDate.now(), "Chennai-600108"));
		matches.add(new Match(LocalDate.now(), "Guduvancherry"));
		matches.add(new Match(LocalDate.now(), "Perungudi"));

		JSONArray accountsJSonArray = new JSONArray(matches);
		PrintWriter out = response.getWriter();
		out.println(accountsJSonArray.toString());
		out.flush();

//		request.setAttribute("matches", matches);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("jspPractice/matchList.jsp");
//		dispatcher.forward(request, response);

	}

}
