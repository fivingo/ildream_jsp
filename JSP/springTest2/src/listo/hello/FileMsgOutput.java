package listo.hello;

import java.io.*;

public class FileMsgOutput implements MsgOutput {
	private String filename;
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public void output(String msg) throws Exception {
		// FileWrite: 텍스트 데이터를 파일에 저장할때 사용하는 문자 기반(2byte) 스트림 클래스
		FileWriter fw = new FileWriter(filename);	// 객체 생성 (파일명)
		fw.write(msg);	// 문자열 파일로 저장
		fw.close();		// flush 후 닫기
	}
}
