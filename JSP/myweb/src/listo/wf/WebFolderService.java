package listo.wf;
// DTO(정보) DAO(기능)이 애매하면 Service
import java.io.*;

public class WebFolderService {
	// 이클립스의 컨텐츠 복제 폴더 경로 상수 (원본훼손x)
	public static final String USERS_HOME =
			"D:/Documents/Programming_DREAM/jspstudy/.metadata/.plugins/"
			+ "org.eclipse.wst.server.core/tmp0/wtpwebapps/myweb/wf/upload";
	private String userId;	// 사용자 계정 정보
	private String crPath;	// 현재 위치 정보 (클라이언트의 경로)
	private int totalSize;	// 총 용량
	private int usedSize;	// 사용 용량
	private int freeSize;	// 남은 용량
	
	public WebFolderService() {
		totalSize = 1024 * 1024 * 10;	// 10mb: 기본 부여된 용량
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCrPath() {
		return crPath;
	}
	public void setCrPath(String crPath) {
		this.crPath = crPath;
	}
	public int getTotalSize() {
		return totalSize;
	}
	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}
	public int getUsedSize() {
		return usedSize;
	}
	public void setUsedSize(int usedSize) {
		this.usedSize = usedSize;
	}
	public int getFreeSize() {
		return freeSize;
	}
	public void setFreeSize(int freeSize) {
		this.freeSize = freeSize;
	}
	
	/** 폴더 유무 확인 메서드 */
	public void getUserFolderExists() {
		File f = new File(USERS_HOME + "/" + userId);	// 사용자 id 이름의 폴더 경로
		if (!f.exists()) {
			f.mkdir();	// 없으면 폴더 생성
		}
		usedSize = 0;
		settingUsedSize(f);
		freeSize = totalSize - usedSize;
	}
	
	/** 사용중인 용량 구하는 메서드 */
	public void settingUsedSize(File f) {
		File[] files = f.listFiles();	// 폴더 안 요소들 배열에 대입
		for (int i = 0; i < files.length; i++) {
			if (files[i].isFile()) {
				usedSize += files[i].length();	// 파일은 용량 누적
			} else {
				// 재귀 호출 (Stack 구조 (LIFO): 메서드 호출시마다 메서드 생성)
				// 폴더 안에 파일들 용량 누적
				settingUsedSize(files[i]);
			}
		}
	}
	
	/** 탐색기 출력 목록 반환 메서드 */
	public File[] getFileList() {
		File f = new File(USERS_HOME + "/" + crPath);
		File[] files = f.listFiles();
		return files;
	}
	
	/** 폴더 삭제 관련 메서드 */
	public boolean deleteFolder(File f) {
		boolean result = false;
		File[] files = f.listFiles();
		for (int i = 0; i < files.length; i++) {
			if (files[i].isDirectory()) {
				result = files[i].delete();
				if (!result) {	// 폴더안에 파일있어서 삭제안되면 재귀 호출
					deleteFolder(files[i]);
				}
			} else {
				files[i].delete();
			}
		}
		result = f.delete();	// 폴더 내용 모두 삭제 후 폴더 삭제
		return result;
	}
}
