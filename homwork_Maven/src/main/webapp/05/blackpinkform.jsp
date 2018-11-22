<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public Map<String,String[]> singerMap = new LinkedHashMap<>();
{
	singerMap.put("B001", new String[]{"제니","/WEB-INF/blackpink/jenny.jsp"});
	singerMap.put("B002", new String[]{"지수","/WEB-INF/blackpink/jisoo.jsp"});
	singerMap.put("B003", new String[]{"리사","/WEB-INF/blackpink/risa.jsp"});
	singerMap.put("B004", new String[]{"로제","/WEB-INF/blackpink/roje.jsp"});
	

}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05/blackpink.jsp</title>
<script>
	function changeMember() {
		document.singleForm.submit();
	}
</script>
</head>
<body>
<form name="singleForm" action="<%=request.getContextPath() %>/05/getBlackPink.jsp" >
	<select name="member" onchange="changeMember()">
		<option value="">멤버선택</option>
		<%
		
		for(Entry<String, String[]> entry : singerMap.entrySet()){
			String name = entry.getKey();
			String value = entry.getValue()[0];
			out.println(String.format("<option value='%s'>%s</option>",name, value));
		}
		%>
	</select>

</form>
</body>
</html>