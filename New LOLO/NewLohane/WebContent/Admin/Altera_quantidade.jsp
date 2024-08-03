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
        int id_produto = Integer.parseInt(request.getParameter("id_produto"));
        int id_usuario = Integer.parseInt(request.getParameter("id_User_quantidade"));
        int novaQuantidade = Integer.parseInt(request.getParameter("quantidade"));
       
        ProdutoDTO produtoAtualizado = new ProdutoDTO();
        
        produtoAtualizado.setId_produto(id_produto);
        produtoAtualizado.setQuantidade(novaQuantidade);
      
        UserDTO usuario = new UserDTO();
        
        usuario.setId_user(id_usuario);
        produtoAtualizado.setUsuario(usuario);
       
        // Atualize as informações do produto no banco de dados
        ProdutoDAO produtoDAO = new ProdutoDAO();
        boolean sucesso = produtoDAO.Alterar_Quantidade(id_produto, novaQuantidade);
       
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
