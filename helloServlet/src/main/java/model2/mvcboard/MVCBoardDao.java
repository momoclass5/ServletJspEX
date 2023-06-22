package model2.mvcboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;

public class MVCBoardDao {

	public MVCBoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	// 총건수 조회
	public int totalCount() {
		int res = 0;
		
		return res;
	}
	
	// 목록 조회
	public List<MVCBoardDto> getList(){
		List<MVCBoardDto> list = new ArrayList<MVCBoardDto>();
		String sql = "SELECT * FROM mvcboard ORDER BY idx DESC";
		
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				MVCBoardDto dto = new MVCBoardDto(
											rs.getString("idx")
											, rs.getString("name")
											, rs.getString("title")
											, rs.getString("content")
											, rs.getString("postdate")
											, rs.getString("ofile")
											, rs.getString("sfile")
											, rs.getInt("downcount")
											, rs.getString("pass")
											, rs.getInt("visitcount")
									);
				
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
}


















