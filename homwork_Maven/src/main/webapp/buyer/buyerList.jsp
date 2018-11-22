<%@page import="kr.or.ddit.buyer.service.BuyerServiceImpl"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	IBuyerService service = new BuyerServiceImpl();
	List<BuyerVO> buyerList = service.retrieveBuyerList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyer/buyerList.jsp</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
</head>
<body>
	<h4>거래처 목록</h4>
	<input type="button" class="button" value="신규등록"
		onclick="location.href='<%=request.getContextPath()%>/buyer/buyerForm.jsp';">
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th>거래처아이디</th>
				<th>거래처명</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody>
			<%
				if (buyerList.size() > 0) {
					for (BuyerVO vo : buyerList) {
			%>
			<tr>
				<td><%=vo.getBuyer_id()%></td>
				<td><a
					href="<%=request.getContextPath()%>/buyer/buyerView.jsp?who=<%=vo.getBuyer_id()%>"><%=vo.getBuyer_name()%></a></td>
				<td><%=vo.getAddress()%></td>
				<td><%=vo.getBuyer_comtel()%></td>
				<td><%=vo.getBuyer_mail()%></td>
			</tr>
			<%
				}
				} else {
			%>
			<tr>
				<td colspan="6">회원의 목록이 없음.</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

</body>
</html>