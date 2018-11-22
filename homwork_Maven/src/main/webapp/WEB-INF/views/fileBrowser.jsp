<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
	    var fileForm = document.fileForm;
	    //ul안에 있는 li들을 더블클릭하면 경로와 이름을 가지고 form이 넘어간다.
		$("#fileList>li").on("dblclick", function() {
// 			alert($(this).text());
			fileForm.path.value=$(this).attr('value');
			fileForm.name.value=$(this).text();
			fileForm.submit();

		});
	    
	})
	function name() {
		
	}
</script>
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="file" class="java.util.ArrayList" scope="request" />
	<ul id="fileList">
		<%
			//file만큼 for문을 돌려서 li를 만들어준다.
			String pattern = "<li value=%s >%s</li>";
			for (Object name : file) {
				File ss = (File) name; //Object인 name을 File로 다운캐스팅 해준다.
				out.println(String.format(pattern, ss.getAbsolutePath(), ss.getName()));
				// li value값에 경로를 넣어주고, li사이에 이름을 넣어서 출력해준다.
			}
		%>
	</ul>
	<form method="get" name="fileForm" >
	<input name="path" value="" type="hidden" />
	<input name="name" value="" type="hidden" />
	<input type="radio" name="radio" value="delete"/>삭제
	<input type="radio" name="radio" value="copy"/>복사
	<input type="radio" name="radio" value="move"/>이동
	
	
	</form>
</body>
</html>