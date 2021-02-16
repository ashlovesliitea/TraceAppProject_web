package tracewebproject;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

public class AdminDao {
  private static AdminDao aDao;
  private Connection conn;
  private PreparedStatement pstmt;
  private ResultSet rs;
  private int result;
 
  
  public static synchronized AdminDao getInstance() {
	  if(aDao==null) {
		   aDao=new AdminDao();
	  }
	  return aDao;
  }
     
  public Connection getConnection(HttpServletRequest request){
	  DataSource pool = (DataSource) request.getServletContext().getAttribute("my-pool");
	  Connection con=null;
	  try{
		  con=pool.getConnection();}
	  catch(SQLException e) {
		  e.printStackTrace();
	  }
		  return con;
  }
  
  public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

  
  public int login(String id,String pw,HttpServletRequest req){
	    conn=this.getConnection(req);
	    if(conn!=null) {
	    StringBuffer query= new StringBuffer();
	    
	    query.append("SELECT pw").append(" FROM admin_db").append(" WHERE ID = ?");
	    try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if(rs.getString("pw").equals(pw)) {
					return 1;
				} else {
					return 0;
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, rs);
		}
		return -1;
	    }
	    else {return 3;}
  }
}
