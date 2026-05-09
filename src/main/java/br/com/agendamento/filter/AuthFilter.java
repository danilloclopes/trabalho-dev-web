package br.com.agendamento.filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        String context = req.getContextPath();

        HttpSession session = req.getSession(false);

        boolean logado = (session != null && session.getAttribute("usuarioLogado") != null);

        boolean recursoPublico =
                uri.equals(context + "/") ||
                uri.endsWith("/index.jsp") ||
                uri.endsWith("/login.jsp") ||
                uri.endsWith("/cadastro.jsp") ||
                uri.contains("/auth") ||
                uri.contains("/assets/");

        if (!logado && !recursoPublico) {
            resp.sendRedirect(context + "/auth?acao=login");
            return;
        }

        chain.doFilter(request, response);
    }
}