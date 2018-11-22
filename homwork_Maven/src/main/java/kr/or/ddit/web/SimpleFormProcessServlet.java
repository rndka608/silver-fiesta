package kr.or.ddit.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.vo.AlbasengVO;

import javax.servlet.annotation.*;
@WebServlet(value="/albamon", loadOnStartup=1)


public class SimpleFormProcessServlet extends HttpServlet {
	public  Map<String, String> gradeMap;
	public  Map<String, String> licenseMap;
	
	//class가 메모리에 적재될때 실행됨 (DB라 가정)
	 {
		gradeMap = new HashMap<>();
		licenseMap = new LinkedHashMap<>();
		
		gradeMap.put("G001", "고졸");
		gradeMap.put("G002", "대졸");
		gradeMap.put("G003", "석사");
		gradeMap.put("G004", "박사");
		
		licenseMap.put("L001", "정보처리산업기사");
		licenseMap.put("L002", "정보처리기사");
		licenseMap.put("L003", "정보보안산업기사");
		licenseMap.put("L004", "정보보안기사");
		licenseMap.put("L005", "SQLD");
		licenseMap.put("L006", "SQLP");
		
	}
	public Map<String, AlbasengVO> albasengs = new LinkedHashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		getServletContext().setAttribute("gradeMap", gradeMap);
		getServletContext().setAttribute("licenseMap", licenseMap);
		getServletContext().setAttribute("albasengs", albasengs);
		System.out.println(getClass().getSimpleName() + "초기화");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		resp.setContentType("text/plain;charset=UTF-8");
//		String name = req.getParameter("name");
//		System.out.printf("%s : %s\n", "name", name);
//		String age = req.getParameter("age");
//		System.out.printf("%s : %s\n", "age", age);
//		String tel = req.getParameter("tel");
//		System.out.printf("%s : %s\n", "tel", tel);
//		String address = req.getParameter("address");
//		System.out.printf("%s : %s\n", "address", address);
//		String gender = req.getParameter("gender");
//		System.out.printf("%s : %s\n", "gender", gender);
//		String grade = req.getParameter("grade");
//		System.out.printf("%s : %s\n", "grade", grade);
//		String carrer = req.getParameter("carrer");
//		System.out.printf("%s : %s\n", "carrer", carrer);
//		
//		String license[] = req.getParameterValues("license");
////		System.out.printf("%s : %s\n", "license", Arrays.toString(license));
//	VO객체 생성. 파라미터 할당.
//	VO 를 대상으로 검증
//	(이름, 주소, 전화번호 필수데이터 검증)
//	1) 통과
//	code 생성 ("alba_001")
//	map.put(code, vo)
//	이동(/05/albaList.jsp, 요청 처리 완료 후 이동 (redirect))	
//	2) 불통
//	이동(/01/simpleForm.jsp, 기존 입력데이터를 전달한채 이동 (dispatch))
		AlbasengVO vo = new AlbasengVO();  //vo객체 생성
		req.setAttribute("albaVO", vo);
		
		String age = req.getParameter("age"); //파라미터 값을 가져와서
		if(age!=null && age.matches("\\d{1,2}")) { //조건에 맞다면 vo에 있는 setAge부분에 넣어준다.
			vo.setAge(new Integer(age));
		}		
		
		//파라미터를 할당해준다.
		vo.setName(req.getParameter("name")); 
		vo.setAddress(req.getParameter("address"));
		vo.setTel(req.getParameter("tel"));
		vo.setGender(req.getParameter("gender"));
		vo.setGrade(req.getParameter("grade"));
		vo.setCarrer(req.getParameter("carrer"));
		vo.setLicense(req.getParameterValues("license"));
		
		boolean valid = true;
		Map<String, String> errors = new LinkedHashMap<>();
		req.setAttribute("errors", errors);
		//StringUtils를 사용하면 널값과 화이트스페이스를 체크할 수 있다. ( 검증 )
		if(StringUtils.isBlank(vo.getName())) {
				valid = false;
				errors.put("name", "이름누락");
		}
		if(StringUtils.isBlank(vo.getTel())) {
			valid= false;
			errors.put("tel","연락처누락");
		}
		if(StringUtils.isBlank(vo.getAddress())) {
			valid=false;
			errors.put("address","주소누락");
		}
		boolean redirect =false;
		String goPage = null;
		
		//valid가 true라면 code에 값을 세팅해준다.
		if(valid) {
			vo.setCode(String.format("alba_%03d", albasengs.size()+1)); //abla_xxx세자리에 숫자를 사이즈만큼 셋팅해준다.
			albasengs.put(vo.getCode(), vo);
			goPage = "/05/albaList.jsp";  //성공적이라면 albaList.jsp 띄우주기 위해 셋팅
			redirect = true;
		}else {
			goPage = "/01/simpleForm.jsp"; //실패라면 simpleForm.jsp 띄우주기 위해 셋팅
		}
		if(redirect) {
			resp.sendRedirect(req.getContextPath() +  goPage);
		}else {
			RequestDispatcher rd = req.getRequestDispatcher(goPage);
			rd.forward(req, resp);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	//*********************************************************************************
//		Enumeration<String> names = req.getParameterNames();
//		while (names.hasMoreElements()) {
//			String name = (String) names.nextElement();
//			String[] values = req.getParameterValues(name);
//			System.out.printf("%s : %s\n", name, Arrays.toString(values));
//		}
//		
//		Map<String,String[]> parameterMap = req.getParameterMap();
//		for (Entry<String, String[]> entry : parameterMap.entrySet()) {
//			String name = entry.getKey();
//			String[] value = entry.getValue();
//			System.out.printf("%s : %s\n", name, Arrays.toString(value));
//		}
	//********************************************************************************
//		StringBuffer sb = new StringBuffer();
//		sb.append(name +"\n");
//		sb.append(age + "\n");
//		sb.append(tel + "\n");
//		sb.append(address + "\n");
//		sb.append(gender + "\n");
//		switch(grade) {
//		case "g001":
//			sb.append("고졸\n");
//			break;
//		case "g002":
//			sb.append("대졸\n");
//			break;
//		case "g003":
//			sb.append("석사\n");
//			break;
//		case "g004":
//			sb.append("박사\n");
//			break;	
//		}
//		sb.append(carrer + "\n");
//		for (int i = 0; i < license.length; i++) {
//			switch (license[i]) {
//			case "L001":
//				sb.append(license);
//				break;
//
//			default:
//				break;
//			}
//		}
//		sb.append(license);
//
//		PrintWriter out = resp.getWriter();
//		out.println(sb.toString());
//		out.close();
//		
		
		
	}
}
