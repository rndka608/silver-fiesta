<%@page import="kr.or.ddit.web.model2.FileListGenerator"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	FileListGenerator fig = new FileListGenerator();
	//서블릿에 있는 파일리스트를 가져온다.
	File[] files = (File[])request.getAttribute("files");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  
<script type="text/javascript">
$(function () {
//     $('a').dblclick(function moveFile(fileAddr) {
//         //더블 클릭 
//     	var fform = document.fileForm;
// 		fform.fileAddress.value = fileAddr;
// 		fform.submit();
//     }).click(function(){
// 	return false;
//     });
    $('li').on('dblclick',function(){
		var fform = document.fileForm;
		fform.fileAddress.value =$(this).attr('value') ;
		fform.submit();
    });
    
    $()
});


	
	
	function moveFile(fileAddr){
		var fform = document.fileForm;
		fform.fileAddress.value = fileAddr;
		fform.submit();
	}
	
	

	
</script>
</head>
<body>
	<form name="fileForm" action="<%=request.getContextPath()%>/fileBrowser.do"> 
	<ul>
	<%
		for(File tmp : files){
			String url =tmp.getAbsolutePath();
			url = url.replaceAll("\\\\", "/");
			if(tmp.isDirectory()){
			
		%>
<%-- 			<li><a href="javascript:moveFile('<%=url %>');"><%=tmp.getName() %></a></li>	 --%>
			<li value="<%=url %>"><%=tmp.getName() %></li>	
		<% 	
		} else {
		%>
			<li><%=tmp.getName() %></li>			
		<% 
		}
	}
	%>
	</ul>
	<%
		String backurl = files[0].getParentFile().getAbsolutePath();
		backurl = backurl.substring(0, backurl.lastIndexOf("\\"));
		backurl = backurl.replaceAll("\\\\","/");
		
		if(backurl.contains("WebContent")){
		%>
			<a href="javascript:moveFile('<%=backurl%>');">뒤로가기</a>
		<%
		}
		%>
	<input value="" name="fileAddress" type="hidden"/>	
	<input type="button" value="복사" onclick="copy" id="copy"/>	
	</form>
</body>
</html>