package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.MemberVO;

public class RecommendDAO {

	
	
	// 디비 연결
	private Connection getConnection() {
		Connection con = null;
		try {
			InitialContext ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mydb");
			
			con = ds.getConnection();
		}catch(Exception e) {
			System.out.println("Connection");
		}
		return con;
		
	}
	/*
	//추천 입력
	public boolean recommendInsert(RecommendVO vo) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		
		try { 
			con = getConnection();
			String strQuery = "insert into recommand values(?,?,?)";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setInt(1, vo.getNum());
			pstmt.setString(2, vo.getId());
			pstmt.setInt(3, vo.getBoard_num());
			
			int count = pstmt.executeUpdate();
			if(count > 0) flag = true;
		
		}catch(Exception ex) {
			System.out.println("Exception " + ex);
		}finally {
			if(rs != null) 
				try { 
					rs.close();
					}catch(SQLException s1) {
						
					}
			if(pstmt != null) 
				try { 
					pstmt.close();
					}catch(SQLException s2) {
						
					}
			if(con != null) 
				try { 
					con.close();
					}catch(SQLException s3) {
						
					}
		}
		return flag;
	}
	*/
	
	public void recommendInsert(int num, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try { 
			con = getConnection();
			pstmt = con.prepareStatement("insert into recommend values(?,?)");
			pstmt.setInt(1, num);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		
		}catch(Exception e) {
			System.out.println("Exception "+e);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException s2) {}
			if(con != null) try {con.close();}catch(SQLException s3) {}
		}
	}
	
	
	public int recommendCheck(int num, String id) {
		
		//추천 중복채크
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int check = -1;
		
		try {
			con = getConnection();
			
			String strQuery = "select id from recommend where num=?";
			
			pstmt = con.prepareStatement(strQuery);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String dbid = rs.getString("id");
				if(id.equals(dbid)) check = 1;
				else check = 0;
			}
		}catch(Exception ex) {
			System.out.println("Exception " + ex);
		}finally {
			if(rs != null) 
				try { 
					rs.close();
					}catch(SQLException s1) {
						
					}
			if(pstmt != null) 
				try { 
					pstmt.close();
					}catch(SQLException s2) {
						
					}
			if(con != null) 
				try { 
					con.close();
					}catch(SQLException s3) {
						
					}
		}
		return check;
	}
	/*
	public class RecommendDAO {
		
		private static RecommendDAO instance = null;

		public RecommendDAO() {
		}

		public static RecommendDAO getInstance() { // 연결
			if (instance == null) {
				synchronized (RecommendDAO.class) {
					instance = new RecommendDAO();
				}
			}
			return instance;
		}

		// 추천 정보 입력
		public void recommendInsert(int num, String id, int board_num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			
			try { 
				con = ConnUtil.getConnection();
				pstmt = con.prepareStatement("insert into recommend_board values(?,?,?)");
				pstmt.setInt(1, num);
				pstmt.setString(2, id);
				pstmt.setInt(3, board_num);
				pstmt.executeUpdate();
			
			}catch(Exception e) {
				System.out.println("Exception "+e);
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException s1) {}
				if(pstmt != null) try {pstmt.close();}catch(SQLException s2) {}
				if(con != null) try {con.close();}catch(SQLException s3) {}
			}
		}
		
		// 추천 중복 체크
		public int recommendChek(int num, String id, int board_num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int check = -1;
			
			try {
				con = ConnUtil.getConnection();
				pstmt = con.prepareStatement("select id_mem from recommend_board where idx_num=? and board_num=?");
				pstmt.setInt(1, num);
				pstmt.setInt(2, board_num);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					String dbid = rs.getString("id_mem");
					if(id.equals(dbid)) check = 1;
					else check = 0;
				}
			}catch(Exception e) {
				System.out.println("Exception "+e);
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException s1) {}
				if(pstmt != null) try {pstmt.close();}catch(SQLException s2) {}
				if(con != null) try {con.close();}catch(SQLException s3) {}
			}
			return check;
		}*/
}
