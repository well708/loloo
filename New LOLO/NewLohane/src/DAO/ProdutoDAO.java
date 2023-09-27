package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.ProdutoDTO;
import DTO.UserDTO;
import Util.Conexao;

public class ProdutoDAO {

    public boolean Cadastrar(ProdutoDTO produto) {
        Conexao con = null;
        try {
            con = new Conexao();
            con.executeUpdate("INSERT INTO produtos(nome_produto, tamanho, quantidade, preco, sub_total, imagem_url, id_usuario) VALUES ('"
            	    + produto.getNome_produto() + "','"
            	    + produto.getTamanho() + "',"
            	    + produto.getQuantidade() + ","
            	    + produto.getPreco() + ",'"
            	    + produto.getSub_total() + "','"
            	    + produto.getImagem_url() + "',"
            	    + produto.getUsuario().getId_user() + ");");

            return true;
        } catch (SQLException e) {
            System.out.println("Erro ao Inserir Produto: " + e);
            return false;
        }
    }

    public ArrayList<ProdutoDTO> ListarProdutos() {
        Conexao con = null;
        try {
            con = new Conexao();
            ResultSet resultado = con.executeQuery("SELECT * FROM produtos;");
            ArrayList<ProdutoDTO> listarProdutos = new ArrayList<ProdutoDTO>();
            
            while (resultado.next()) {
                ProdutoDTO produto = new ProdutoDTO();
                produto.setId_produto(resultado.getInt("id_produto"));
                produto.setNome_produto(resultado.getString("nome_produto"));
                produto.setTamanho(resultado.getString("tamanho"));
                produto.setQuantidade(resultado.getInt("quantidade"));
                produto.setPreco(resultado.getDouble("preco"));
                produto.setSub_total(resultado.getDouble("sub_total"));
                produto.setImagem_url(resultado.getString("imagem_url"));
                
                // Aqui você precisa criar um UserDTO com base no id do usuário na tabela de produtos
                UserDTO usuario = new UserDTO();
                usuario.setId_user(resultado.getInt("id_usuario"));
                produto.setUsuario(usuario);
                
                listarProdutos.add(produto);
            }
            return listarProdutos;
        } catch (SQLException e) {
            System.out.println("Erro na função listar Produtos DAO: " + e);
            return null;
        }
    }

	    public boolean Alterar_Quantidade(int id_produto, int novaQuantidade) {
	        Conexao con = null;
	        try {
	            con = new Conexao();
	            con.executeUpdate("UPDATE produtos SET "
	                              + "quantidade=" + novaQuantidade + ""
	                              + " WHERE id_produto=" + id_produto);
	            return true;
	        } catch (SQLException e) {
	            System.out.println("Erro na função atualizar produto DAO: " + e);
	            return false;
	        }
	    }
	    public boolean Alterar_Tamanho(int id_produto, String novoTamanho, float preco) {
	        Conexao con = null;
	        try {
	            con = new Conexao();
	            con.executeUpdate("UPDATE produtos SET tamanho='" + novoTamanho + "', preco=" + preco + " WHERE id_produto=" + id_produto);
	            return true;
	        } catch (SQLException e) {    
	            System.out.println("Erro na função atualizar tamanho produto DAO: " + e);
	            return false;
	        }
	    }


    public boolean DeletarProduto(int id) {
        Conexao con = null;
        try {
            con = new Conexao();
            con.executeUpdate("DELETE FROM produtos WHERE id_produto=" + id);
            return true;
        } catch (SQLException e) {
            System.out.println("Erro na função deletar produto DAO: " + e);
            return false;
        }
    }
}



