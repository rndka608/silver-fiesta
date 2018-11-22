<%@page import="kr.or.ddit.ServiceResult"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.AuthenticateServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IAuthenticateService"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.or.ddit.db.ConnectionFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="kr.or.ddit.utils.CookieUtil.TextType"%>
<%@page import="kr.or.ddit.utils.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 1. 파라미터 확보 -->
<!-- 2. 검증(필수 데이터) -->
<!-- 3. 불통 -->
<!-- 	이동(loginForm.jsp, 기존에 입력했던 아이디를 그대로 전달할 수 있는 방식.) -->
<!-- 4. 통과 -->
<!-- 	4-1. 인증(아이디==비번) -->
<!-- 	4-2. 인증 성공 : 웰컴 페이지로 이동(원본 요청을 제거하고 이동) -->
<!-- 	4-3. 인증 실패 : 이동(loginForm.jsp, 기존에 입력했던 아이디를 그대로 전달할 수 있는 방식. ) -->
<%
	
	request.setCharacterEncoding("UTF-8"); //특수문자가 들어올 수도 있으니까 인코딩해준다.
	
	String id = request.getParameter("mem_id"); 
	String pass = request.getParameter("mem_pass");
	String idChecked = request.getParameter("idChecked");
	String goPage = null; // 도착지 설정
	//검증
	boolean redirect = false;
	if(id==null || id.trim().length()==0 ||pass==null || pass.trim().length()==0 ){
// 		goPage = "/login/loginForm.jsp?error=1";
		goPage = "/?command=login";
		redirect = true;
		session.setAttribute("error", 1);
		session.setAttribute("message", "아이디나 비번 누락");
	}else{
		IAuthenticateService service = new AuthenticateServiceImpl();
		Object result =  service.authenticate(new MemberVO(id, pass));
		if(result instanceof MemberVO){
			goPage = "/";
			redirect = true;
			session.setAttribute("authMember", result);
			int maxAge = 0;
			if(StringUtils.isNotBlank(idChecked)){
				maxAge = 60*60*24*7;
				Cookie cookieId = CookieUtil.createCookie("IDCookie", id,request.getContextPath(),TextType.PATH,maxAge);
				response.addCookie(cookieId);
			}
			else{
				Cookie cookieId = CookieUtil.createCookie("IDCookie", id,request.getContextPath(),TextType.PATH,0);
				response.addCookie(cookieId);
			}
		}else if(result == ServiceResult.PKNOTFOUND){
// 			goPage = "/login/loginForm.jsp?error=1";		
			goPage = "/?command=login";
			redirect = true;
		session.setAttribute("error", 1);
		session.setAttribute("message", "존재하지 않는 회원임다");
		}else{
			goPage = "/?command=login";		
			redirect = true;
		session.setAttribute("error", 1);
		session.setAttribute("message", "비번 오류로 인증 실패");
		}
		
	}	
	if(redirect){
		response.sendRedirect(request.getContextPath() + goPage);
	}else{
		RequestDispatcher rd = request.getRequestDispatcher(goPage);
		rd.forward(request, response); //request안에는 파라미터가 들어있음 그 파라미터를 고스란히 도착지쪽으로 넘겨준다.
	}
	
	
	
%>	
