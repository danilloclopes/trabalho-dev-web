package br.com.agendamento.controller;

import br.com.agendamento.model.entity.Usuario;
import br.com.agendamento.model.service.AuthService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/auth")
public class AuthServlet extends HttpServlet {

    // NOTA: escolhemos manter o cadastro, login e logout juntos para centralizar o processo de autenticação

    private AuthService authService = new AuthService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");


        // Se a ação recebida pelo servlet for cadastro, ele age como um CadastroServlet.java
        if ("cadastro".equals(acao)) {
            try {

                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                String senha = request.getParameter("senha");
                String cpf = request.getParameter("cpf");

                Usuario usuario = new Usuario();

                usuario.setNome(nome);
                usuario.setEmail(email);
                usuario.setSenha(senha);
                usuario.setCpf(cpf.replaceAll("\\D", ""));

                authService.cadastrar(usuario);

                response.sendRedirect("views/auth/login.jsp?sucesso=1");

            } catch (Exception e) {

                request.setAttribute("erro", e.getMessage());
                request.getRequestDispatcher("views/auth/cadastro.jsp")
                    .forward(request, response);
            }

        } else if ("login".equals(acao)) {

            // Se a ação recebida pelo servlet for login, ele age como um LoginServlet.java

            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            try {

                Usuario usuario = authService.login(email, senha);
                HttpSession session = request.getSession();

                session.setAttribute("usuarioLogado", usuario);
                response.sendRedirect("index.jsp");

            } catch (Exception e) {
                request.setAttribute("erro", e.getMessage());
                request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
            }
            
        } else if ("logout".equals(acao)) {

            // Se a ação recebida pelo servlet for logout, ele age como um LogoutServlet.java
            HttpSession session = request.getSession(false);

            if (session != null) {
                session.invalidate();
            }

            // Remove explicitamente o cookie JSESSIONID do navegador
            javax.servlet.http.Cookie cookie = new javax.servlet.http.Cookie("JSESSIONID", "");
            String cookiePath = request.getContextPath();
            cookie.setPath(cookiePath.isEmpty() ? "/" : cookiePath);
            cookie.setMaxAge(0);
            cookie.setHttpOnly(true);
            response.addCookie(cookie);

            response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
        }
    }
}