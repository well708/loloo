<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="DTO.UserDTO" %>

<%
String nome = request.getParameter("nome");
String email = request.getParameter("email");
String senha = request.getParameter("senha_cadastrar");

boolean result = false;
boolean verifica = false;
UserDAO listar = new UserDAO();
ArrayList<UserDTO> lista = listar.ArrayListarUser();

for (UserDTO user : lista) {
    if (user.getEmail().equals(email)) {
        verifica = true;
        break;
    }
}

if (verifica) { 
    response.sendRedirect("../PG_Principal/index.html?conf=existe");
} else {
    UserDTO cadastra = new UserDTO();
    cadastra.setNome(nome);
    cadastra.setEmail(email);
    cadastra.setSenha(senha);

    UserDAO clienteDao = new UserDAO();
    result = clienteDao.Cadastrar(cadastra);
    response.sendRedirect("../Cliente/Entrar.jsp?email=" + email + "&senha_entrar=" + senha);
}
%>
