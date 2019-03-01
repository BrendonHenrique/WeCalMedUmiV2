package br.com.garten.calmedumi;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/Removedor")
public class Removedor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*
		 * Essa classe foi criada para remover as coordenadas inseridas 
		 * 
		 * Ela faz o Request da sessão
		 * 
		 * Ela recebe o valor do parametro "Id" enviado pelo form com id "Removedor-Form" de pag1.jsp
		 * O qual contém o ID do botão acionado, que por sua vez está relacionado com as coordenadas inseridas (Laboratorio X Garten)
		 * 
		 * Passa esse parametro para Inteiro 
		 * 
		 * Intera o vetor de amostras , até encontrar a posição igual ao ID
		 * 
		 * Quando encontra a posição recebe 0
		 * 
		 * Por fim , retorna à pagina pag1.jsp
	     */
		
		HttpSession sess = request.getSession();
		ListaAmostras amostras = (ListaAmostras) sess.getAttribute("amostras");
		
		int id = Integer.parseInt(request.getParameter("Id"));  
		amostras.remove(id);
    	sess.setAttribute("amostras", amostras);
    	 
    	 response.sendRedirect("pag1.jsp");
	 
	}
}
