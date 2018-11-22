package kr.or.ddit.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MusicLyricesServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext context = req.getServletContext();
		File folder = new File("d:/contents");
		String[] filenames = folder.list(new FilenameFilter() {
			
			@Override
			public boolean accept(File dir, String name) {
				String mime = context.getMimeType(name);
				return mime.startsWith("text/");
			}
		});
		
		
		resp.setContentType("text/html;charset=UTF-8");
		InputStream in = this.getClass().getResourceAsStream("music.html");
		InputStreamReader isr = new InputStreamReader(in, "UTF-8");
		BufferedReader br = new BufferedReader(isr);
		StringBuffer html = new StringBuffer();
		String temp = null;
		while( (temp = br.readLine()) != null){
			html.append(temp+"\n");
		}
		
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < filenames.length; i++) {
			sb.append("<option>");
			sb.append(filenames[i]);			
			sb.append("</option>\n");
		}
//		String pattern = "<option>%s </option>\n";
//		for (String name : filenames) {
//			sb.append(String.format(pattern, name));
//		}
		
		
		int start = html.indexOf("@musicform");
		int end = start + "@musicform".length();
		String replacetext = sb.toString();
		html.replace(start, end, replacetext);
		PrintWriter out = resp.getWriter();
		out.println(html.toString());
		out.close();
		
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				req.setCharacterEncoding("UTF-8");
				resp.setContentType("text/html;charset=UTF-8");
				String music = req.getParameter("music");
				
				
				//화이트스페이스일수도 있뜸
				if(music==null || music.trim().length()==0) {
					resp.sendError(400);
					return;
				}
				File folder = new File("d:/contents");
				File msuicFile = new File(folder,music);
				
				//이파일이 실제로 존재하는지에 대해서 파악해봐야한다.
				if(!msuicFile.exists()) {
					resp.sendError(404);
					return;
				}
				
				//파일읽어오기
				FileInputStream fis = new FileInputStream(msuicFile);
				InputStreamReader isr = new InputStreamReader(fis, "EUC-KR");
				BufferedReader br = new BufferedReader(isr);
				StringBuffer html = new StringBuffer();
				String temp = null;
				while( (temp = br.readLine()) != null){
					html.append(temp+"<br>");
				}
				
				
				//템플릿읽어오기
				InputStream in = this.getClass().getResourceAsStream("musicgasa.html");
				InputStreamReader tamisr = new InputStreamReader(in, "UTF-8");
				BufferedReader tambr = new BufferedReader(tamisr);
				StringBuffer tamhtml = new StringBuffer();
				String tamtemp = null;
				while( (tamtemp = tambr.readLine()) != null){
					tamhtml.append(tamtemp+"\n");
				}
				
				//@musicgasa의 부분을 html으로 바꿔주기
				int start = tamhtml.indexOf("@musicgasa");
				int end = start + "@musicgasa".length();
				String replacetext = html.toString();
				tamhtml.replace(start, end, replacetext);
				PrintWriter out = resp.getWriter();
				out.println(tamhtml.toString());
				out.close();
			}
	}

