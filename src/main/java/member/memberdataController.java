package member;

import java.io.IOException;
import java.util.ArrayList;

import member.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class memberdata
 */
@WebServlet("/memberdata")
public class memberdataController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberdataController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	  String id=request.getParameter("id");
	  memberDao mDao=memberDao.getInstance();
	  memberDto mDto=mDao.getMemberDto(id, request);
	  
	  ArrayList<measureDto>measureList=mDao.getMeasureDto(id,request);
	 
	  Boolean measureResult;
	  
	  if(measureList.size()==0) {
		 measureResult=false;
		  request.setAttribute("measureResult", measureResult);
	  }else {
		  measureResult=true;
		
		  request.setAttribute("measureResult",measureResult);
		  request.setAttribute("measureList", measureList);
	  }
       request.setAttribute("mDto", mDto);
   	RequestDispatcher rd = request.getRequestDispatcher("/memberdata.jsp");
	rd.forward(request, response);
		
	}



}
