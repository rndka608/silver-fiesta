<%@page import="kr.or.ddit.web.useragent.SystemType"%>
<%@page import="kr.or.ddit.web.useragent.BrowserType"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03/userAgent.jsp</title>
</head>
<body>
<!-- 클라이언트의 시스템과 브라우저에 대한 정보를 확인. -->
<!-- 클라이언트의 시스템이 -->
<!-- 데스크탑이라면, "당신의 시스템은 데스크탑입니다." -->
<!-- 모바일이라면, "당신의 시스템은 모바일입니다." -->
<!-- 브라우저가 chrom이라면"당신의 브라우저는 크롬입니다." -->
<!-- 브라우저가 firefox이라면 "당신의 브라우저는 파이어폭스입니다." -->
<!-- 와 같은 형태의 메시지를 출력. -->
<div id="msgArea">
<%
	String result = null;

	String userAgent = request.getHeader("user-agent");
	BrowserType browser = BrowserType.getBrowserType(userAgent);
	result = browser.getBrowserName();
	String systemMsg = "당신의 시스템은 %s입니다.";
	SystemType system = SystemType.getSystemType(userAgent);
	String result2 = system.getSystemName();
%>
<%=result%><br>
<%=String.format(systemMsg,result2) %>
</div>
</body>
</html>