<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UserDAO"%>
<%@page import="DTO.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1">
    <title>Alterar</title>
  </head>
  <body>
    <%
      int id = Integer.parseInt(request.getParameter("huser"));
      String nome = request.getParameter("nome");
      String email = request.getParameter("email");
      String email_antigo = request.getParameter("email_antigo");
      String senha = request.getParameter("senha_alterar");
      
      boolean verifica = false;
      UserDAO listar = new UserDAO();
      ArrayList<UserDTO> lista = listar.ArrayListarUser();
      
      for (UserDTO user : lista) {
        if (email.equals(user.getEmail())) {
          verifica = true;
          break;
        }
      }
      
      UserDTO user = new UserDTO();
      user.setId_user(id);
      
      if (nome != null && !nome.isEmpty()) {
        user.setNome(nome);
      }
      
      if (senha != null && !senha.isEmpty()) {
        user.setSenha(senha);
      }
      
      if (email != null && !email.isEmpty()) {
        if (verifica && !email.equals(email_antigo)) {
          user.setEmail(email_antigo);
          %>
          <form id="return_Form" action="index.jsp?conf=existe" method="post">
            <input type="hidden" name="nome_User" id="nome_User" value="<%=nome%>" />
            <input type="hidden" name="email_User" id="email_User" value="<%=email_antigo%>" />
            <input type="hidden" name="senha_User" id="senha_User" value="<%=senha%>" />
            <input type="hidden" name="id_User" id="id_User" value="<%=id%>" />
            <input type="submit" value="Enviar" />
          </form>
          <script>
            document.getElementById("return_Form").submit();
          </script>
          <%
        } else if (!verifica && !email.equals(email_antigo)) {
          user.setEmail(email);
        } else {
          user.setEmail(email_antigo);
        }
      } else {
        user.setEmail(email_antigo);
      }
      
      UserDAO userdao = new UserDAO();
      userdao.AlterarUsuario(user);
    %>
    
    <form id="return_Form" action="index.jsp?conf=altera" method="post">
      <input type="hidden" name="nome_User" id="nome_User" value="<%=nome%>" />
      <input type="hidden" name="email_User" id="email_User" value="<%=email%>" />
      <input type="hidden" name="senha_User" id="senha_User" value="<%=senha%>" />
      <input type="hidden" name="id_User" id="id_User" value="<%=id%>" />
      <input type="submit" value="Enviar" />
    </form>
    <script>
      document.getElementById("return_Form").submit();
    </script>
  </body>
</html>
