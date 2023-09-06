package com.fssa.creckettApp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fssa.creckett.model.Match;

/**
 * Servlet implementation class GetMatchJSONObjectServlet
 */
@WebServlet("/GetMatchJSONObjectServlet")
public class GetMatchJSONObjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Match match = new Match(LocalDate.now(), "Chennai-600108");

		JSONObject accountJson = new JSONObject(match);
		PrintWriter out = response.getWriter();
		out.println(accountJson.toString());
		out.flush();
	}

}
