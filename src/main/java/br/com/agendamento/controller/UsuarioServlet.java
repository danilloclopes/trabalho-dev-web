package br.com.agendamento.controller;

import br.com.agendamento.model.entity.Usuario;
import br.com.agendamento.model.service.UsuarioService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/usuario")
public class UsuarioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final UsuarioService usuarioService = new UsuarioService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session      = request.getSession(false);
        Usuario     usuarioLogado = session != null ? (Usuario) session.getAttribute("usuarioLogado") : null;

        if (usuarioLogado == null) {
            response.sendRedirect(request.getContextPath() + "/auth?acao=login");
            return;
        }

        setCacheControl(response);

        try {
            Usuario usuarioAtualizado = usuarioService.buscarPorId(usuarioLogado.getId());
            session.setAttribute("usuarioLogado", usuarioAtualizado);
            request.setAttribute("usuario", usuarioAtualizado);

            String acao = request.getParameter("acao");

            if ("perfil".equals(acao)) {
                request.getRequestDispatcher("/WEB-INF/views/shared/perfil.jsp")
                    .forward(request, response);

            } else if ("editar-perfil".equals(acao)) {
                request.getRequestDispatcher("/WEB-INF/views/shared/editarPerfil.jsp")
                    .forward(request, response);
            }

        } catch (Exception e) {
            request.setAttribute("erro", "Não foi possível carregar os dados do usuário.");
            request.getRequestDispatcher("/WEB-INF/views/error/erro.jsp")
                .forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session      = request.getSession(false);
        Usuario     usuarioLogado = session != null ? (Usuario) session.getAttribute("usuarioLogado") : null;

        if (usuarioLogado == null) {
            response.sendRedirect(request.getContextPath() + "/auth?acao=login");
            return;
        }

        try {
            usuarioLogado.setNome(request.getParameter("nome"));
            usuarioLogado.setEmail(request.getParameter("email"));

            String novaSenha = request.getParameter("senha");
            usuarioService.atualizar(usuarioLogado, novaSenha);

            session.setAttribute("usuarioLogado", usuarioLogado);
            response.sendRedirect(request.getContextPath() + "/usuario?acao=perfil&sucesso=1");

        } catch (Exception e) {
            request.setAttribute("erro", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/shared/editarPerfil.jsp")
                .forward(request, response);
        }
    }

    private void setCacheControl(HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    }
}
