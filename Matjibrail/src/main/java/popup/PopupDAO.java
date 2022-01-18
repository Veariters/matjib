package popup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class PopupDAO
{
	private static PopupDAO instance = null;
	
	
	public static PopupDAO getInstance()
	{
		if(instance == null)
		{
			synchronized (PopupDAO.class)
			{
				instance = new PopupDAO();
			}
		}
		return instance;
		
	}
	
	
	/*
	 * private Connection getConnection() { Connection con = null; try {
	 * InitialContext ctx = new InitialContext(); DataSource ds =
	 * (DataSource)ctx.lookup("java:comp/env/jdbc/mydb");
	 * 
	 * con = ds.getConnection(); }catch(Exception e) {
	 * System.out.println("Connection 예외발생"); } return con; }
	 */
	public PopupVO getPopData(String stname)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PopupVO vo = null;
		
		try
		{
			con = ConnUtil.getConnection();
			pstmt = con.prepareStatement("select * from MAINPOPUP where POP_STNAME=?");
			pstmt.setString(1, stname);
			
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				vo=new PopupVO();
				vo.setPop_stname(rs.getString("pop_stname"));
				vo.setPop_stadd(rs.getString("pop_stadd"));
				vo.setPop_sttel(rs.getString("pop_sttel"));
				vo.setPop_y(rs.getString("pop_y"));
				vo.setPop_x(rs.getString("pop_x"));
			
			}
		}catch(Exception ex)
		{
			System.out.println("Exception "+ex);
		}
		finally 
		{
			if(rs != null) try {rs.close();} catch(SQLException s1) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s2) {}
			if(con != null) try {con.close();} catch(SQLException s3) {}
		}	
		return vo;
		
	}
	
}
