<%@page import="kr.or.ddit.utils.CookieUtil"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	//requestA를 의미함.
	String failedId = request.getParameter("mem_id");
 	String message = (String)session.getAttribute("message");//object이기 떄문에 다운캐스팅이 필요하다
 	String ids = new CookieUtil(request).getCookieValue("IDCookie");
 	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login/loginForm.jsp</title>

<script>
	<%
		if(StringUtils.isNotBlank(message)){
			
	%>
	alert("<%=message%>");
	<%
			session.removeAttribute("message");
		}
	%>
</script>


</head>
<body>
<form action="<%=request.getContextPath()%>/login/loginCheck.jsp" method="post">
<!-- <form action="./" method="get"> -->
	<ul>
		<li>
			아이디 : <input type="text" name="mem_id" value="<%=Objects.toString(ids,"")%>"/>
			<label>
			<input type="checkbox" name="idChecked" value="idSaved" <%=StringUtils.isNotBlank(ids)?"CHECKED":"" %>/>아이디기억하기
			</label>
		</li>
		<li>
			비밀번호 : <input type="password" name="mem_pass" />
			<input type="submit" value="로그인"/>
		</li>
		
	</ul>
<!-- 	<input type="hidden" name="command" value="logincheck"/> -->
</form>
</body>
</html>