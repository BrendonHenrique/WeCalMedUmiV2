package br.com.garten.calmedumi;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/recParam")
public class recParam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String amostraLab;
		String amostraGrt;

		amostraLab = request.getParameter("lab");
		amostraGrt = request.getParameter("grt");
		HttpSession sess = request.getSession();

		try{
			Amostra amostra = new Amostra(amostraGrt,amostraLab);
		    ListaAmostras amostras = (ListaAmostras) sess.getAttribute("amostras");
			
			if(amostras == null) {
				amostras = new ListaAmostras();
			}
			
			amostras.add(amostra);
			sess.setAttribute("amostras", amostras);

		}catch(Exception e) {
			
			String error = e.getMessage();
			
			sess.setAttribute("erro", ""+error);
			
		
		}
		
		response.sendRedirect("pag1.jsp");
	}
}