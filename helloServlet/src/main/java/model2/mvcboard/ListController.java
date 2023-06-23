package model2.mvcboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;

public class ListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 리스트 조회
		MVCBoardDao dao = new MVCBoardDao();
	
		// 검색어, 페이지정보 세팅
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		String pageNo = req.getParameter("pageNo");
		
		Criteria cri = new Criteria(searchField, searchWord, pageNo);
		
		System.out.println("=======    페이지 관련 파라메터");
		System.out.println(cri.getPageNo());
		System.out.println(cri.getStartNo());
		System.out.println(cri.getEndNo());
		System.out.println("===========================");
		
		cri.setSearchField(req.getParameter("searchField"));
		cri.setSearchWord(req.getParameter("searchWord"));
				
		// 검색어, 페이지 정보를 담은 객체를 매개변수로 넣어 줍니다.
		List<MVCBoardDto> list = dao.getListPage(cri);
		
		System.out.println("list : " + list.size());
		int totalCnt = dao.getTotalCnt(cri); 
		
		System.out.println("totalCnt : " + totalCnt); 
		
		
		// 페이지 네비게이션 생성을 위해 pageDto생성
		PageDto pageDto = new PageDto(totalCnt, cri);
		
		
		// request영역에 저장
		req.setAttribute("list", list);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("pageDto", pageDto);
		
		// 화면 페이지 전환
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
	
	}
	
	public ListController() {
		// TODO Auto-generated constructor stub
	}

}
