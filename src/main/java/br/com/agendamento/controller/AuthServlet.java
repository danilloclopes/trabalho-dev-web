package br.com.agendamento.controller;

import br.com.agendamento.model.entity.Usuario;
import br.com.agendamento.model.service.AuthService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

// NOTA: escolhemos manter o cadastro, login e logout juntos para centralizar o processo de autenticação


@WebServlet("/auth")
public class AuthServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final AuthService authService = new AuthService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if ("login".equals(acao)) {
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp")
                .forward(request, response);

        } else if ("cadastro".equals(acao)) {
            request.getRequestDispatcher("/WEB-INF/views/auth/cadastro.jsp")
                .forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String acao = request.getParameter("acao");

        if ("login".equals(acao)) {
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            try {
                Usuario   usuario = authService.login(email, senha);
                HttpSession session = request.getSession();
                session.setAttribute("usuarioLogado", usuario);
                response.sendRedirect(request.getContextPath() + "/");

            } catch (Exception e) {
                request.setAttribute("erro", e.getMessage());
                request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
            }

        } else if ("cadastro".equals(acao)) {
            String nome  = request.getParameter("nome");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            String cpf   = request.getParameter("cpf");

            try {
                Usuario usuario = new Usuario();
                usuario.setNome(nome);
                usuario.setEmail(email);
                usuario.setSenha(senha);
                usuario.setCpf(cpf != null ? cpf.replaceAll("\\D", "") : "");

                authService.cadastrar(usuario);
                response.sendRedirect(request.getContextPath() + "/auth?acao=login&sucesso=1");

            } catch (Exception e) {
                request.setAttribute("erro", e.getMessage());
                request.getRequestDispatcher("/WEB-INF/views/auth/cadastro.jsp").forward(request, response);
            }

        } else if ("logout".equals(acao)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }

            Cookie cookie = new Cookie("JSESSIONID", "");
            String cookiePath = request.getContextPath();
            cookie.setPath(cookiePath.isEmpty() ? "/" : cookiePath);
            cookie.setMaxAge(0);
            cookie.setHttpOnly(true);
            response.addCookie(cookie);

            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}
