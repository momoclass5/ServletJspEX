package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;
import dto.Board;

/**
 * 
 * @author user
 * 
 */
public class BoardDao {

	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 게시물의 총 갯수를 반환 합니다
	 * @return 게시물의 총 갯수
	 */
	public int getTotalCnt(String searchField, String searchWord) {
		int totalCnt = 0;
		String sql = "select count(*) "
					+ "from board ";
		if(searchWord != null && !"".equals(searchWord)) {
			sql += "where "+ searchField +" like '%"+ searchWord +"%'";
		}	
		
		sql += "order by num desc";
		
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			ResultSet rs = psmt.executeQuery();
			rs.next();
			totalCnt = rs.getInt(1); // 첫번째 컬럼의 값을 반환
			
			rs.close();
		} catch (SQLException e) {
			System.out.println("총 게시물의 수를 조회 하던중 예외가 발생 하였습니다.");
			e.printStackTrace();
		}
		
		return totalCnt;
	}
	
	

	/**
	 * 
	 * 게시글 목록을 조회 합니다.
	 * 
	 * @param searchField : 검색조건
	 * @param searchWord : 검색어
	 * @return List<Board> : 게시글 목록
	 */
	public List<Board> getList(String searchField, String searchWord) {
		List<Board> boardList = new ArrayList<>();
		
		String sql = "select * "
					+ "from board ";
				
		// 검색어가 입력 되었으면 검색 조건을 추가 합니다.
		if(searchWord != null 
				&& !"".equals(searchWord)){		
			
			sql 	+=	"where " + searchField 
							+" like '%" + searchWord + "%'";
		}
		
		sql		+= 	"order by num desc";

		// 검색조건 추가
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			ResultSet rs = psmt.executeQuery();
			
			// 게시글의 수만큼 반복
			while(rs.next()) {
				// 게시물의 한행을 DTO에 저장
				Board board = new Board();
				
				board.setNum(rs.getString("num"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setPostdate(rs.getString("postdate"));
				board.setVisitcount(rs.getString("visitcount"));
				
				boardList.add(board); // 결과 목록에 저장
			}
			
		} catch (SQLException e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return boardList;
	}

}















