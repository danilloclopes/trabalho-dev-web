package br.com.agendamento.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/", "/politica-de-privacidade", "/termos-de-uso"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        if ("/politica-de-privacidade".equals(path)) {
            request.getRequestDispatcher("/WEB-INF/views/home/politica-de-privacidade.jsp")
                .forward(request, response);
        } else if ("/termos-de-uso".equals(path)) {
            request.getRequestDispatcher("/WEB-INF/views/home/termos-de-uso.jsp")
                .forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/views/home/index.jsp")
                .forward(request, response);
        }
    }
}