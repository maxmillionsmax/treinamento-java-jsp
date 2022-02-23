package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOUsuarioRepository {

	private Connection connection;
	
	public DAOUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	public ModelLogin gravarUsuario(ModelLogin objeto) throws Exception {
		
		String sql = "INSERT INTO model_login(login, senha, nome, email)VALUES (?, ?, ?, ?);";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		statement.setString(1, objeto.getLogin());
		statement.setString(2,objeto.getSenha());
		statement.setString(3,objeto.getNome());
		statement.setString(4,objeto.getEmail());
		
		statement.execute();
		connection.commit();
		
		return this.consultarUsuario(objeto.getLogin());
		
	}
	
	public ModelLogin consultarUsuario(String login) throws Exception {
		
		ModelLogin modelLogin = new ModelLogin();
		
		String sql = "select * from model_login where upper(login) = upper('"+login+"');";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		
		ResultSet resultado =  statement.executeQuery();
		
		while (resultado.next()){
			
			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setNome(resultado.getString("nome"));
			
		}
		return modelLogin;
	}
	
}
