package br.com.garten.calmedumi;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/CalcularCalibracao")

public class CalcularCalibracao extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession sess = request.getSession();
        Double nValue = Double.parseDouble(request.getParameter("n"));
        Double slope = Double.parseDouble(request.getParameter("slope"));
        Double intercept = Double.parseDouble(request.getParameter("intercept"));


        Double result = slope *  nValue + intercept;

        sess.setAttribute("nValue",nValue);
        sess.setAttribute("resultado",result);
        response.sendRedirect("pag1.jsp");


    }
}
