package br.com.agendamento.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.agendamento.model.entity.Agendamento;
import br.com.agendamento.model.entity.Animador;
import br.com.agendamento.model.entity.Usuario;
import br.com.agendamento.model.service.AgendamentoService;

@WebServlet("/agendamento")
public class AgendamentoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final AgendamentoService agendamentoService = new AgendamentoService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        String acao = request.getParameter("acao");

        if (usuarioLogado == null) {
            response.sendRedirect(request.getContextPath() + "/auth?acao=login");
            return;
        }

        if("agendar".equals(acao)) {

            request
                .getRequestDispatcher("/WEB-INF/views/agendamento/agendar.jsp")
                .forward(request, response);

        } else if ("dashboard-cliente".equals(acao)) {

            List<Agendamento> agendamentos = agendamentoService.listarAgendamentosCliente(usuarioLogado.getId());

            request.setAttribute("agendamentos",agendamentos);
            request
                .getRequestDispatcher("/WEB-INF/views/cliente/dashboard.jsp")
                .forward(request, response);

        } else if ("dashboard-animador".equals(acao)) {

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {

            HttpSession session = request.getSession(false);
            Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

            if (usuarioLogado == null) {
                response.sendRedirect(request.getContextPath() + "/auth?acao=login");
                return;
            }

            String animadorIdParam = request.getParameter("animadorId");
            String dataHoraParam = request.getParameter("dataHora");

            int animadorId = Integer.parseInt(animadorIdParam);
            LocalDateTime dataHora = LocalDateTime.parse(dataHoraParam);
            
            Animador animador = new Animador();
            animador.setId(animadorId);

            Agendamento agendamento = new Agendamento();
            agendamento.setCliente(usuarioLogado);
            agendamento.setAnimador(animador);
            agendamento.setDataHora(dataHora);

            agendamentoService.criarAgendamento(agendamento);

            response.sendRedirect(request.getContextPath()+ "/?sucesso=agendamento");

        } catch (NumberFormatException e) {
            request
                .setAttribute("erro", "ID do animador inválido.");
            request
                .getRequestDispatcher("/WEB-INF/views/agendamento/agendar.jsp")
                .forward(request, response);

        } catch (Exception e) {
            request
                .setAttribute("erro", e.getMessage());
            request
                .getRequestDispatcher("/WEB-INF/views/agendamento/agendar.jsp")
                .forward(request, response);
        }
    }
}