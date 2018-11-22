package kr.or.ddit.web.calculate;


public enum Mime {
	PlAIN("text/plain;charset=UTF-8"),
	JSON("application/json;charset=UTF-8"),
	HTML("text/html;charset=UTF-8");
	
	private String code;

	Mime(String code){
		this.code = code;

	}
	public String getCode() {
		return this.code;
	}
	
	public static Mime getMime(String mime) {
		Mime result = Mime.PlAIN;
		Mime[] types = values();
		for(Mime tmp : types) {
			if(mime.toUpperCase().contains(tmp.name())) {
				result = tmp;
				break;
			}
		}
		return result;
	}

	

}
