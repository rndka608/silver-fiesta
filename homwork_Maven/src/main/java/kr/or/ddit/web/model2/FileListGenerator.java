package kr.or.ddit.web.model2;

import java.io.File;

public class FileListGenerator {
	
	// url을 매개변수로 받아 거기에 해당하는 폴더를 생성해주고
	// 그 폴더 경로에 있는 파일리스트를 가져오는 메서드
	public File[] getFileList(String url) {
		File folder = new File(url);
		return folder.listFiles();
		//if 하위경로가 없으면 현재 받아온 파일만 출력
	}
}
