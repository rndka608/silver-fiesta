package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/member/memberList.do")
public class MemberListServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		1. 요청과의 매핑 설정
//		2. 요청 분석(주소, 파라미터, 메소드, 헤더들...)
//		3. B.L.L와의 의존관계 형성
		IMemberService service = new MemberServiceImpl();
//		4. 로직 선택
		List<MemberVO> memberList = service.retrieveMemberList();
//		5. 컨텐츠(Model) 확
//		6. V.L 를 선택
		String view = "/WEB-INF/views/member/memberList.jsp";
//		7. Scope 를 통해 Model 공유
		req.setAttribute("memberList", memberList);
//		8. 이동 방식을 결정하고, V.L로 이동
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);
		
	}
}
