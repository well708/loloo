<%@ page import="DAO.ProdutoDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deletar Produto</title>
</head>
<body>
    <%
       int id_produto = Integer.parseInt(request.getParameter("id_produto_deletar"));
        
        
        ProdutoDAO produtoDAO = new ProdutoDAO();
        boolean resultado = produtoDAO.DeletarProduto(id_produto);
        
        if (resultado) {
        	
        	
        	response.sendRedirect("Lista_produtos.jsp");
    %>
       
    <%
        } else {
            
            response.sendRedirect("Listar_produtos.jsp?conf=erro_deletar");
        }
    %>
</body>
</html>
