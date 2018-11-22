<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.web.modulize.ServiceType"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   	MemberVO authMember = (MemberVO)session.getAttribute("authMember");
    String cmdParam = request.getParameter("command");
    int statusCode = 0;
    String includePage = "";
   	if(StringUtils.isNotBlank(cmdParam)){
   		try{
	   	   	ServiceType u = ServiceType.getUrl(cmdParam);   			
	   	 	includePage = u.getJuso();
   		}catch(IllegalArgumentException e){
   			statusCode = HttpServletResponse.SC_NOT_FOUND;		
   		}
   		
   	}
   	if(statusCode !=0){
   		response.sendError(statusCode);
   		return;
   	}
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet">
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
</head>
<body>
<div id="top">
	<jsp:include page="/includee/header.jsp"/>
</div>
<div id="left">
	<jsp:include page="/includee/left.jsp"/>
</div>
<div id="body" style="overflow-y: auto;">
	<%
		if(StringUtils.isNotBlank(includePage)){
	%>
	<jsp:include page="<%=includePage%>"></jsp:include>
	<%
		}else{
	%>
<H4>웰컴 페이지</H4>
<pre>
	처음부터 웰컴 페이지로 접속하거나,
	로그인에 성공해서 웰컴 페이지로 접속하는 경우의 수가 있음.
	<%
		if(authMember==null){
	%>
<%-- 			<a href = "<%=request.getContextPath()%>/login/loginForm.jsp">로그인하러 가기</a> --%>
			<a href = "<%=request.getContextPath()%>/?command=login">로그인하러 가기</a>
	<%
		}else if(authMember!=null){
	%>
		<a href="<%=request.getContextPath() %>/member/mypage.do"><%=authMember.getMem_name() %></a>님(<%=authMember.getMem_auth() %>)
			<a href = "<%=request.getContextPath()%>/login/logout.jsp">로그아웃하러 가기</a>
	<%
		}
	}
	%>	
</pre>
</div>
<div id="footer">
	<%
		pageContext.include("/includee/footer.jsp");
	%>
</div>
</body>
</html>