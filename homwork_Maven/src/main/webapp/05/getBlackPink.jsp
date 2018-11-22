<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
1. 파라미터 확보
2. 검증 (필수 데이터 검증, 유효데이터 검증)
3. 불통
	1) 필수데이터 누락 : 400
	2) 우리가 관리하지 않는 멤버를 요구한 경우 : 404
4. 통과
      이동(맵에 있는 개인 페이지, 클라이언트가 멤버 개인페이지의 주소를 모르도록)
      이동(맵에 있는 개인 페이지, getBTS 에서 원본 요청을 모두 처리했을 경우, UI 페이지로 이동할 떄.)
<%!
	Map<String,String[]> singerMap = new LinkedHashMap<>();
{
	singerMap.put("B001", new String[]{"제니","/WEB-INF/blackpink/jenny.jsp"});
	singerMap.put("B002", new String[]{"지수","/WEB-INF/blackpink/jisoo.jsp"});
	singerMap.put("B003", new String[]{"리사","/WEB-INF/blackpink/risa.jsp"});
	singerMap.put("B004", new String[]{"로제","/WEB-INF/blackpink/roje.jsp"});
}
%>

<%
	String member = request.getParameter("member"); //파라미터 넘겨주기
	int statusCode = 0;
	if(member==null || member.trim().length()==0){ //필수데이터 검증
		statusCode = HttpServletResponse.SC_BAD_REQUEST;
	}else if(!singerMap.containsKey(member)){ //해당하는 가수가 있는지 검증
		statusCode = HttpServletResponse.SC_NOT_FOUND;
	}
	
	//에러가 있는 상황이라면 에러코드를 내보내고 return한다.
	if(statusCode!=0){
		response.sendError(statusCode);
		return;
	}
		
	//가지고 온 파라미터와 map에 있는 주소 값을 가져온다.
	String[] value= singerMap.get(member);
	String goPage = value[1];
	
	//클라이언트가 개인페이지의 주소를 모르게 하기 위해서는 dispatch를 사용해야한다. (그렇게 되면 blackpinkform.jsp에서 나온걸로 클라이언트는 착각하게된다.)
	RequestDispatcher rd =  request.getRequestDispatcher(goPage);
	rd.forward(request, response);
	
	//맵에 있는 개인페이지주소가 보이게 된다. 클라이언트에서 처리되기 때문에 getContextPath를 적어줘야한다.
// 	response.sendRedirect(request.getContextPath() + goPage);
	
	
	
	
%>
