package com.fssa.creckettApp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.creckett.model.User;
import com.fssa.creckett.services.UserService;
import com.fssa.creckett.services.exceptions.ServiceException;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phonenumber = request.getParameter("phonenumber");

		User user = new User(username, email, password, phonenumber);

		RequestDispatcher patcher = null;

		try {
			new UserService().registerUser(user);
			patcher = request.getRequestDispatcher("login.jsp");
		} catch (ServiceException e) {
			patcher = request.getRequestDispatcher("registration.jsp?errorMessage="+e.getMessage());

		}

		patcher.forward(request, response);

	}

}
