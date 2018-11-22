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

@WebServlet("/member/memberInsert.do")
public class MemberInsertServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view ="/WEB-INF/views/member/memberForm.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8"); //특수문자 고려하여 인코딩을 해준다.
	
//	<jsp:useBean id="member" class="kr.or.ddit.vo.MemberVO" scope="request"></jsp:useBean>
		MemberVO member = new MemberVO();
		req.setAttribute("member", member);
//	<jsp:setProperty name="member" property="*" />
//		member.setMem_id(req.getParameter("mem_id"));
		try {
			BeanUtils.populate(member, req.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			throw new CommonException(e);
		}
		
	
		String goPage = null; //이동하는 페이지
		boolean redirect = false; // 전송방법
		String message = null; //에러메시지 
		Map<String, String> errors = new LinkedHashMap<>();
		req.setAttribute("errors", errors);
		boolean valid = validate(member, errors);
		System.err.println(errors.size());
		if (valid) {
			//로직 객체와의 의존관계 형성
			IMemberService service = new MemberServiceImpl();
			ServiceResult result = service.registMember(member);
			switch (result) {
			case PKDUPLICATED:
				goPage = "/WEB-INF/views/member/memberForm.jsp";
				message = "아이디가 중복되셨슴다";
				break;
			case FAILE:
				goPage = "/WEB-INF/views/member/memberForm.jsp";
				message = "서버 오류로 실패, 잠시 뒤 다시 시도해주세욤";
				break;
			case OK:
				goPage = "/member/memberList.do";
				redirect = true;
				break;
			}
			req.setAttribute("message", message);
		} else {
			goPage = "/WEB-INF/views/member/memberForm.jsp";
		}

		if (redirect) {
			resp.sendRedirect(req.getContextPath() + goPage);
		} else {
			RequestDispatcher rd = req.getRequestDispatcher(goPage);
			rd.forward(req, resp);
		}
		
	
	}
	//에러를 표시하는데 맵을 왜사용하는거야 도대체
		private boolean validate(MemberVO member, Map<String, String> errors) {
			boolean valid = true;
			//검증룰
			if (StringUtils.isBlank(member.getMem_id())) {
				valid = false;
				errors.put("mem_id", "회원아이디 누락");
			}
			if (StringUtils.isBlank(member.getMem_pass())) {
				valid = false;
				errors.put("mem_pass", "비밀번호 누락");
			}
			if (StringUtils.isBlank(member.getMem_name())) {
				valid = false;
				errors.put("mem_name", "회원명 누락");
			}
			if (StringUtils.isBlank(member.getMem_zip())) {
				valid = false;
				errors.put("mem_zip", "우편번호 누락");
			}
			if (StringUtils.isBlank(member.getMem_add1())) {
				valid = false;
				errors.put("mem_add1", "주소1 누락");
			}
			if (StringUtils.isBlank(member.getMem_add2())) {
				valid = false;
				errors.put("mem_add2", "주소2 누락");
			}
			if (StringUtils.isBlank(member.getMem_mail())) {
				valid = false;
				errors.put("mem_mail", "이메일 누락");
			}
			if(StringUtils.isNotBlank(member.getMem_bir())){
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				// formatting : 특정 타입의 데이터를 일정 형식의 문자열로 변환.
				// parsing : 일정한 형식의 문자열을 특정 타입의 데이터로 변환.
				try{
					formatter.parse(member.getMem_bir());
				}catch(ParseException e){
					valid = false;
					errors.put("mem_bir", "날짜 형식 확인");
				}
			}
			return valid;
		}
}
