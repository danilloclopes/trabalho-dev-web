package br.com.agendamento.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import br.com.agendamento.model.entity.Animador;
import br.com.agendamento.util.ConnectionFactory;


public class AnimadorDAO {

    public void salvar(Animador animador) throws Exception {
        String sql = "INSERT INTO animador (usuario_id, personagem_id) VALUES (?, ?)";

        try (Connection conn = ConnectionFactory.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, animador.getUsuario().getId());
            stmt.setInt(2, animador.getPersonagem().getId());

            stmt.executeUpdate();
        }
    }


    public boolean pesquisar(int usuarioId, int personagemId) throws Exception {
        String sql = "SELECT * FROM animador WHERE usuario_id = ? AND personagem_id = ?";

        try (Connection conn = ConnectionFactory.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuarioId);
            stmt.setInt(2, personagemId);

            ResultSet rs = stmt.executeQuery();
            return rs.next();
        }
    }

}
