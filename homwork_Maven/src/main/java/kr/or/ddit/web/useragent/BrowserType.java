package kr.or.ddit.web.useragent;

public enum BrowserType {
	CHROME("당신의 브라우저는 크롬입니다."),
	FIREFOX("당신의 브라우저는 파이어복스입니다."),
	TRIDENT("당신의 브라우저는 익스플로러입니다."),
	OTHER("당신의 브라우저는 저도 모릅니다.");
	private String browserName;
	private BrowserType(String browserName) {
		this.browserName = browserName;
	}
	public String getBrowserName() {
		return this.browserName;
	}
	
	public static BrowserType getBrowserType(String userAgent) {
		BrowserType result = BrowserType.OTHER;
		BrowserType[] types = values();
		for(BrowserType tmp : types) {
			if(userAgent.toUpperCase().contains(tmp.name())) {
				result = tmp;
				break;
			}
		}
		return result;
	}
	
	
	
}
