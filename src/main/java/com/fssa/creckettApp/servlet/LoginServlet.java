package com.fssa.creckettApp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.creckett.model.User;
import com.fssa.creckett.services.UserService;
import com.fssa.creckett.services.exceptions.ServiceException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User user = new User(email, password);

		try {

			UserService service = new UserService();
			service.loginUser(user);

			User loggedUser = service.getUser(email);

			HttpSession session = request.getSession();
			session.setAttribute("loggedUser", loggedUser);

			response.sendRedirect(request.getContextPath() + "/index.jsp");

		} catch (ServiceException e) {
			RequestDispatcher patcher = request.getRequestDispatcher("Pages/Login/login.jsp");
			request.setAttribute("errorMessage", "Invalid Credentials");
			request.setAttribute("logUser", user);
			patcher.forward(request, response);
		}
	}

}