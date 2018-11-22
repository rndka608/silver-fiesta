<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="kr.or.ddit.ServiceResult"%>
<%@page import="kr.or.ddit.buyer.service.BuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!private boolean validate(BuyerVO buyer, Map<String, String> errors){
	boolean valid = true;
		if (StringUtils.isBlank(buyer.getBuyer_id())) {
			valid = false;
			errors.put("buyer_id", "거래처아이디 누락");
		}
		if (StringUtils.isBlank(buyer.getBuyer_name())) {
			valid = false;
			errors.put("buyer_name", "거래처명 누락");
		}
		if (StringUtils.isBlank(buyer.getBuyer_comtel())) {
			valid = false;
			errors.put("buyer_comtel", "전화번호 누락");
		}
		if (StringUtils.isBlank(buyer.getBuyer_fax())) {
			valid = false;
			errors.put("buyer_fax", "팩스번호 누락");
		}
		if (StringUtils.isBlank(buyer.getBuyer_mail())) {
			valid = false;
			errors.put("buyer_mail", "이메일 누락");
		}
		return valid;
	}%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="buyer" class="kr.or.ddit.vo.BuyerVO" scope="request"></jsp:useBean>
<jsp:setProperty name="buyer" property="*" />
<%
	String goPage = null; //이동하는 페이지
	boolean redirect = false; // 전송방법
	String message = null; //에러메시지 
	Map<String, String> errors = new LinkedHashMap<>();
	request.setAttribute("errors", errors);
	boolean valid = validate(buyer, errors);
	System.err.println(errors.size());
	if (valid){
		IBuyerService service = new BuyerServiceImpl();
		ServiceResult result = service.registBuyer(buyer);
		switch (result) {
		case PKDUPLICATED:
			goPage = "/buyer/buyerForm.jsp";
			message = "아이디가 중복되셨슴다";
			break;
		case FAILE:
			goPage = "/buyer/buyerForm.jsp";
			message = "서버 오류로 실패, 잠시 뒤 다시 시도해주세욤";
			break;
		case OK:
			goPage = "/buyer/buyerList.jsp";
			redirect = true;
			break;
		}
		request.setAttribute("message", message);
	} else {	
		goPage = "/buyer/buyerForm.jsp";
	}
	
	if (redirect) {
		response.sendRedirect(request.getContextPath() + goPage);
	} else {
		RequestDispatcher rd = request.getRequestDispatcher(goPage);
		rd.forward(request, response);
	}
%>