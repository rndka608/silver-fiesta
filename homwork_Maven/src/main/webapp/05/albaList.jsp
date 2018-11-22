<%@page import="kr.or.ddit.web.SimpleFormProcessServlet"%>
<%@page import="kr.or.ddit.vo.AlbasengVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map.Entry"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05/albaList.jsp</title>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>알바생코드</th>
			<th>이름</th>
			<th>주소</th>
			<th>연락처</th>
			
		</tr>
	</thead>
	<tbody>
		
		<% //맵에 사이즈만큼 ENTRY KEY꺼내오기
		//getAttribute로 꺼내온다.
		Map<String,AlbasengVO> parameterMap = (Map<String,AlbasengVO>)getServletContext().getAttribute("albasengs");
		
		for (Entry<String, AlbasengVO> entry : parameterMap.entrySet()) {
		%>
			<tr>
		<%
			//머리부분 삽입
			//ㄷㄱㄷㄱㄷㄱ
			String name = entry.getKey();
			AlbasengVO value = entry.getValue();
			out.print("<td>"+name+"</td>");
			out.print("<td>"+value.getName()+"</td>");
			out.print("<td>"+value.getAddress()+"</td>");
			out.print("<td>"+value.getTel()+"</td>");
		%>
		</tr>
		<%
		}
		%>
	</tbody>
</table>
</body>
</html>