package kr.or.ddit.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.utils.CookieUtil;


public class ImagesFormServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext context = req.getServletContext();
		File folder = (File)context.getAttribute("contentFolder");
		String[] filenames = folder.list(new FilenameFilter() {
			
			@Override
			public boolean accept(File dir, String name) {
				String mime = context.getMimeType(name);
				return mime.startsWith("image/");
			}
		});
		
		// action 속성의 값은 context/imageService, method="get"
		
		resp.setContentType("text/html;charset=UTF-8");
//		InputStream in = this.getClass().getResourceAsStream("imageform.html");
//		InputStreamReader isr = new InputStreamReader(in, "UTF-8");
//		BufferedReader br = new BufferedReader(isr);
//		StringBuffer html = new StringBuffer();
//		String temp = null;
//		while( (temp = br.readLine()) != null){
//			html.append(temp+"\n");
//		}
		
		StringBuffer sb = new StringBuffer();
		sb.append("<option value=''>그림선택</option>");
		for (int i = 0; i < filenames.length; i++) {
			sb.append("<option>");
			sb.append(filenames[i]);			
			sb.append("</option>\n");
		}
//		String pattern = "<option>%s </option>\n";
//		for (String name : filenames) {
//			sb.append(String.format(pattern, name));
//		}
		
		
//		int start = html.indexOf("@imageform");
//		int end = start + "@imageform".length();
		
		
		
//		String replacetext = sb.toString();
//		html.replace(start, end, replacetext);
		
		req.setAttribute("optionsAttr", sb.toString());
		
		//A,B
		String imgCookieValue = new CookieUtil(req).getCookieValue("imageCookie");
		StringBuffer imgTags = new StringBuffer();
		if(imgCookieValue!=null) {
			
			ObjectMapper mapper = new ObjectMapper();
			String[] imgNames = mapper.readValue(imgCookieValue, String[].class);
			
			String imgPattern = "<img src='imageService?image=%s'/>";
			for(String imgName : imgNames) {
				imgTags.append(
							String.format(imgPattern, imgName)
						);
			}
		}
		req.setAttribute("imgTags", imgTags);
//		start = html.indexOf("@images");
//		end = start + "@images".length();
//		html.replace(start, end, imgTags.toString());
		String view = "/WEB-INF/views/imageform.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.include(req, resp);  //지우지 않고 쌓아두고 가야대기때문에... include사용
//		PrintWriter out = resp.getWriter();
//		out.println(html.toString());
		

		
		

		
	}
	
}
