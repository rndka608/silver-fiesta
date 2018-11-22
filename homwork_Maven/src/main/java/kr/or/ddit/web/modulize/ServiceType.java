package kr.or.ddit.web.modulize;
import org.apache.commons.lang3.StringUtils;

public enum ServiceType {
	GUGUDAN("/01/gugudanForm.html"),
	LYRICS("/02/musicForm.jsp"),
	CALENDAR("/04/calendar.jsp"),
	IMAGE("/imageForm"),
	GUGUDANFORM("/gugudan.do"),
	CALENDARFORM("/04/calendar.jsp"),
	LOGIN("/login/loginForm.jsp"),
	LOGINCHECK("/login/loginCheck.jsp");
	private String juso;
	
	ServiceType(String juso){
		this.juso = juso;
	}
	public String getJuso() {
		return this.juso;
	}
	
	public static ServiceType getUrl(String juso) {
		ServiceType result = GUGUDAN;
		if(StringUtils.isNotBlank(juso)) {
			for(ServiceType tmp : ServiceType.values()) {
				if(juso.toUpperCase().equals(tmp.name())) {
					result = tmp;
					break;
				}
			}
		}
		return result;
		
	}
	
}
