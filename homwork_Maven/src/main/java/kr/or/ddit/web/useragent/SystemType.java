package kr.or.ddit.web.useragent;

public enum SystemType {
	DSKTOP(new String[] {"windows nt", "linux"},"데스크탑"),
	MOBILE(new String[] {"android", "iphone"},"모바일"),
	OTHER(new String[] {},"기타등등");
	
	private String[] keywords;
	private String systemName;
	private SystemType(String[] keywords, String systemName) {
		this.keywords = keywords;
		this.systemName = systemName;
	}
	
	public String getSystemName() {
		return systemName;
	}
	public boolean matches(String userAgent){
		userAgent = userAgent.toLowerCase();
		boolean result = false;
		for(String word : keywords) {
			result = userAgent.contains(word);
			if(result) break;
		}
		return result;
		
	}
	
	public static SystemType getSystemType(String userAgent){
		SystemType result = OTHER;
		for(SystemType tmp : values()) {
			if(tmp.matches(userAgent)) {
				result = tmp;
				break;
			}
		}
		return result;
	}
	
}
