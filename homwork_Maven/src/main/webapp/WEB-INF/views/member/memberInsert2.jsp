<%@page import="kr.or.ddit.ServiceResult"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 1. 파라미터 확보(특수문자 고려) -->
<!-- 2. 검증(검증룰 : member 테이블의 스키마를 확인, 필수데이터 검증은 반드시!!) -->
<!-- 3. 검증통과 -->
<!-- 	1) 로직객체와의 의존관계 형셩 -->
<!-- 	2) 로직 선택(registMember) -->
<!-- 		PKDUPLICATED : memberFor.jsp 로 이동(메시지, 기존 입력데이터 공유 - dispatch 또는 forward) -->
<!-- 		OK : memberList.jsp 로 이동. redirect -->
<!-- 		FAILED : memberFor.jsp 로 이동(기존 입력데이터, 메시지 공유 - forward) -->
<!-- 4. 검증불통과 -->
<!-- 	memberFor.jsp 로 이동, (기존 입력데이터, 검증 결과 메시지 공유 - forward) -->

<%

	request.setCharacterEncoding("UTF-8");

	String mem_id = request.getParameter("mem_id");
	String mem_pass = request.getParameter("mem_pass");
	String mem_name = request.getParameter("mem_name");
	String mem_regno1 = request.getParameter("mem_regno1");
	String mem_regno2 = request.getParameter("mem_regno2");
	String mem_bir = request.getParameter("mem_bir");
	String mem_zip = request.getParameter("mem_zip");
	String mem_add1 = request.getParameter("mem_add1");
	String mem_add2 = request.getParameter("mem_add2");
	String mem_hometel = request.getParameter("mem_hometel");
	String mem_comtel = request.getParameter("mem_comtel");
	String mem_hp = request.getParameter("mem_hp");
	String mem_mail = request.getParameter("mem_mail");
	String mem_job = request.getParameter("mem_job");
	String mem_like = request.getParameter("mem_like");
	String mem_memorial = request.getParameter("mem_memorial");
	String mem_memorialday = request.getParameter("mem_memorialday");
%>

<%
	boolean valid = true;
	if(StringUtils.isBlank(mem_id) || StringUtils.isBlank(mem_pass) || StringUtils.isBlank(mem_name)
			|| StringUtils.isBlank(mem_zip) || StringUtils.isBlank(mem_add1)|| StringUtils.isBlank(mem_add2)){
		valid = false;
	}

	MemberVO vo = new MemberVO();
	
	vo.setMem_id(mem_id);
	vo.setMem_pass(mem_pass);
	vo.setMem_name(mem_name);
	vo.setMem_regno1(mem_regno1);
	vo.setMem_regno2(mem_regno2);
	vo.setMem_bir(mem_bir);
	vo.setMem_zip(mem_zip);
	vo.setMem_add1(mem_add1);
	vo.setMem_add2(mem_add2);
	vo.setMem_hometel(mem_hometel);
	vo.setMem_comtel(mem_comtel);
	vo.setMem_hp(mem_hp);
	vo.setMem_mail(mem_mail);
	vo.setMem_job(mem_job);
	vo.setMem_like(mem_like);
	vo.setMem_memorial(mem_memorial);
	vo.setMem_memorialday(mem_memorialday);
	
	if(valid){
		IMemberService service = new MemberServiceImpl();
		ServiceResult result =  service.registMember(vo);
		if(result ==  ServiceResult.OK){
			response.sendRedirect(request.getContextPath() + "/member/memberList.jsp");
		}
	}else {
		request.setAttribute("membervo", vo);
		RequestDispatcher rd = request.getRequestDispatcher("/member/memberForm.jsp");
		rd.forward(request, response); //request안에는 파라미터가 들어있음 그 파라미터를 고스란히 도착지쪽으로 넘겨준다.
	}
%>



