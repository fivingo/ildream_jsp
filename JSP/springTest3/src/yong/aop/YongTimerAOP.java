package yong.aop;

import org.aspectj.lang.ProceedingJoinPoint;

public class YongTimerAOP {
	// 핵심로직에 삽입될 pointcut을 정의
	public Object yongTime(ProceedingJoinPoint pjp) {
		long start = System.currentTimeMillis();
		System.out.println("[YongTimerAOP 구동됨]");
		
		Object result = null;
		try {
			result = pjp.proceed();	// (공통기능이 적용된?) 핵심 로직 호출 후 결과 저장
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		long end = System.currentTimeMillis();
		System.out.println("[경과시간: " + (end - start) + "ms]");
		System.out.println("[YongTimerAOP 종료됨]");
		return result;	// 핵심 로직 호출 결과 반환
	}
}
