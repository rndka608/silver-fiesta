package kr.or.ddit.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.utils.CookieUtil;
import kr.or.ddit.utils.CookieUtil.TextType;

import javax.servlet.annotation.*;
@WebServlet(value="/imageService")
public class ImageServiceServlet extends HttpServlet {
	int i =1;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청 파라미터 확보 : 파라미터명(image)
		// 이미지 스트리밍...
		resp.setContentType("image/jpeg");
		String image = req.getParameter("image");
		
		//화이트스페이스일수도 있뜸
		if(image==null || image.trim().length()==0) {
			resp.sendError(400);
			return;
		}
		File folder = (File)getServletContext().getAttribute("contentFolder");
		File imgFile = new File(folder,image);
		
		//이파일이 실제로 존재하는지에 대해서 파악해봐야한다.
		if(!imgFile.exists()) {
			resp.sendError(404);
			return;
		}
		// 쿠키값 : A,B
		String imgCookieValue = new CookieUtil(req).getCookieValue("imageCookie");
		String[] cookieValues = null;
		ObjectMapper mapper = new ObjectMapper();
		
		if(StringUtils.isBlank(imgCookieValue)) {
			cookieValues = new String[] { imgFile.getName()};
		}else {
			String[] cValues = mapper.readValue(imgCookieValue, String[].class);
			cookieValues = new String[cValues.length+1];
			System.arraycopy(cValues, 0, cookieValues, 0, cValues.length);
			cookieValues[cookieValues.length-1] = imgFile.getName();
		}
//		imgCookieValue = Arrays.toString(cookieValues);
//		imgCookieValue = imgCookieValue.replaceAll("[\\[\\]\\s]", "");
		
		//mashalling
		imgCookieValue = mapper.writeValueAsString(cookieValues);
		System.out.println(imgCookieValue);
		
		Cookie imagecookie = CookieUtil.createCookie("imageCookie", imgCookieValue,req.getContextPath(), TextType.PATH, 60*60*24*3);
		
		resp.addCookie(imagecookie);
		FileInputStream fis = new FileInputStream(imgFile);
		OutputStream out = resp.getOutputStream();
		byte[] buffer = new byte[1024];
		int pointer = -1;
		while((pointer = fis.read(buffer)) != -1){ // -1 : EOF 문자
			out.write(buffer,0,pointer); //읽어들일 만큼만! 
		}
		fis.close();
		out.close();
	
	}
}
