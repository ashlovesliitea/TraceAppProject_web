package tracewebproject;

import java.io.IOException;
import member.*;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tracewebproject.AdminDao;

/**
 * Servlet implementation class loginController
 */

public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		 memberDao mDao=memberDao.getInstance();
		  ArrayList<String> memberlist=mDao.getMemberIdList(request);
		
		  request.setAttribute("list", memberlist);
		
			RequestDispatcher rd = request.getRequestDispatcher("/adminpage.jsp");
			rd.forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		 memberDao mDao=memberDao.getInstance();
		  ArrayList<String> memberlist=mDao.getMemberIdList(request);
		
		  request.setAttribute("list", memberlist);
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");		
		
		AdminDao aDao=AdminDao.getInstance();
		int loginResult=aDao.login(id, pw, request);
		PrintWriter out=response.getWriter();
	if(loginResult==1) {
			request.setAttribute("loginResult", loginResult);
			HttpSession session=request.getSession();
			session.setAttribute("id", id);
		RequestDispatcher rd = request.getRequestDispatcher("/adminpage.jsp");
			rd.forward(request, response);
		}
	else if(loginResult==3) {
		out.println("not connected");
	}
	else{
			request.setAttribute("loginResult", loginResult);
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		 
		}
		
	}

}
