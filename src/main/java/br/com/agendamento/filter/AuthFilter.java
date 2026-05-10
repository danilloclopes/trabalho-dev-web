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

        HttpServletRequest  req  = (HttpServletRequest)  request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String uri     = req.getRequestURI();
        String context = req.getContextPath();

        HttpSession session  = req.getSession(false);
        boolean     logado   = session != null && session.getAttribute("usuarioLogado") != null;

        boolean paginaAuth = uri.endsWith("/login.jsp")
                          || uri.endsWith("/cadastro.jsp")
                          || uri.contains("/auth");

        boolean recursoPublico = uri.equals(context + "/")
                              || uri.endsWith("/index.jsp")
                              || uri.endsWith("/politica-de-privacidade.jsp")
                              || uri.endsWith("/termos-de-uso.jsp")
                              || uri.contains("/assets/")
                              || paginaAuth;

        // Usuário autenticado não precisa voltar para login/cadastro
        if (logado && (uri.endsWith("/login.jsp") || uri.endsWith("/cadastro.jsp"))) {
            resp.sendRedirect(context + "/");
            return;
        }

        // Recurso protegido sem sessão → redireciona para login
        if (!logado && !recursoPublico) {
            resp.sendRedirect(context + "/auth?acao=login");
            return;
        }

        // Páginas de autenticação nunca devem ser cacheadas pelo navegador
        if (paginaAuth) {
            resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            resp.setHeader("Pragma", "no-cache");
            resp.setDateHeader("Expires", 0);
        }

        chain.doFilter(request, response);
    }
}
