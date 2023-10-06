package com.fssa.creckettApp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.creckett.model.Requirement;
import com.fssa.creckett.model.User;
import com.fssa.creckett.services.RequirementService;
import com.fssa.creckett.services.exceptions.ServiceException;

/**
 * Servlet implementation class PostRequirementServlet
 */
@WebServlet("/PostRequirement")
public class PostRequirementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String message = request.getParameter("message");

		HttpSession session = request.getSession(false);

		User createdUser = (User) session.getAttribute("loggedUser");

		Requirement req = new Requirement(message, createdUser);

		try {
			new RequirementService().postRequirement(req);

			response.sendRedirect(request.getContextPath() + "/RequirementList");
		} catch (ServiceException e) {
			RequestDispatcher patcher = request.getRequestDispatcher("/Pages/Requirment/Pages/Form.jsp");
			request.setAttribute("error", e.getMessage());
			request.setAttribute("message", message);
			patcher.forward(request, response);
		}

	}

}
