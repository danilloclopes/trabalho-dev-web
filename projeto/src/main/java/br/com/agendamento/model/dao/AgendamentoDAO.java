package br.com.agendamento.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import br.com.agendamento.model.entity.Agendamento;
import br.com.agendamento.util.ConnectionFactory;


public class AgendamentoDAO {

    public void salvar(Agendamento agendamento) throws Exception {
        String sql = "INSERT INTO agendamento (cliente_id, animador_id, data_hora, status) VALUES (?, ?, ?, ?)";

        try (Connection conn = ConnectionFactory.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, agendamento.getCliente().getId());
            stmt.setInt(2, agendamento.getAnimador().getId());
            stmt.setTimestamp(3, Timestamp.valueOf(agendamento.getDataHora()));
            stmt.setString(4, agendamento.getStatus().name());

            stmt.executeUpdate();
        }
    }


    public boolean verificarConflito(int animadorId, Timestamp dataHora) throws Exception {
        String sql = "SELECT 1 FROM agendamento WHERE animador_id = ? AND data_hora = ? AND status IN ('PENDENTE', 'CONTRATADO')";

        try (Connection conn = ConnectionFactory.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, animadorId);
            stmt.setTimestamp(2, dataHora);

            ResultSet rs = stmt.executeQuery();
            return rs.next();
        }
    }
}
