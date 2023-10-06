package com.fssa.creckettApp.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.creckett.model.Requirement;
import com.fssa.creckett.services.RequirementService;
import com.fssa.creckett.services.exceptions.ServiceException;

/**
 * Servlet implementation class ListRequirementServlet
 */
@WebServlet("/RequirementList")
public class ListRequirementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequirementService service = new RequirementService();

		RequestDispatcher patcher = null;

		try {
			List<Requirement> reqList = service.listRequirement();

			patcher = request.getRequestDispatcher("/Pages/Requirment/Requirement.jsp");

			request.setAttribute("reqList", reqList);

		} catch (ServiceException e) {
			patcher = request.getRequestDispatcher("/Pages/Requirment/Requirement.jsp");
		}
		patcher.forward(request, response);

	}

}
