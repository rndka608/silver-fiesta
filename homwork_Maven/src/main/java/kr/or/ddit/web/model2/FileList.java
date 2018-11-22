package kr.or.ddit.web.model2;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.List;

public class FileList {
	public List<File> getFileList(String fileNmae) {
		
		//파일명을 담아서 File객체를 생성해준다.
		File folder= new File(fileNmae);
		
		//File[]배열에 folder에 있는 파일리스트를 담아준다.
		File[] folderList=folder.listFiles();
		//현재 folder에 있는 파일리스트 갯수
		System.out.println(folderList.length);
		List<File> filist=new ArrayList<>();
		
		//객체의 파일명에 webStudy01이 포함되어있지 않으면 그 파일리스트에 부모파일명을 추가시켜준다. 
		if(!folder.getName().equals("webStudy01")) {
			filist.add(folder.getParentFile());
		}
		//그 객체가 폴더라면 filist에 folderList들을 추가해준다.
		if (folder.isDirectory()) {
			for(File tmp:folderList) {
				filist.add(tmp);
			}
			
		}

		
		return filist;
		}
}
