package kr.or.ddit.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.web.calculate.Mime;
import kr.or.ddit.web.calculate.Operator;

public class CalculateServlet extends HttpServlet {
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		ServletContext application = getServletContext();
		String contentFolder = application.getInitParameter("contentFolder");
		File folder = new File(contentFolder);
		application.setAttribute("contentFolder", folder);
		System.out.println(getClass().getSimpleName()+" 초기화");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		// 파라미터 확보 (입력태그의 name 속성값으로 이름 결정)
		String leftOpStr = req.getParameter("leftOp");
		String rightOpStr = req.getParameter("rightOp");
		String operatorStr = req.getParameter("operator");
		
		// 검증
		int leftOp = 0;
		int rightOp = 0;;
		boolean valid = true;
		if(leftOpStr==null || !leftOpStr.matches("\\d+") 
			|| rightOpStr==null || !rightOpStr.matches("\\d{1,6}")) {
			
			valid=false;
		}
		Operator operator = null;
		//연산자 검증
		try {
			operator = Operator.valueOf(operatorStr.toUpperCase());
		}catch (Exception e) {
			valid=false;
		}
		
		//valid가 false가 될때
		if(!valid) {
			// 불통 400에러 발생
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		
		// 통과
		//	 연산자에 따라 연산 수행
		// 연산결과 : 2 * 3 = 6
		leftOp = Integer.parseInt(leftOpStr);
		rightOp = Integer.parseInt(rightOpStr);
		String pattern = "%d %s %d = %d";
		String result = String.format(pattern, leftOp, operator.getSign(), 
				rightOp, operator.operate(leftOp, rightOp));
		
		String accept = req.getHeader("Accept");
		Mime mime = Mime.getMime(accept);
		String mimeType = mime.getCode();
		if(accept.toUpperCase().contains(mime.name())) {
			result = "{\"result\":\""+result+"\"}";
		}else if(accept.toUpperCase().contains(mime.name())){
			result = "<p>" + result + "</p>";
		}	
		System.out.println(result);
		
		
		
		
		
		// 일반 텍스트의 형태로 연산 결과를 제공.
		//mime설정은 출력스트링을 개방하기전에 적어야함
		resp.setContentType(mimeType);
		
		PrintWriter out = resp.getWriter();
		out.println(result);
		out.close();
		
		
		
	}
}
