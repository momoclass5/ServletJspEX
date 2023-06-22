package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileDao;
import fileupload.FileDto;


public class FileListServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//req.getRequestDispatcher("./12파일업로드/FileList.jsp").forward(req, resp);
		String admin_id = this.getInitParameter("adminId");
		FileDao dao = new FileDao();
		List<FileDto> list = dao.getFileList();
		req.setAttribute("message", "msg");
		req.setAttribute("list", list);
		req.getRequestDispatcher("12파일업로드/FileList.jsp").forward(req, resp);
	
	}
	public FileListServlet() {
		// TODO Auto-generated constructor stub
	}

}
