package br.com.agendamento.controller;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.agendamento.model.entity.Agendamento;
import br.com.agendamento.model.entity.Animador;
import br.com.agendamento.model.entity.Usuario;
import br.com.agendamento.model.service.AgendamentoService;


@WebServlet("/agendamento")
public class AgendamentoServlet extends HttpServlet {

    private AgendamentoService service = new AgendamentoService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try {
            Usuario cliente = (Usuario) request.getSession().getAttribute("usuarioLogado");

            if (cliente == null) {
                response.sendRedirect("views/auth/login.jsp");
                return;
            }

            int animadorId = Integer.parseInt(request.getParameter("animadorId"));
            String dataHoraToString = request.getParameter("dataHora");

            LocalDateTime dataHora = LocalDateTime.parse(dataHoraToString);

            Animador animador = new Animador();
            animador.setId(animadorId);

            Agendamento agendamento = new Agendamento();
            agendamento.setCliente(cliente);
            agendamento.setAnimador(animador);
            agendamento.setDataHora(dataHora);

            service.criarAgendamento(agendamento);
            response.sendRedirect("index.jsp?sucesso=agendamento");

        } catch (Exception e) {
            request.setAttribute("erro", e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}