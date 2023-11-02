package com.fssa.creckettApp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.creckett.model.User;
import com.fssa.creckett.services.UserService;
import com.fssa.creckett.services.exceptions.ServiceException;

/**
 * Servlet implementation class RequirementProfile
 */
@WebServlet("/RequirementProfile")
public class RequirementProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   	String email = request.getParameter("id");
   	
   	try {
		User reqUser = new UserService().getUser(email);
		request.setAttribute("profile", reqUser);
		request.getRequestDispatcher("/Pages/Requirment/Pages/profile/req_profile.jsp").forward(request, response);
	} catch (ServiceException e) {
		e.printStackTrace();
	}
   	
   	}



}
