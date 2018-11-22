<%@page import="java.util.Objects"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
// 	MemberVO vo = (MemberVO)request.getAttribute("membervo");
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4> 회원 가입 </h4>
<form action="<%=request.getContextPath()%>/member/memberInsert.jsp" method="post">
<jsp:useBean id="vo" class="kr.or.ddit.vo.MemberVO" scope="request"></jsp:useBean>
<table>
	<tr>
		<th>회원아이디</th>
		<td>
			<input type="text" name="mem_id" value="<%=Objects.toString(vo.getMem_id(),"")%>" />
		</td>
	</tr>
	
	<tr>
		<th>회원비밀번호</th>
		<td>
			<input type="password" name="mem_pass" value="<%=Objects.toString(vo.getMem_pass(),"")%>"/>
		</td>
	</tr>

	<tr>
		<th>회원이름</th>
		<td>
			<input type="text" name="mem_name" value="<%=Objects.toString(vo.getMem_name(),"")%>"/>
		</td>
	</tr>

	<tr>
		<th>주민등록번호</th>
		<td>
			<input type="text" name="mem_regno1" value="<%=Objects.toString(vo.getMem_regno1(),"")%>" /> - <input type="password" name="mem_regno2" value="<%=Objects.toString(vo.getMem_regno2(),"")%>"/>
		</td>
	</tr>
	
	<tr>
		<th>생년월일</th>
		<td>
			<input type="text" name="mem_bir"/>
		</td>
	</tr>
	
	<tr>
		<th>우편번호</th>
		<td>
		    <input type="text" name="mem_zip" value="<%=Objects.toString(vo.getMem_zip(),"")%>"/>
		</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td>
		    <input type="text" name="mem_add1" value="<%=Objects.toString(vo.getMem_add1(),"")%>"/>
		</td>
	</tr>
	
	<tr>
		<th>상세주소</th>
		<td>
		    <input type="text" name="mem_add2" value="<%=Objects.toString(vo.getMem_add2(),"")%>" />
		</td>
	</tr>
	
	<tr>
		<th>전화번호</th>
		<td>
		    <input type="text" name="mem_hometel" value="<%=Objects.toString(vo.getMem_hometel(),"")%>"/>
		</td>
	</tr>
	
	<tr>
		<th>전화번호2</th>
		<td>
		    <input type="text" name="mem_comtel" value="<%=Objects.toString(vo.getMem_comtel(),"")%>" />
		</td>
	</tr>
	
	<tr>
		<th>휴대전화</th>
		<td>
		    <input type="text" name="mem_hp" value="<%=Objects.toString(vo.getMem_hp(),"")%>"/>
		</td>
	</tr>
	
	<tr>
		<th>이메일</th>
		<td>
		    <input type="text" name="mem_mail" value="<%=Objects.toString(vo.getMem_mail(),"")%>"/>
		</td>
	</tr>
	
	<tr>
		<th>직업</th>
		<td>
		    <input type="text" name="mem_job" value="<%=Objects.toString(vo.getMem_job(),"")%>"/>
		</td>
	</tr>
	
	<tr>
		<th>취미</th>
		<td>
		    <input type="text" name="mem_like" value="<%=Objects.toString(vo.getMem_like(),"")%>"/>
		</td>
	</tr>
	
	<tr>
		<th>기념일내용</th>
		<td>
		    <input type="text" name="mem_memorial" value="<%=Objects.toString(vo.getMem_memorial(),"")%>"/>
		</td>
	</tr>
	
	<tr>
		<th>기념일날짜</th>
		<td>
		    <input type="text" name="mem_memorialday" />
		</td>
	</tr>
	
		
	<tr>
		<td colspan="2">
			<input type="submit" value="등록"/>
			<input type="reset" value="취소"/>
		</td>
	</tr>
</table>

</form>
</body>
</html>