package listo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletLifeCycle extends HttpServlet {
	// �꽌釉붾┸�쓽 �깮紐낆＜湲�
	// 1. �깮�꽦�옄
	// �꽌釉붾┸�씠 �슂泥��릺硫� �꽌釉붾┸ �겢�옒�뒪媛� 濡쒕뵫�릺怨� �깮�꽦�옄瑜� �샇異쒗븯�뿬 硫붾え由ъ뿉 媛앹껜瑜� �깮�꽦�븳�떎.
	public ServletLifeCycle() {
		System.out.println("1) �깮�꽦�옄 �샇異쒕맖");
	}
	
	// 2. init(): 湲곕뒫�쓽 珥덇린�솕
	// 媛앹껜媛� �깮�꽦�릺硫댁꽌 �꽌踰꾧� init() 硫붿꽌�뱶瑜� �븳踰덈쭔 �샇異쒗븯�뿬 �꽌釉붾┸�쓣 珥덇린�솕�븳�떎.
	// �꽌釉붾┸ 濡쒕뵫: �꽌釉붾┸ 媛앹껜 �깮�꽦�썑 珥덇린�솕�떆�뿉 �븳踰� �샇異쒕릺�뒗 怨쇱젙
	@Override
	public void init() throws ServletException {
		System.out.println("2) init() 硫붿꽌�뱶 �샇異쒕맖");
	}
	
	// 3. service(): �떎�젣 鍮꾩쫰�땲�뒪 濡쒖쭅
	// �겢�씪�씠�뼵�듃�쓽 �슂泥��씠 �엳�쓣�븣 service() 硫붿꽌�뱶媛� �떎�뻾�릺�뼱, �슂泥��뿉�뵲�씪 doGet()�씠�굹 doPost()�씠 �샇異쒕릺�뼱 湲곕뒫�쓣 �닔�뻾�븳�떎.
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("3) service() 硫붿꽌�뱶 �샇異쒕맖");
	}
	
	// 4. destroy(): �냼硫몄옄 - �꽌踰꾩쥌猷뚮맆�븣 �옄�룞�샇異�
	// �꽌踰꾨�� 醫낅즺�븯嫄곕굹 �꽌釉붾┸�씠 �뜑�씠�긽 �븘�슂�븯吏� �븡��寃쎌슦 destroy() 硫붿꽌�뱶媛� �샇異쒕릺�뼱 �꽌釉붾┸�씠 �젣嫄곕맂�떎.
	@Override
	public void destroy() {
		System.out.println("4) destroy() 硫붿꽌�뱶 �샇異쒕맖");
	}
}
