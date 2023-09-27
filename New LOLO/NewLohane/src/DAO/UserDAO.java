package DAO;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.UserDTO;
import Util.Conexao;

public class UserDAO {
	
	public boolean Cadastrar(UserDTO U) {
		Conexao con = null;
		try {
			con = new Conexao();
			con.executeUpdate("INSERT INTO usuarios(nome, email, senha) VALUES ('"
					+ U.getNome() + "','"
					+ U.getEmail() + "','"
					+ U.getSenha()+"');");
			return true;
		}catch(SQLException e) {
			System.out.println("Error ao Inserir USUÁRIO");
			return false;
		}
	}
	
	public ArrayList<UserDTO> ArrayListarUser(){
		Conexao con = null;
		try {
			con = new Conexao();
			ResultSet resultado = con.executeQuery("SELECT * FROM usuarios;");
			ArrayList<UserDTO> listarUsuario = new ArrayList<UserDTO>();
			int i = 0;
			
			while(resultado.next()) {
				UserDTO user = new UserDTO();
				user.setId_user(resultado.getInt("id_user"));
				user.setNome(resultado.getString("nome"));
				user.setEmail(resultado.getString("email"));
				user.setSenha(resultado.getString("senha"));
				listarUsuario.add(i, user);
				i++;
			}
			return listarUsuario;
		}catch (SQLException e) {
			System.out.println("Erro na função listar USUÁRIO DAO" + e);
			return null;
		}
	}
	public ArrayList<UserDTO> ProcuraUser(String nome) {
	    Conexao con = null;
	    try {
	        con = new Conexao();
	        ResultSet resultado = con.executeQuery("SELECT * FROM usuarios WHERE nome LIKE '%" + nome + "%';");
	        ArrayList<UserDTO> lista = new ArrayList<UserDTO>();
	        
	        while (resultado.next()) {
	        	UserDTO user = new UserDTO();
	        	user.setId_user(resultado.getInt("id_user"));
				user.setNome(resultado.getString("nome"));
				user.setEmail(resultado.getString("email"));
				user.setSenha(resultado.getString("senha"));
	            lista.add(user);
	        }
	        
	        return lista;
	    } catch (SQLException e) {
	        System.out.println("Erro na função pesquisarUsuarioPorNome: " + e);
	        return null;
	    }
	}
	
	public boolean AlterarUsuario(UserDTO user) {
	    Conexao con = null;
	    try {
	        con = new Conexao();
	        con.executeUpdate("UPDATE usuarios SET "
	                + "nome='" + user.getNome() + "', "
	                + "email='" + user.getEmail() + "',"
	                + "senha='" + user.getSenha() + "'"
	                + " WHERE id_user=" + user.getId_user());
	        return true;
	    } catch (SQLException e) {
	        System.out.println("Erro na função atualizar cliente DAO: " + e);
	        return false;
	        }
	}
	

	public boolean DeletUser(int id) {
		Conexao con = null;
		try {
			con = new Conexao();
			con.executeUpdate("DELETE FROM usuarios WHERE id_user=" + id);
			return true;
		}catch(SQLException e) {
			System.out.println("Erro na função deletar USUÁRIO DAO" + e);
			return false;
		}
	}
}













