<%@page import="java.util.Locale"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.util.Calendar"%>
<%@page import="static java.util.Calendar.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.sunday{
		background-color: red;
	}
	.saturday{
		background-color: blue;
	}
	table{
		width: 100%;
		height: 500px;
		border-collapse: collapse;
	}
	td,th{
		border: 1px solid black;
	}
</style>
<script type="text/javascript">
	function eventHandler(year,month) {
		var form = document.calForm;
		if((year && month) || month==0){
			form.year.value = year;			
			form.month.value = month;
		}
		
		form.submit();
		return false;	
	}
</script>

<%
	request.setCharacterEncoding("UTF-8");  //UTF-8로 인코딩 
	String yearStr = request.getParameter("year"); //파라미터값으로 year을 받는다.
	String monthStr = request.getParameter("month"); //파라미터값으로 month를 받는다.
	String language = request.getParameter("language"); //파라미터값으로 language를 받는다.
	Locale clinetLocale = request.getLocale(); //Client언어를 불러온다.
	
	//언어를 선택하면 그 언어로 바뀌게 설정
	if(language!=null && language.trim().length()>0){ //선택한 언어가 있다면
		clinetLocale = Locale.forLanguageTag(language); //그 선택언어로 바뀌게 설정
	}
	DateFormatSymbols symbols = new DateFormatSymbols(clinetLocale); 
	
	
	Calendar cal = getInstance(); //캘린더 객체 불러오기
	
	//if문에 속하면 파라미터값으로 받은 년/월로 셋팅된다.
	if(yearStr !=null && yearStr.matches("\\d{4}")
			&& monthStr != null && monthStr.matches("1[0-1]|\\d")){
		cal.set(YEAR, Integer.parseInt(yearStr));
		cal.set(MONTH, Integer.parseInt(monthStr));
	}
	int currentYear = cal.get(YEAR); //현재 년도
	int currentMonth = cal.get(MONTH); //현재 월
	
	//1일이 몇요일인지 셋팅해주기 위한 것.
	cal.set(DAY_OF_MONTH, 1);  
	int firstDayOfWeek = cal.get(DAY_OF_WEEK); 
	int offset = firstDayOfWeek -1;
	int lastDate = cal.getActualMaximum(DAY_OF_MONTH);
	
	//이전달
	cal.add(MONTH, -1);
	int beforYear = cal.get(YEAR);
	int beforMonth = cal.get(MONTH);
	
	//다음달
	cal.add(MONTH, 2);
	int nextYear = cal.get(YEAR);
	int nextMonth = cal.get(MONTH);
	
	//현재 시스템에서 제공하는 모든 locale정보 제공
	Locale[] locales = Locale.getAvailableLocales();
%>
<form name="calForm" method="post">
<h4>
<a href="javascript:eventHandler(<%=beforYear%>, <%=beforMonth%>);">이전달</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="number" name="year" value="<%=currentYear%>"
	onblur="eventHandler();"
/>년
<select name="month" onchange="eventHandler();">
	<%
		//월 출력하기 
		String[] monthStrings = symbols.getShortMonths();
		for(int idx = 0; idx < monthStrings.length-1; idx++){
			out.println(String.format("<option value='%d' %s>%s</option>", 
					idx, idx==currentMonth?"selected":"" ,monthStrings[idx]));
		}
	%>
</select>
<select name="language" onchange="eventHandler();">
	<%
		//언어선택 UI	
		for(Locale tmp : locales){
			out.println(String.format("<option value='%s' %s>%s</option>", tmp.toLanguageTag(),
					tmp.equals(clinetLocale)?"selected":"",tmp.getDisplayLanguage(clinetLocale)));			
		}
	%>
</select>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a onclick="eventHandler(<%=nextYear%>, <%=nextMonth%>);">다음달</a>
</h4>
<input type="hidden" value="calendar" name="command"/>
</form>
<table>
<thead>
	<tr>
		<%
			//요일출력
			String[] dateStrings = symbols.getShortWeekdays();
			for(int idx = Calendar.SUNDAY; idx<=Calendar.SATURDAY; idx++){
				out.println(String.format("<th>%s</th>", dateStrings[idx]));
			}
		%>
	</tr>
</thead>
<tbody>

<%
	//날짜 출력
	int dayCount = 1;
	for(int row=1; row <=6; row++){
		%>
		<tr>
		<%
		for(int col=1; col <=7; col++){
			int dateChar = dayCount++ - offset; //날짜를 맞게 출력
			if(dateChar < 1 || dateChar > lastDate){ //
				out.println("<td>&nbsp;</td>");
			}else{	
				String clzValue = "normal";
				if(col==1){
					clzValue = "sunday"; //style적용
				}else if(col==7){
					clzValue = "saturday"; //style적용
				}
			out.println(String.format(
					"<td class='%s'>%d</td>", clzValue, dateChar
					));
			}
		}
		%>
		</tr>
		<%
	}
%>
</tbody>
</table>
