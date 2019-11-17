package listo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

public class HelloServlet extends HttpServlet {
	// �꽌踰꾩뿉 �슂泥��븯�뒗 2媛�吏� 諛⑸쾿 - doGet / doPost
	// doGet: �꽌踰꾩뿉 �엳�뒗 �젙蹂대�� 媛��졇�삤湲� �쐞�빐 �꽕怨꾨맖
	// 240byte源뚯� �쟾�떖 �뜲�씠�꽣�겕湲� �젣�븳
	// URL �끂異쒕줈 蹂댁븞�꽦�씠 �궙�쓬
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	// doPost: �꽌踰꾨줈 �젙蹂대�� �삱由ш린 �쐞�빐 �꽕怨꾨맖
	// �뜲�씠�꽣 �겕湲곗뿉 �젣�븳 �뾾�쓬
	// URL �끂異� �븞�릺�꽌 蹂댁븞�꽦 醫뗭쓬
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	// �엫�쓽 硫붿꽌�뱶瑜� 留뚮뱾�뼱 2媛�吏� 硫붿꽌�뱶以� �븘�슂硫붿꽌�뱶瑜� �샇異쒗븯�뿬 �깮�꽦�맂 硫붿꽌�뱶�쓽 湲곕뒫�궗�슜
	protected void userProcess(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// req: �쎒釉뚮씪�슦��(client)�뿉�꽌 蹂대궦 �슂泥��쓣 ���옣�븯�뒗 媛앹껜
		// resp: �쎒釉뚮씪�슦��(client)�뿉寃� 蹂대궡�뒗 �쓳�떟�쓣 ���옣�븯�뒗 媛앹껜
		// �겢�씪�씠�뼵�듃(釉뚮씪�슦��)�뿉寃� 蹂대궡�뒗 �쓳�떟 而⑦뀗痢좎쓽 ���엯�쓣 �꽕�젙
		resp.setContentType("text/html; charset=UTF-8");	// �쓳�떟 而⑦뀗痢좎쓽 ���엯 �꽕�젙
		// 理쒖쥌�쟻�쑝濡� 異쒕젰 寃곌낵瑜� �깮�꽦�븯�뿬 �겢�씪�씠�뼵�듃(釉뚮씪�슦��)濡� �쟾�넚(異쒕젰)�븯�뒗 異쒕젰 �뒪�듃由� -> 踰꾪띁瑜� �궗�슜�븯吏��븡怨� 諛붾줈 異쒕젰
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html><head>");
		pw.println("<title>�굹�쓽 泥� �꽌釉붾┸ �럹�씠吏�</title>");
		pw.println("</head><body>");
		pw.println("<h1>�굹�쓽 泥� servlet</h1>");
		
		Calendar now = Calendar.getInstance();
		int y = now.get(Calendar.YEAR);
		int m = now.get(Calendar.MONTH) + 1;
		int d = now.get(Calendar.DATE);
		
		pw.println("<h2>" + y + "�뀈 " + m + "�썡 " + d + "�씪");
		pw.println("<body></html>");
		
		pw.close();	// 異쒕젰�뒪�듃由� �옄�썝諛섑솚
	}
}
