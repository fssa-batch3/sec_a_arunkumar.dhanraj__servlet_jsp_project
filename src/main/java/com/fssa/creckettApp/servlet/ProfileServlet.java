package com.fssa.creckettApp.servlet;

import java.io.IOException;

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
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String number = request.getParameter("number");
		String blood = request.getParameter("blood");
		String avail = request.getParameter("avail");
		String category = request.getParameter("category");

		HttpSession session = request.getSession(false);

		User user = (User) session.getAttribute("loggedUser");
		user.setName(name);
		user.setPhonenumber(number);
		user.setBloodGroup(blood);
		user.setAvailability(avail);
		user.setCategory(category);

		UserService service = new UserService();

		try {
			service.updateUserByID(user);
			session.setAttribute("loggeduser", user);
			response.sendRedirect("/creckettApp/Pages/Profile/userprofile.jsp");
		} catch (ServiceException e) {
			e.printStackTrace();
		}

	}

}
