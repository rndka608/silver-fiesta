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

@WebServlet("/member/memberUpdate.do")
public class MemberUpdateServlet extends HttpServlet {
	// xml 작성
	// dao 작성
	// service 작성
	
//	1. 요청과의 매핑 설정
//	2. 요청 분석(주소, 파라미터, 메소드, 헤더들...)
//	3. B.L.L와의 의존관계 형성
//	4. 로직 선택
//	5. 컨텐츠(Model) 확보
//	6. V.L 를 선택
//	7. Scope 를 통해 Model 공유
//	8. 이동 방식을 결정하고, V.L로 이동
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		MemberVO member = new MemberVO();
		req.setAttribute("member", member);
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
			ServiceResult result = service.modifyMember(member);
			System.out.println(result);
			switch (result) {
			case INVALIDPASSWORD:
				goPage = "/WEB-INF/views/member/memberView.jsp";
				message = "비밀번호가 일치하지 않습니당";
				break;
			case FAILE:
				goPage = "/WEB-INF/views/member/memberView.jsp";
				message = "서버 오류로 실패, 잠시 뒤 다시 시도해주세욤";
				break;
			case OK:
//				goPage = "/member/memberView.do?who="+member.getMem_id();
				goPage = "/member/mypage.do";
				redirect = true;
				break;
			}
			req.setAttribute("message", message);
		} else {
			goPage = "/WEB-INF/views/member/memberView.jsp";
		}
		
		if (redirect) {
			resp.sendRedirect(req.getContextPath() + goPage);
		} else {
			RequestDispatcher rd = req.getRequestDispatcher(goPage);
			rd.forward(req, resp);
		}
	}
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
