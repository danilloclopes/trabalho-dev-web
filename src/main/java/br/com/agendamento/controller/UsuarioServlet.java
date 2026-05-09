package br.com.agendamento.controller;

import br.com.agendamento.model.entity.Usuario;
import br.com.agendamento.model.service.UsuarioService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/usuario")
public class UsuarioServlet extends HttpServlet {

    private UsuarioService service = new UsuarioService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession(false);
            Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
            Usuario atualizado = service.buscarPorId(usuario.getId());
            
            request.setAttribute("usuario", atualizado);
            request.getRequestDispatcher("views/shared/perfil.jsp")
                .forward(request, response);

        } catch (Exception e) {
            response.getWriter().println("Erro: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession(false);
            Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

            usuario.setNome(request.getParameter("nome"));
            usuario.setEmail(request.getParameter("email"));
            String novaSenha = request.getParameter("senha");
            service.atualizar(usuario, novaSenha);
            response.sendRedirect("usuario");

        } catch (Exception e) {
            response.getWriter().println("Erro: " + e.getMessage());
        }
    }
}