package kr.or.ddit.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.web.model2.FileList;

@WebServlet("/fileBrowser.do")
public class ServerFileBrowser extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//파일 목록을 보여주고 
		//그게 디렉토리라면 그폴더안에있는 목록보여주고
		//..링크 추가하면 다시 상위폴더로
		//파라미터로 넘겨줌
		String path= req.getParameter("path"); // 현재경로 가져오기
		String name= req.getParameter("name"); // 폴더명 가져오기
		String er = getServletContext().getRealPath("/"); //webStudy01 경로
		String radio = req.getParameter("radio");

		//경로가 null이면 path를 webStudy01경로 담아주기
		if(path==null) {
			path=getServletContext().getRealPath("/");
		}else {
			//폴더명에 .이 포함되어있으면 path를 파일에 부모파일에 있는 경로까지 가져오기
			if(name.contains(".")) {
				File file=new File(path);
				path=file.getParentFile().getAbsolutePath();
				
				//파라미터로 delete의 값이 넘어왔다면 해당 파일을 삭제해준다.
				if(StringUtils.isNotBlank(radio) && "delete".equals(radio)) {
					file.delete();
				}
				
				//파라미터로 copy값이 넘어왔다면 해당파일을 복사해준다.
				if(StringUtils.isNotBlank(radio) && "copy".equals(radio)) {
					
					//해당파일의 폴더위치
					File targetFolder = new File(file.getParentFile().getAbsolutePath());
					File targetfile = new File(targetFolder, "copy"+file.getName());
					System.out.println(targetfile.exists());
					int pointer = -1;
					byte[] buffer = new byte[1024];
					try(
			 		FileInputStream fis = new FileInputStream(file); //복사할 대상
					FileOutputStream op = new FileOutputStream(targetfile);	//복사된 대상	
					){
						while((pointer = fis.read(buffer)) != -1){ // -1 : EOF 문자
							op.write(buffer,0,pointer); //읽어들일 만큼만! 
						}
						
					fis.close();
					op.close();
					}
				}
				if(StringUtils.isNotBlank(radio) && "move".equals(radio)) {
					    File newFile = new File(er+file.getName());
					    System.out.println("이게뭐야" + newFile);
					    if(file.exists()) {
					        file.renameTo(newFile);
					        System.out.println("이동했냐");
					    }


				}
			
			}else {
				if(StringUtils.isNotBlank(radio) &&  "delete".equals(radio)) {
					File file=new File(path);
					path=file.getParentFile().getAbsolutePath();
					file.delete();
					
				}
			}
			
		}
		FileList fileList=new FileList();
		//파일리스트를 list에 담아준다.
		List<File> filefile=fileList.getFileList(path);
		
		//list가 비어있지 않으면.....
		//dispatch사용해야 하여 원본 request값 유지되기 때문에 포워드 방식을 사용한다.
		//request에 setAttribute를 이용하여 파일리스트를 전달한다.
		if(filefile!=null) {
			req.setAttribute("file", filefile);
		}else {
			
		}
		
		//fileBrowser가 있는 위치를 찍어준다.
		String view="/WEB-INF/views/fileBrowser.jsp";
		
		//Dispatch를 사용하여 fileBrowser.jsp로 넘겨준다.
		RequestDispatcher rd= req.getRequestDispatcher(view);
		rd.forward(req, resp);
	}
}
