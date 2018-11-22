<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
    
    Calendar now = Calendar.getInstance();
    int year = now.get(Calendar.YEAR);
    int month = now.get(Calendar.MONTH)+1;
    
    String selectyear = request.getParameter("year");
    String selectmonth = request.getParameter("month");
    
    if(selectyear != null)
        year = Integer.parseInt(selectyear);
    
    if(selectmonth != null)
        month = Integer.parseInt(selectmonth);
    
    now.set(year, month-1, 1);    //출력할 년도, 월로 설정
    
    year = now.get(Calendar.YEAR);    //변화된 년, 월
    month = now.get(Calendar.MONTH) + 1;
    
    int end = now.getActualMaximum(Calendar.DAY_OF_MONTH);    //해당월의 마지막 날짜
    int w = now.get(Calendar.DAY_OF_WEEK);    //1~7(일~토)
    
    
%>
<%
	String lang = request.getParameter("lang");
	Locale currentLocale = request.getLocale();
	if(lang!=null && lang.trim().length()!=0){
		currentLocale = Locale.forLanguageTag(lang);	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <script type="text/javascript">
            function sendIt()
            {
                var f = document.forms[0];
                f.submit();
            }
        </script>
        
</head>
<body>  
<form name="langForm">
<select name = "lang" onchange="changeHandler();">
<%
	Locale[] locales = Locale.getAvailableLocales();
%>
	<option value="" >언어 선택</option>
	<%
		String optPattern = "<option value='%s' %s>%s</option>";
		for(Locale tmp :locales){
			String value = tmp.toLanguageTag();
			String text = tmp.getDisplayLanguage();
			String selected="";
			if(currentLocale.equals(tmp)){
				selected ="selected";
			}
			if(text!=null && text.trim().length()!=0){
			out.println(String.format(optPattern, value,selected, text));
			}
		}
	%>
</select>
</form>
			<form action="calendar.jsp" method="post" align="center">
        	<select name="year" onchange="sendIt()">
        		<%for(int i=year-5; i<year; i++) { %>
            <option value="<%=i%>" > <%=i%>년</option>
                                 <%} %>
                                  <option value="<%=year%>" selected="selected"><%=year%>년</option>
                                    <%for(int i=year+1; i<year+5; i++) { %>
                                        <option value="<%=i%>" > <%=i%>년</option>
                                    <%} %>
        	</select>
        	<select name="month" onchange="sendIt()">
        	  <% for(int i=1; i<=12; i++) {%>
                  <option value="<%=i%>" <%=month==i?"selected='selected'":"" %>> <%=i%>월 </option>
              <%} %>
        	</select>
			</form>
            <table align="center">
                <tr height="30">
                    <td align="center">
                        <a href="calendar.jsp?year=<%=year%>&month=<%=month-1%>">◀</a>
                        <b><%=year %>년 <%=month %>월</b>
                        <a href="calendar.jsp?year=<%=year%>&month=<%=month+1%>">▶</a>
                    </td>
                </tr>
            </table>
            
            <table align="center">
                <tr height="25">
                    <td align="center">일</td>
                    <td align="center">월</td>
                    <td align="center">화</td>
                    <td align="center">수</td>
                    <td align="center">목</td>
                    <td align="center">금</td>
                    <td align="center">토</td>
                </tr>
                <%
                    int newLine = 0;
                    //1일이 어느 요일에서 시작하느냐에 따른 빈칸 삽입
                    out.println("<tr height='25'>");
                    for(int i=1; i<w; i++)
                    {
                        out.println("<td>&nbsp;</td>");
                        newLine++;
                    }
                    
                    
                    for(int i=1; i<=end; i++)
                    {
                        
                       
                        out.println("<td align='center'>"
                                + i + "</td>");
                        newLine++;
                        if(newLine == 7 && i != end)
                        {
                            out.println("</tr>");
                            out.println("<tr height='25'>");
                            newLine = 0;
                        }
                    }
                    
                    while(newLine>0 && newLine<7)
                    {
                        out.println("&nbsp;");
                        newLine++;    
                    }
                    out.println("</tr>");
                %>
            </table>
        
    </body>
</html>