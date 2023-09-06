package com.fssa.creckettApp.servlet;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.creckett.dao.UserDAO;
import com.fssa.creckett.dao.exceptions.DAOException;
import com.fssa.creckett.model.User;

/**
 * Servlet implementation class GetAllUserServlet
 */
@WebServlet("/GetAllUserServlet")
public class GetAllUserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserDAO userDAO = new UserDAO();

		try {
			ArrayList<User> users = (ArrayList<User>) userDAO.regiteredUsersList();
			request.setAttribute("usersList", users);
		} catch (DAOException e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("usersList.jsp");
		dispatcher.forward(request, response);

	}

}
