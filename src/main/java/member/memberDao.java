package member;

	import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
	import javax.sql.DataSource;

	public class memberDao {
	  private static memberDao aDao;
	  private Connection conn;
	  private PreparedStatement pstmt;
	  private ResultSet rs;
	  private int result;
	 
	  
	  public static synchronized memberDao getInstance() {
		  if(aDao==null) {
			   aDao=new memberDao();
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
	  
	  public String findName(String id,HttpServletRequest req) {
		  String name=null;
		  conn=this.getConnection(req);
		    if(conn!=null) {
		    String query="select name from user_db where id=?";
		    try {
		    	pstmt=conn.prepareStatement(query);
		       pstmt.setString(1,id);
		    	rs=pstmt.executeQuery();
		    	if(rs.next()) {
		    		name=rs.getString("name");
		    	}
		      
		    
		    	}catch (SQLException e) {
					e.printStackTrace();
				} finally {
					this.close(conn, pstmt, rs);
				}
		
		    }
		  
		  return name;
		  
	  }
	  
	  public ArrayList<String> getMemberIdList(HttpServletRequest req){
		  ArrayList<String> idlist=new ArrayList<>();
		  
		  conn=this.getConnection(req);
		    if(conn!=null) {
		    String query="select id from user_db";
		    try {
		    	pstmt=conn.prepareStatement(query);
		    	rs=pstmt.executeQuery();
		    	while(rs.next()) {
		    		String id=rs.getString("id");
		    	  idlist.add(id);
		    	}
		      
		    
		    	}catch (SQLException e) {
					e.printStackTrace();
				} finally {
					this.close(conn, pstmt, rs);
				}
		
		    }
		  
		  return idlist;
	  } 
	  
	  public memberDto getMemberDto(String id,HttpServletRequest req){
		    
		memberDto dto=new memberDto();
	
		  conn=this.getConnection(req);
		    if(conn!=null) {
		    String query="select * from user_db where id=?";
		    try {
		    	pstmt=conn.prepareStatement(query);
		       pstmt.setString(1,id);
		    	rs=pstmt.executeQuery();
		          if(rs.next()) {
		    		dto.setId(id);
		    		dto.setAddress(rs.getString("address"));
		    		dto.setFeet_size(rs.getString("feet_size"));
		    		dto.setName(rs.getString("name"));
		    		dto.setPhone(rs.getString("phone"));
		    		dto.setGender(rs.getString("gender"));
		    		dto.setHeight(rs.getString("height"));
		    		dto.setWeight(rs.getString("weight"));
		    		dto.setJoin_date(rs.getString("join_date"));
		    	}
		      
		    
		    	}catch (SQLException e) {
					e.printStackTrace();
				} finally {
					this.close(conn, pstmt, rs);
				}
		
		    }
			return dto;
		
	 
	}
	  
	  public measureDto getMeasureDto(String id,HttpServletRequest req){
		    
			measureDto dto=new measureDto();
		
			  conn=this.getConnection(req);
			    if(conn!=null) {
			    String query="select * from measure_db where id=? AND admin_send='true' ";
			    try {
			    	pstmt=conn.prepareStatement(query);
			       pstmt.setString(1,id);
			    	rs=pstmt.executeQuery();
			          if(rs.next()) {
			    		dto.setId(id);
			    		dto.setMeasure_date(rs.getString("measure_date"));
			    		dto.setFolderpath(rs.getString("folderpath"));
			    		dto.setHeel(rs.getString("heel"));
			    		dto.setArch(rs.getString("arch"));
			    		dto.setAdmin_send(rs.getString("admin_send"));
			    		
			    	}else {
			    		dto.setId("notmeasured");
			    	}
			      
			    
			    	}catch (SQLException e) {
						e.printStackTrace();
					} finally {
						this.close(conn, pstmt, rs);
					}
			
			    }
				return dto;
			
		 
		}
}
