package listo.hello;

public class DbMsgOutput implements MsgOutput {
	@Override
	public void output(String msg) throws Exception {
		System.out.println("db연동됨");
		System.out.println("저장데이터: " + msg);
		System.out.println("db연동 종료됨");
	}
}
