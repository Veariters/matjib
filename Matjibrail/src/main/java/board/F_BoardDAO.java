package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import com.oreilly.servlet.MultipartRequest;

public class F_BoardDAO { // 게시판 작업의 기능들을 구현한 메서드

	private static F_BoardDAO instance = null;

	public F_BoardDAO() {

	}

	public static F_BoardDAO getInstance() {

		if (instance == null) {
			synchronized (F_BoardDAO.class) {
				instance = new F_BoardDAO();
			}
		}

		return instance;

	}

	public void insertArticle(F_BoardVO article) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;

		int num = article.getMf_num();

		int number = 0; // 웹에 보이는 게시글의 개수를 나타내는 변수

		String sql = "";

		try {

			con = ConnUtil.getConnection();

			sql = "insert into f_board(mf_num, mf_writer, mf_pass, mf_subject, mf_content, mf_image, mf_postdate) values(board_seq.nextval,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, article.getMf_writer());
			pstmt.setString(2, article.getMf_pass());
			pstmt.setString(3, article.getMf_subject());
			pstmt.setString(4, article.getMf_content());
			pstmt.setString(5, article.getMf_image());
			pstmt.setTimestamp(6, article.getMf_postdate());

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

	public int getArticleCount() { // 전체 글의 개수를 가져올 메소드 구현

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement("select count(*) from f_board");

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
		// 검색한 내용이 몇개인지 알아보는 메소드를 오버로딩으로 구현(검색조건-what, 검색내용-content로 변수설정)

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement("select count(*) from f_board where " + what + " like '%" + content + "%'");

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

	public List<F_BoardVO> getArticles(int start, int end) { // board table에서 가져올 메소드를 List로 구현
		// 검색할 내용을 리스트로 받아옴(what-검색조건, content-검색내용, start-시작번호, end-끝번호)
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<F_BoardVO> articleList = null;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement("select * from (select rownum rmf_num, mf_num, mf_writer, mf_pass, mf_subject, "
							+ "mf_readcount, mf_content, mf_image, mf_postdate from (select * from f_board order by mf_num desc)) "
							+ "where rmf_num>= ? and rmf_num <= ?");

			pstmt.setInt(1, start); // 나중에 수정3
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				articleList = new ArrayList<F_BoardVO>(end - start + 1); // 나중에 수정4.

				do {

					F_BoardVO article = new F_BoardVO();
					article.setMf_num(rs.getInt("mf_num"));
					article.setMf_writer(rs.getString("mf_writer"));
					article.setMf_pass(rs.getString("mf_pass"));
					article.setMf_subject(rs.getString("mf_subject"));
					article.setMf_readcount(rs.getInt("mf_readcount"));
					article.setMf_content(rs.getString("mf_content"));
					article.setMf_image(rs.getString("mf_image"));
					article.setMf_postdate(rs.getTimestamp("mf_postdate"));

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

	public List<F_BoardVO> getArticles(String what, String content, int start, int end) { // board table에서 가져올 메소드를
		// List로 구현 -> 나중에 수정1 검색할 내용을 리스트로받아옴(what-검색조건, content-검색내용,
		// start-시작번호,end-끝번호)

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<F_BoardVO> articleList = null;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement(
					"select * from (select rownum rmf_num, mf_num, mf_writer, mf_pass, mf_subject, mf_readcount, "
							+ "mf_content, mf_image, mf_postdate from (select * from f_board where " + what + " like '%"+ content + "%' )) "
							+ "where rmf_num>=? and rmf_num<=?");

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				articleList = new ArrayList<F_BoardVO>(end - start + 1); // 나중에 수정4.

				do {

					F_BoardVO article = new F_BoardVO();
					article.setMf_num(rs.getInt("mf_num"));
					article.setMf_writer(rs.getString("mf_writer"));
					article.setMf_pass(rs.getString("mf_pass"));
					article.setMf_subject(rs.getString("mf_subject"));
					article.setMf_readcount(rs.getInt("mf_readcount"));
					article.setMf_content(rs.getString("mf_content"));
					article.setMf_image(rs.getString("mf_image"));
					article.setMf_postdate(rs.getTimestamp("mf_postdate"));

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

	public F_BoardVO getArticle(int num) {
		// 글 제목을 누르면 글 내용을 볼 수 있도록 하는 메소드 구현. 글의 num을 매개변수로 하여 하나의 글에 대한 세부정보를 DB에서 가져올
		// 메서드

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		F_BoardVO article = null;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement("update f_board set mf_readcount = mf_readcount+1 where mf_num=?");

			pstmt.setInt(1, num);

			pstmt.executeUpdate();

			pstmt = con.prepareStatement("select * from f_board where mf_num = ?");

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				article = new F_BoardVO();

				article.setMf_num(rs.getInt("mf_num"));
				article.setMf_writer(rs.getString("mf_writer"));
				article.setMf_pass(rs.getString("mf_pass"));
				article.setMf_subject(rs.getString("mf_subject"));
				article.setMf_readcount(rs.getInt("mf_readcount"));
				article.setMf_content(rs.getString("mf_content"));
				article.setMf_image(rs.getString("mf_image"));
				article.setMf_postdate(rs.getTimestamp("mf_postdate"));

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

	// 글 상세보기 화면에서 [글수정]버튼을 누를 경우 updateForm.jsp로 이동하도록 링크를 걸어서 글 수정 화면을 설계 ->
	// 글수정시에는 글목록보기와 다르게조회수를 증가시킬 필요 없음

	// 조회수를 증가시키는 부분을 제외하고 num에 해당하는 글을 가져오는 메서드 구현

	public F_BoardVO updateGetArticle(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		F_BoardVO article = null;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement("select * from f_board where mf_num = ?");

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new F_BoardVO();

				article.setMf_num(rs.getInt("mf_num"));
				article.setMf_writer(rs.getString("mf_writer"));
				article.setMf_pass(rs.getString("mf_pass"));
				article.setMf_subject(rs.getString("mf_subject"));
				article.setMf_readcount(rs.getInt("mf_readcount"));
				article.setMf_image(rs.getString("mf_image"));
				article.setMf_content(rs.getString("mf_content"));
				article.setMf_postdate(rs.getTimestamp("mf_postdate"));
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

	public int updateArticle(F_BoardVO article) { // 데이터베이스에서 실제 수정 처리가 되도록 메서드구현.(글이 없을 경우에는 -1반환, 수정 성공시 1반환, 수정 실패시 0
													// 반환

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpass = "";
		String sql = "";

		int result = -1;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement("select mf_pass from f_board where mf_writer = ?");

			pstmt.setString(1, article.getMf_writer());

			rs = pstmt.executeQuery();
			// 여기까지는 성공
			if (rs.next()) {
				dbpass = rs.getString("mf_pass");

				if (dbpass.equals(article.getMf_pass())) { // 비밀번호가 일치할 경우 --> 수정 처리
					sql = "update f_board set  mf_subject=?, mf_content=?, mf_image=?, mf_postdate=? where mf_writer=?";

					pstmt = con.prepareStatement(sql);

					pstmt.setString(1, article.getMf_subject());
					pstmt.setString(2, article.getMf_content());
					pstmt.setString(3, article.getMf_image());
					pstmt.setTimestamp(4, article.getMf_postdate());
					pstmt.setString(5, article.getMf_writer());
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

	public int deleteArticle(int num, String pass) { // 글 삭제 처리할 메서드 구현(DB에서비밀번호를 비교하여 삭제)

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpass = "";
		String sql = "";

		int result = -1;

		try {

			con = ConnUtil.getConnection();

			pstmt = con.prepareStatement("select mf_pass from f_board where mf_num = ?");

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dbpass = rs.getString("mf_pass");

				if (dbpass.equals(pass)) { // 비밀번호가 일치할 경우 --> 삭제 처리

					sql = "delete from f_board where mf_num=?";

					pstmt = con.prepareStatement(sql);

					pstmt.setInt(1, num);

					pstmt.executeUpdate();

					result = 1; // 삭제 성공
				} else { // 비밀번호가 틀렸을 경우
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
