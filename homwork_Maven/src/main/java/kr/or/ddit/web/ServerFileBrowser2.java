package kr.or.ddit.web;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.web.model2.FileListGenerator;

@WebServlet("/fileBrowser1.do")
public class ServerFileBrowser2 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//브라우저상에 파일들 목록 보여주기
		//디렉토리라면 두번 클릭했을 때 그 아래에 목록들로 화면이 보여야함
		//..이라는 링크를 추가해서 다시 상위폴더로 갈 수 있게
		//02를 클릭했다면 02가 열리게 파라미터로 넘어가게한다.
		//파일 리스트를 뽑아올 메서드를 만들어준 객체생성
		FileListGenerator fg = new FileListGenerator();
		System.out.println("김정희 돼지 멍추잉 즐 ");
		
		//제일 초기 URL을 셋팅
		String url = "D:/A_TeachingMaterial/gitRepo/webStudy01/WebContent";
		
		//request에서 fileAddress라는 이름을 가진 input tag의 value값 가져온다.
		if(req.getParameter("fileAddress")!=null) {
			url = req.getParameter("fileAddress");
		}
		//파일리스트 생성하기
		File[] files = fg.getFileList(url);
		
		//dispatch사용해야 하여 원본 request값 유지되기 때문에 포워드 방식을 사용한다.
		//request에 setAttribute를 이용하여 파일리스트를 전달한다.
		req.setAttribute("files", files);
		
		//fileBrowser가 있는 위치를 찍어준다.
		String view = "/WEB-INF/views/fileBrowser.jsp";
		//Dispatch를 사용하여 fileBrowser.jsp로 넘겨준다.
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);
	}
}
