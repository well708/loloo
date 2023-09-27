<%@ page import="DAO.UserDAO" %>
<%@ page import="DTO.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1">
    <title>Deletar Usuário</title>
  </head>
  <body>
    <%
      int id = Integer.parseInt(request.getParameter("huser"));
      
      UserDAO userdao = new UserDAO();
      userdao.DeletUser(id);
      
      response.sendRedirect("../PG_Principal/index.html?conf=deleta");
      %>
  </body>
</html>