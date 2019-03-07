package br.com.garten.calmedumi;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/Editor")

public class Editar extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession sess = request.getSession();
        ListaAmostras amostras = (ListaAmostras) sess.getAttribute("amostras");
        Double amostralab = Double.parseDouble(request.getParameter("lab2"));
        Double amostragrt = Double.parseDouble(request.getParameter("grt2"));

        int id = Integer.parseInt(request.getParameter("ID"));


        try{

            amostras.get(id).setAmostraLaboratorio(amostralab);
            amostras.get(id).setAmostraGarten(amostragrt);

            sess.setAttribute("amostras", amostras);

        }catch(Exception e) {

            String error = e.getMessage();

            sess.setAttribute("erro", ""+error);


        }

        response.sendRedirect("pag1.jsp");

    }

}
