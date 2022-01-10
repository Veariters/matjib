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

		int num = article.getMr2_num();

		int number = 0; // ���� ���̴� �Խñ��� ������ ��Ÿ���� ����

		String sql = "";

		try {

			con = ConnUtil.getConnection();

			sql = "insert into r_board(mr2_num, mr2_writer, mr2_pass, mr2_subject, mr2_header, mr2_content, mr2_image, mr2_postdate) values(board_seq.nextval,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, article.getMr2_writer());
			pstmt.setString(2, article.getMr2_pass());
			pstmt.setString(3, article.getMr2_subject());
			pstmt.setString(4, article.getMr2_header());
			pstmt.setString(5, article.getMr2_content());
			pstmt.setString(6, article.getMr2_image());
			pstmt.setTimestamp(7, article.getMr2_postdate());

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
			
			pstmt = con.prepareStatement("select count(*) from r_board where " + content + " = mr2_header");
			
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

			pstmt = con.prepareStatement("select * from (select rownum rmr2_num, mr2_num, mr2_writer, mr2_pass, mr2_subject, "
							+ "mr2_readcount, mr2_content, mr2_image, mr2_up, mr2_header,mr2_bcheck, mr2_postdate from (select * from r_board order by mr2_num desc)) "
							+ "where rmr2_num>= ? and rmr2_num <= ?");

			pstmt.setInt(1, start); // ���߿� ����3
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				articleList = new ArrayList<R_BoardVO>(end - start + 1); // ���߿� ����4.

				do {

					R_BoardVO article = new R_BoardVO();
					article.setMr2_num(rs.getInt("mr2_num"));
					article.setMr2_header(rs.getString("mr2_header"));
					article.setMr2_writer(rs.getString("mr2_writer"));
					article.setMr2_pass(rs.getString("mr2_pass"));
					article.setMr2_subject(rs.getString("mr2_subject"));
					article.setMr2_readcount(rs.getInt("mr2_readcount"));
					article.setMr2_content(rs.getString("mr2_content"));
					article.setMr2_image(rs.getString("mr2_image"));
					article.setMr2_postdate(rs.getTimestamp("mr2_postdate"));

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

	public List<R_BoardVO> getArticles(String what, int start, int end) { // board table���� ������ �޼ҵ带
		// List�� ���� -> ���߿� ����1 �˻��� ������ ����Ʈ�ι޾ƿ�(what-�˻�����, content-�˻�����,
		// start-���۹�ȣ,end-����ȣ)

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<R_BoardVO> articleList = null;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement(
					"select * from (select rownum rmr2_num, mr2_num, mr2_writer, mr2_pass, mr2_subject, mr2_readcount, "
							+ "mr2_content, mr2_image, mr2_up, mr2_header, mr2_bcheck, mr2_postdate from (select * from r_board where mr2_header ='"+what+"')) "
							+"where rmr2_num>=? and rmr2_num<=?");

			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {

				articleList = new ArrayList<R_BoardVO>(end - start + 1); // ���߿� ����4.

				do {

					R_BoardVO article = new R_BoardVO();
					article.setMr2_num(rs.getInt("mr2_num"));
					article.setMr2_header(rs.getString("mr2_header"));
					article.setMr2_writer(rs.getString("mr2_writer"));
					article.setMr2_pass(rs.getString("mr2_pass"));
					article.setMr2_subject(rs.getString("mr2_subject"));
					article.setMr2_readcount(rs.getInt("mr2_readcount"));
					article.setMr2_content(rs.getString("mr2_content"));
					article.setMr2_image(rs.getString("mr2_image"));
					article.setMr2_postdate(rs.getTimestamp("mr2_postdate"));

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
					"select * from (select rownum rmr2_num, mr2_num, mr2_writer, mr2_pass, mr2_subject, mr2_readcount, "
							+ "mr2_content, mr2_image, mr2_up, mr2_header,mr2_bcheck, mr2_postdate from (select * from r_board where " + what + " like '%"+ content + "%' )) "
							+ "where rmr2_num>=? and rmr2_num<=?");
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				articleList = new ArrayList<R_BoardVO>(end - start + 1); // ���߿� ����4.
				
				do {
					
					R_BoardVO article = new R_BoardVO();
					article.setMr2_num(rs.getInt("mr2_num"));
					article.setMr2_header(rs.getString("mr2_header"));
					article.setMr2_writer(rs.getString("mr2_writer"));
					article.setMr2_pass(rs.getString("mr2_pass"));
					article.setMr2_subject(rs.getString("mr2_subject"));
					article.setMr2_readcount(rs.getInt("mr2_readcount"));
					article.setMr2_content(rs.getString("mr2_content"));
					article.setMr2_image(rs.getString("mr2_image"));
					article.setMr2_postdate(rs.getTimestamp("mr2_postdate"));
					
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

			pstmt = con.prepareStatement("update r_board set mr2_readcount = mr2_readcount+1 where mr2_num=?");

			pstmt.setInt(1, num);

			pstmt.executeUpdate();

			pstmt = con.prepareStatement("select * from r_board where mr2_num = ?");

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				article = new R_BoardVO();

				article.setMr2_num(rs.getInt("mr2_num"));
				article.setMr2_writer(rs.getString("mr2_writer"));
				article.setMr2_pass(rs.getString("mr2_pass"));
				article.setMr2_subject(rs.getString("mr2_subject"));
				article.setMr2_readcount(rs.getInt("mr2_readcount"));
				article.setMr2_content(rs.getString("mr2_content"));
				article.setMr2_image(rs.getString("mr2_image"));
				article.setMr2_postdate(rs.getTimestamp("mr2_postdate"));

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

			pstmt = con.prepareStatement("select * from r_board where mr2_num = ?");

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new R_BoardVO();

				article.setMr2_num(rs.getInt("mr2_num"));
				article.setMr2_writer(rs.getString("mr2_writer"));
				article.setMr2_pass(rs.getString("mr2_pass"));
				article.setMr2_subject(rs.getString("mr2_subject"));
				article.setMr2_readcount(rs.getInt("mr2_readcount"));
				article.setMr2_image(rs.getString("mr2_image"));
				article.setMr2_content(rs.getString("mr2_content"));
				article.setMr2_postdate(rs.getTimestamp("mr2_postdate"));
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

			pstmt = con.prepareStatement("select mr2_pass from r_board where mr2_writer = ?");

			pstmt.setString(1, article.getMr2_writer());

			rs = pstmt.executeQuery();
			// ��������� ����
			if (rs.next()) {
				dbpass = rs.getString("mr2_pass");

				if (dbpass.equals(article.getMr2_pass())) { // ��й�ȣ�� ��ġ�� ��� --> ���� ó��
					sql = "update r_board set  mr2_subject=?, mr2_content=?, mr2_image=?, mr2_postdate=? where mr2_writer=?";

					pstmt = con.prepareStatement(sql);

					pstmt.setString(1, article.getMr2_subject());
					pstmt.setString(2, article.getMr2_content());
					pstmt.setString(3, article.getMr2_image());
					pstmt.setTimestamp(4, article.getMr2_postdate());
					pstmt.setString(5, article.getMr2_writer());
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

			pstmt = con.prepareStatement("select mr2_pass from r_board where mr2_num = ?");

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dbpass = rs.getString("mr2_pass");

				if (dbpass.equals(pass)) { // ��й�ȣ�� ��ġ�� ��� --> ���� ó��

					sql = "delete from r_board where mr2_num=?";

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
