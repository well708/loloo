<%@page import="DAO.ProdutoDAO"%>
<%@page import="DTO.ProdutoDTO"%>
<%@page import="DTO.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Atualizar Produto</title>
</head>
<body>
    <%
        int id_produto = Integer.parseInt(request.getParameter("id_produtoo"));
        int id_usuario = Integer.parseInt(request.getParameter("id_User_tamanho"));

        String novoTamanho = request.getParameter("tamanho"); 
        float preco = Float.parseFloat(request.getParameter("preco_por_tamanho"));

       
        // Crie um objeto ProdutoDTO com os novos valores
        ProdutoDTO produtoAtualizado = new ProdutoDTO();
        produtoAtualizado.setId_produto(id_produto);
     
        produtoAtualizado.setTamanho(novoTamanho); // Defina o novo tamanho
        
        // Crie um objeto UserDTO com o ID do usuário
        UserDTO usuario = new UserDTO();
        usuario.setId_user(id_usuario);
        produtoAtualizado.setUsuario(usuario);
       
        // Atualize as informações do produto no banco de dados
        ProdutoDAO produtoDAO = new ProdutoDAO();
        boolean sucesso = produtoDAO.Alterar_Tamanho(id_produto, novoTamanho, preco);
       
        if (sucesso) {
        	response.sendRedirect("Lista_produtos.jsp");
    
        } else {
    %>
        <!-- Ocorreu um erro ao atualizar o produto -->
        <h1>Erro ao atualizar o produto.</h1>
        <a href="pagina_de_erro.jsp">Voltar</a>
    <%
        }
    %>
    
</body>
</html>
	