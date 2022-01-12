package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import com.oreilly.servlet.MultipartRequest;

public class R_BoardDAO { // �Խ��� �۾��� ��ɵ��� ������ �޼���

	private static R_BoardDAO instance = null;

	public R_BoardDAO() {

	}

	public static R_BoardDAO getInstance() {

		if (instance == null) {
			synchronized (R_BoardDAO.class) {
				instance = new R_BoardDAO();
			}
		}

		return instance;

	}

	public void insertArticle(R_BoardVO article) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;

		int num = article.getMr_num();

		int number = 0; // ���� ���̴� �Խñ��� ������ ��Ÿ���� ����

		String sql = "";

		try {

			con = ConnUtil.getConnection();

			sql = "insert into r_board(mr_num, mr_writer, mr_pass, mr_subject, mr_header, mr_content, mr_image, mr_postdate) values(board_seq.nextval,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, article.getMr_writer());
			pstmt.setString(2, article.getMr_pass());
			pstmt.setString(3, article.getMr_subject());
			pstmt.setString(4, article.getMr_header());
			pstmt.setString(5, article.getMr_content());
			pstmt.setString(6, article.getMr_image());
			pstmt.setTimestamp(7, article.getMr_postdate());

			pstmt.executeUpdate();
		} catch (Exception s) {
			System.out.println("Exception : " + s);
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s2) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException s3) {
				}
		}

	}

	public int getArticleCount() { // ��ü ���� ������ ������ �޼ҵ� ����

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement("select count(*) from r_board");

			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
			}

		} catch (Exception s) {
			System.out.println("Exception : " + s);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s1) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s2) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException s3) {
				}
		}

		return x;
	}

	public int getArticleCount(String what, String content) {
		// �˻��� ������ ����� �˾ƺ��� �޼ҵ带 �����ε����� ����(�˻�����-what, �˻�����-content�� ��������)

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement("select count(*) from r_board where " + what + " like '%" + content + "%'");

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				x = rs.getInt(1);
			}

		} catch (Exception s) {
			System.out.println("Exception : " + s);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s1) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s2) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException s3) {
				}
		}

		return x;
	}
	
	
	public int getArticleCount(String content) {
		// ���Ӹ��� �˻��� ������ ����� �˾ƺ��� �޼ҵ带 �����ε����� ����(�˻�����-what, �˻�����-content�� ��������)
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try {
			
			con = ConnUtil.getConnection();
			
			pstmt = con.prepareStatement("select count(*) from r_board where " + content + " = mr_header");
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				x = rs.getInt(1);
			}
			
		} catch (Exception s) {
			System.out.println("Exception : " + s);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s1) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s2) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException s3) {
				}
		}
		
		return x;
	}

	public List<R_BoardVO> getArticles(int start, int end) { // board table���� ������ �޼ҵ带 List�� ����
		// �˻��� ������ ����Ʈ�� �޾ƿ�(what-�˻�����, content-�˻�����, start-���۹�ȣ, end-����ȣ)
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<R_BoardVO> articleList = null;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement("select * from (select rownum rmr_num, mr_num, mr_writer, mr_pass, mr_subject, "
							+ "mr_readcount, mr_content, mr_image, mr_up, mr_header, mr_bcheck, mr_postdate from (select * from r_board order by mr_num desc)) "
							+ "where rmr_num>= ? and rmr_num <= ?");

			pstmt.setInt(1, start); // ���߿� ����3
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				articleList = new ArrayList<R_BoardVO>(end - start + 1); // ���߿� ����4.

				do {

					R_BoardVO article = new R_BoardVO();
					article.setMr_num(rs.getInt("mr_num"));
					article.setMr_header(rs.getString("mr_header"));
					article.setMr_writer(rs.getString("mr_writer"));
					article.setMr_pass(rs.getString("mr_pass"));
					article.setMr_subject(rs.getString("mr_subject"));
					article.setMr_readcount(rs.getInt("mr_readcount"));
					article.setMr_content(rs.getString("mr_content"));
					article.setMr_image(rs.getString("mr_image"));
					article.setMr_bcheck(rs.getInt("mr_bcheck"));
					article.setMr_postdate(rs.getTimestamp("mr_postdate"));

					articleList.add(article);
				} while (rs.next());
			}

		} catch (Exception s) {
			System.out.println("Exception : " + s);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s1) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s2) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException s3) {
				}
		}
		return articleList;
	}

	public List<R_BoardVO> getArticles(String header, int start, int end) { // board table���� ������ �޼ҵ带
		// List�� ���� -> ���߿� ����1 �˻��� ������ ����Ʈ�ι޾ƿ�(what-�˻�����, content-�˻�����,
		// start-���۹�ȣ,end-����ȣ)

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<R_BoardVO> articleList = null;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement(
					"select * from (select rownum rmr_num, mr_num, mr_writer, mr_pass, mr_subject, mr_readcount, "
							+ "mr_content, mr_image, mr_up, mr_header, mr_bcheck, mr_postdate from (select * from r_board where mr_header ="+header+" order by mr_num desc)) "
							+"where rmr_num>=? and rmr_num<=?");

			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {

				articleList = new ArrayList<R_BoardVO>(end - start + 1); // ���߿� ����4.

				do {

					R_BoardVO article = new R_BoardVO();
					article.setMr_num(rs.getInt("mr_num"));
					article.setMr_header(rs.getString("mr_header"));
					article.setMr_writer(rs.getString("mr_writer"));
					article.setMr_pass(rs.getString("mr_pass"));
					article.setMr_subject(rs.getString("mr_subject"));
					article.setMr_readcount(rs.getInt("mr_readcount"));
					article.setMr_content(rs.getString("mr_content"));
					article.setMr_image(rs.getString("mr_image"));
					article.setMr_bcheck(rs.getInt("mr_bcheck"));
					article.setMr_postdate(rs.getTimestamp("mr_postdate"));

					articleList.add(article);
				} while (rs.next());
			}

		} catch (Exception s) {
			System.out.println("Exception : " + s);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s1) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s2) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException s3) {
				}
		}
		return articleList;
	}
	
	
	public List<R_BoardVO> getArticles(String what, String content, int start, int end) { // board table���� ������ �޼ҵ带
		// List�� ���� -> ���Ӹ��� �˻��� ������ ����Ʈ�ι޾ƿ�(what-�˻�����, content-�˻�����,
		// start-���۹�ȣ,end-����ȣ)
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<R_BoardVO> articleList = null;
		
		try {
			
			con = ConnUtil.getConnection();
			
			pstmt = con.prepareStatement(
					"select * from (select rownum rmr_num, mr_num, mr_writer, mr_pass, mr_subject, mr_readcount, "
							+ "mr_content, mr_image, mr_up, mr_header,mr_bcheck, mr_postdate from (select * from r_board where " + what + " like '%"+ content + "%' order by mr_num desc )) "
							+ "where rmr_num>=? and rmr_num<=?");
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				articleList = new ArrayList<R_BoardVO>(end - start + 1); // ���߿� ����4.
				
				do {
					
					R_BoardVO article = new R_BoardVO();
					article.setMr_num(rs.getInt("mr_num"));
					article.setMr_header(rs.getString("mr_header"));
					article.setMr_writer(rs.getString("mr_writer"));
					article.setMr_pass(rs.getString("mr_pass"));
					article.setMr_subject(rs.getString("mr_subject"));
					article.setMr_readcount(rs.getInt("mr_readcount"));
					article.setMr_content(rs.getString("mr_content"));
					article.setMr_image(rs.getString("mr_image"));
					article.setMr_bcheck(rs.getInt("mr_bcheck"));
					article.setMr_postdate(rs.getTimestamp("mr_postdate"));
					
					articleList.add(article);
				} while (rs.next());
			}
			
		} catch (Exception s) {
			System.out.println("Exception : " + s);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s1) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s2) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException s3) {
				}
		}
		return articleList;
	}

	public R_BoardVO getArticle(int num) {
		// �� ������ ������ �� ������ �� �� �ֵ��� �ϴ� �޼ҵ� ����. ���� num�� �Ű������� �Ͽ� �ϳ��� �ۿ� ���� ���������� DB���� ������
		// �޼���

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		R_BoardVO article = null;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement("update r_board set mr_readcount = mr_readcount+1 where mr_num=?");

			pstmt.setInt(1, num);

			pstmt.executeUpdate();

			pstmt = con.prepareStatement("select * from r_board where mr_num = ?");

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				article = new R_BoardVO();

				article.setMr_num(rs.getInt("mr_num"));
				article.setMr_writer(rs.getString("mr_writer"));
				article.setMr_pass(rs.getString("mr_pass"));
				article.setMr_subject(rs.getString("mr_subject"));
				article.setMr_readcount(rs.getInt("mr_readcount"));
				article.setMr_content(rs.getString("mr_content"));
				article.setMr_image(rs.getString("mr_image"));
				article.setMr_postdate(rs.getTimestamp("mr_postdate"));

			}
		} catch (Exception s) {
			System.out.println("Exception : " + s);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s1) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s2) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException s3) {
				}
		}
		return article;
	}

	// �� �󼼺��� ȭ�鿡�� [�ۼ���]��ư�� ���� ��� updateForm.jsp�� �̵��ϵ��� ��ũ�� �ɾ �� ���� ȭ���� ���� ->
	// �ۼ����ÿ��� �۸�Ϻ���� �ٸ�����ȸ���� ������ų �ʿ� ����

	// ��ȸ���� ������Ű�� �κ��� �����ϰ� num�� �ش��ϴ� ���� �������� �޼��� ����

	public R_BoardVO updateGetArticle(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		R_BoardVO article = null;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement("select * from r_board where mr_num = ?");

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new R_BoardVO();

				article.setMr_num(rs.getInt("mr_num"));
				article.setMr_writer(rs.getString("mr_writer"));
				article.setMr_pass(rs.getString("mr_pass"));
				article.setMr_subject(rs.getString("mr_subject"));
				article.setMr_readcount(rs.getInt("mr_readcount"));
				article.setMr_image(rs.getString("mr_image"));
				article.setMr_content(rs.getString("mr_content"));
				article.setMr_postdate(rs.getTimestamp("mr_postdate"));
			}

		} catch (Exception s) {
			System.out.println("Exception : " + s);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s1) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s2) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException s3) {
				}
		}
		return article;
	}

	public int updateArticle(R_BoardVO article) { // �����ͺ��̽����� ���� ���� ó���� �ǵ��� �޼��屸��.(���� ���� ��쿡�� -1��ȯ, ���� ������ 1��ȯ, ���� ���н� 0
													// ��ȯ

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpass = "";
		String sql = "";

		int result = -1;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement("select mr_pass from r_board where mr_writer = ?");

			pstmt.setString(1, article.getMr_writer());

			rs = pstmt.executeQuery();
			// ��������� ����
			if (rs.next()) {
				dbpass = rs.getString("mr_pass");

				if (dbpass.equals(article.getMr_pass())) { // ��й�ȣ�� ��ġ�� ��� --> ���� ó��
					sql = "update r_board set  mr_subject=?, mr_content=?, mr_image=?, mr_postdate=? where mr_writer=?";

					pstmt = con.prepareStatement(sql);

					pstmt.setString(1, article.getMr_subject());
					pstmt.setString(2, article.getMr_content());
					pstmt.setString(3, article.getMr_image());
					pstmt.setTimestamp(4, article.getMr_postdate());
					pstmt.setString(5, article.getMr_writer());
					pstmt.executeUpdate();

					result = 1;

				} else {
					result = 0;
				}

			}

		} catch (Exception s) {
			System.out.println("Exception : " + s);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s1) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s2) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException s3) {
				}
		}
		return result;
	}

	public int deleteArticle(int num, String pass) { // �� ���� ó���� �޼��� ����(DB������й�ȣ�� ���Ͽ� ����)

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpass = "";
		String sql = "";

		int result = -1;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement("select mr_pass from r_board where mr_num = ?");

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dbpass = rs.getString("mr_pass");

				if (dbpass.equals(pass)) { // ��й�ȣ�� ��ġ�� ��� --> ���� ó��

					sql = "delete from r_board where mr_num=?";

					pstmt = con.prepareStatement(sql);

					pstmt.setInt(1, num);

					pstmt.executeUpdate();

					result = 1; // ���� ����
				} else { // ��й�ȣ�� Ʋ���� ���
					result = 0;
				}

			}
		} catch (Exception s) {
			System.out.println("Exception : " + s);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s1) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s2) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException s3) {
				}
		}

		return result;

	}

}
