package kr.or.ddit.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.CommonException;
import kr.or.ddit.ServiceResult;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;
@WebServlet("/member/memberDelete.do")
public class MemberDeleteServlet extends HttpServlet{
//1. ID와 PASSWORD 검증 ( 둘중에 하나 누락이면 bad_request)
//2. 검증통과하면 로직생성
//3. 요청과의 매핑설정
//4. 요청분석
//5. B.L.L 와의 의존관계 형성
//6. 로직선택
//7. 컨텐츠 확보
//8. 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mem_id =req.getParameter("mem_id");
		String mem_pass = req.getParameter("mem_pass");
		if(StringUtils.isBlank(mem_id)||StringUtils.isBlank(mem_pass)) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		IMemberService service = new MemberServiceImpl();
		ServiceResult result = service.removeMember(new MemberVO(mem_id, mem_pass));
		System.out.println(result);
		String goPage = null; //이동하는 페이지
		boolean redirect = false; // 전송방법
		String message = null; //에러메시지 
		switch (result) {
		case INVALIDPASSWORD:
//			goPage = "/member/memberView.do?who="+mem_id;
			goPage = "/member/mypage.do";
			message = "비밀번호가 일치하지 않습니당";
			redirect = true;
			break;
		case FAILE:
//			goPage = "/member/memberView.do?who="+mem_id;
			goPage = "/member/mypage.do";
			message = "서버 오류로 실패, 잠시 뒤 다시 시도해주세욤";
			redirect = true;
			break;
		default:
//			goPage = "/member/memberList.do";
			goPage = "/common/message.jsp";
			message = "탈퇴약관 : 일주일 이내에 같은 아이디로 재가입 불가불가";
			req.getSession().setAttribute("goLink", "/");
			req.getSession().setAttribute("isRemoved", new Boolean(true)); // 탈퇴가 됬는지 확인
			redirect = true;
			break;
		}
			req.getSession().setAttribute("message", message);
		
		if (redirect) {
			resp.sendRedirect(req.getContextPath() + goPage);
		} else {
			RequestDispatcher rd = req.getRequestDispatcher(goPage);
			rd.forward(req, resp);
		}
	}
	
	

}
