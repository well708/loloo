<%@page import="DTO.UserDTO"%>
<%@page import="DAO.UserDAO"%>
<%@page import="DAO.ProdutoDAO"%>
<%@page import="DTO.ProdutoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <title>Lista de compras ADM</title>
  </head>
  <style>
    @charset "ISO-8859-1";
    /* Reset de Estilos */
    * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    }
    /* Estilos Globais */
    body {
    background: #fde3d8;
    font-family: 'Lato', sans-serif;
    margin: 0;
    padding: 0;
    }
    header {
    background: #111;
    color: white;
    font-size: 24px;
    padding: 20px 0;
    text-align: center;
    }
    main {
    background: #fde3d8;
    padding: 0 30px 0;
    }
    .page-title {
    font-size: 40px;
    padding: 50px 0;
    text-align: center;
    }
    .home{
    padding:10px;
    background-color:#fdfdfd;
    position:absolute;
    border-radius:90px;
    margin-top:50px;
    transition:.50s;
    cursor:pointer;
    }
    .home:hover{
    background-color:#6b6a6a;
    color:white;
    }
    .content {
    display: flex;
    }
    .content section {
    flex: 1;
    }
    .content aside {
    min-width: 250px;
    }
    /* Botões e Elementos Interativos */
    button {
    cursor: pointer;
    font-family: 'Lato', sans-serif;
    }
    /* Tabela de Produtos */
    table {
    background: #fff;
    width: 100%;
    border-collapse: collapse;
    }
    th, td {
    text-align: center;
    border-bottom: 1px solid #ccc;
    }
    th {
    padding:5px;
    text-transform: uppercase;
    color: #3e3e3e;
    font-weight: bold;
    background-color: lightgray;
    }
    tr {
    border-bottom: 3px solid #eee;
    }
    tr:last-child {
    border: none;
    }
    /* Imagens de Produtos */
    img {
    margin-top:4px;
    max-width: 100px;
    max-height: 100px;
    border: 1px solid #ccc;
    border-radius: 6px;
    }
    /* Quantidade de Produtos */
    .qty {
    background: #c7c7c7;
    display: inline-flex;
    padding: 0;
    justify-content: space-around;
    align-items: center;
    border-radius: 20px;
    overflow: hidden;
    height: 25px;
    }
    .qty span {
    margin: 0 5px;
    }
    .qty button {
    display: flex;
    align-items: center;
    background: transparent;
    border: none;
    height: 100%;
    }
    .qty button:hover {
    background: #ddd;
    }
    /* Botão de Remoção */
    .remove  {
    background: #c7c7c7;
    border: none;
    padding:5px;
    border-radius: 100%;
    font-size: 20px;
    cursor: pointer;
    }
    .remove:hover {
    background: #ddd;
    }
    /* Resumo da Compra */
    .box {
    margin-left:20px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    background: #eee;
    color: #222;
    }
    .box header {
    padding: 15px 20px;
    font-size: 18px;
    border-bottom: 1px solid #ccc;
    }
    .box .info {
    padding: 20px;
    font-size: 16px;
    }
    .box .info > div {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
    color: #555;
    }
    .box .info > div:last-child {
    margin: 0;
    }
    .box .info button {
    color:rgb(233 188 129);
    background: transparent;
    border: none;
    display: flex;
    align-items: center;
    font-size: 16px;
    }
    .box footer {
    padding: 15px 20px;
    background: #ddd;
    font-size: 18px;
    display: flex;
    justify-content: space-between;
    }
    aside > button {
    margin-left:20px;
    border: none;
    padding: 15px 0;
    color: white;
    background: rgb(233, 188, 129);
    display: block;
    width: 93%;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-size: 16px;
    border-radius: 9px
    }
    aside > button:hover {
    background: rgb(233 188 129 / 72%);
    }
    .tiulo_aside{
    text-align: center;
    color: white;	
    }
    .titulo_div_aside{
    background: black;	
    padding: 10px 0 ;
    }
    a{
    color: #111;
    text-decoration: none;
    }
    .modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.8);
    }
    .modal-content {
    background-color:#fff;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 20%;
    text-align: center;
    border-radius:10px; 
    }
    .close {
    margin-top:-20px;
    margin-right:-15px;
    color: #555;
    float: right;
    font-size: 30px;
    font-weight: bold;
    }
    .close:hover {
    color: black;
    text-decoration: none;
    cursor: pointer;
    }
    .butt-deletar{
    padding: 5px 7px;
    color: #fff;
    background-color: #f00;
    border-radius: 6px;
    }
    .butt-deletar:hover{
    background-color: #000;
    cursor: pointer;
    }
    .select_tamanho{
    background: #c7c7c7;
    border:none;
    padding: 5px 10px;
    border-radius: 20px;
    overflow: hidden;
    height: 25px; 
    } 
  </style>
  <body>
    <%
      ProdutoDAO Listar_Produto = new ProdutoDAO();
      ArrayList<ProdutoDTO> users = Listar_Produto.ListarProdutos();
      int id_Produto= 0;
      
      int id_user = 0;
      
      double preco = 0;
      int quantidade = 0;
      UserDAO listar = new UserDAO();
      ArrayList<UserDTO> lista = listar.ArrayListarUser();
      
      
      
      %>
    <header>
      <span>Carrinho de vendas do <b>ADM</b></span>
    </header>
    <main>
      
      <div class="page-title"> Seu Carrinho</div>
      <div class="content">
        <section>
          <table>
            <tr>
              <th>efjoj</th>
              <th>Comprador</th>
              <th>Código produto</th>
              <th>Img</th>
              <th>Nome</th>
              <th>Preço</th>
              <th>Quantidade</th>
              <th>Tamanho</th>
              <th>Sub-total</th>
              <th>Deletar</th>
            </tr>
            <tbody>
              <%
                int id_de_Procura = 0;
              double total = 0;

              for (UserDTO cliente : lista) {
                  id_de_Procura = cliente.getId_user();
                  boolean encontrou = false;

                  for (ProdutoDTO user : users) {
                      if (user.getUsuario().getId_user() == id_de_Procura) {
                          encontrou = true;

                          double sub_total = (user.getQuantidade() * user.getPreco()); 
                          total += sub_total;
                %>   
              <tr>
                <td><%= cliente.getId_user() %></td>
                <td><%= cliente.getNome() %></td>
                <td><%= user.getId_produto()%></td>
                <td>
                  <div class="product">
                    <img src="<%=user.getImagem_url()%>" alt="imagem do produto"> 
                  </div>
                </td>
                <td>
                  <div class="info">
                    <div class="category">Categoria</div>
                    <div class="name"><%= user.getNome_produto() %></div>
                  </div>
                </td>
                <td> R$ <span id="preco_<%= user.getId_produto() %>"><%= user.getPreco()%></span></td>
                <td>
                  <div class="qty">
                    <button onclick="diminuirQuantidade(<%= user.getId_produto() %>, <%= user.getPreco()%>, <%=cliente.getId_user()%>)">
                    <span class="material-symbols-outlined">remove</span>
                    </button>
                    <span class="qry_meio" id="quantidade_<%= user.getId_produto() %>"><%= user.getQuantidade()%></span>
                    <button onclick="aumentarQuantidade(<%= user.getId_produto() %>, <%= user.getPreco() %>,<%=cliente.getId_user()%>)">
                    <span class="material-symbols-outlined tam">add</span>
                    </button>
                  </div>
                </td>
                <td>
                  <select class="select_tamanho" id="tamanho_<%= user.getId_produto() %>" onchange="changeTamanho(this, '<%= user.getId_produto() %>','<%=id_de_Procura%>','<%= user.getSub_total()%>')">
                    <option value="" disabled selected><%= user.getTamanho()%></option>
                    <option value="PP" data-preco="0">PP</option>
                    <option value="P" data-preco="10.00">P</option>
                    <option value="M" data-preco="11.00">M</option>
                    <option value="G" data-preco="12.00">G</option>
                    <option value="GG" data-preco="13.50">GG</option>
                  </select>
                </td>
                <td>R$ <span id="subtotal_<%= user.getId_produto() %>"><%= user.getQuantidade() * user.getPreco() %></span></td>
                <td><span class="material-symbols-outlined remove " onclick="openModalDeletar('<%=id_de_Procura %>','<%=user.getId_produto() %>')">close</span></td>
              </tr>
              <%
                }
                }
                
                
                  }
                
                  %>
          </table>
          </tbody>
          </table>
          <!-- modal deletar -->
          <div id="myModal" class="modal">
            <div class="modal-content">
              <span class="close" id="closeModalBtn" onclick="closeModal()">&times;</span>
              <br>
              <p>Tem certeza de que deseja excluir este produto?</p>
              <br>
<a class="butt-deletar"  onclick="enviar_for_deleta()"><b>Sim, Excluir<b></a>            </div>
          </div>
        </section>
        <aside>
          <div class="box">
            <div class="titulo_div_aside">
              <h1 class="tiulo_aside">
              Total de vendas</header>
            </div>
           
            <footer>
              <span>Total</span>
              <span>R$ <%=total%></span>
            </footer>
          </div>
          <button>Mandar para entrega</button>
        </aside>
      </div>
    </main>
    <form action="Altera_quantidade.jsp" method="post" id="quantidadeForm">
      <input type="hidden" name="id_User_quantidade" id="id_User_quantidade" >
      <input type="hidden" name="id_produto" id="id_produto">
      <input type="hidden" name="quantidade" id="quantidade">
    </form>
    
    <form action="Altera_tamanho.jsp" method="post" id="tamnhoForm">
      <input type="hidden" name="id_User_tamanho" id="id_User_tamanho">
      <input type="hidden" name="preco_por_tamanho" id="preco_por_tamanho">
      <input type="hidden" name="id_produtoo" id="id_produtoo">
      <input type="hidden" name="tamanho" id="tamanho">
    </form>
    
    <form action="Deletar_Produto.jsp" method="post" id="deletar">
      <input type="hidden" name="id_produto_deletar" id="id_produto_deletar">
      <input type="hidden" name="id_user_deletar" id="id_user_deletar">
    </form>
    <script>
    function enviar_for_deleta() {
     	document.getElementById("deletar").submit();
		
	}
      	
    function openModalDeletar(id_user , idProduto) {
        var modal = document.getElementById("myModal");
        modal.style.display = "block";
        
        document.getElementById("id_produto_deletar").value = idProduto;
  	  document.getElementById("id_user_deletar").value = id_user;
  	  
 
      }
    
    function return_index(){
    	document.getElementById("return_index").submit();
    }
      // Função para fechar o modal
      function closeModal() {
        var modal = document.getElementById("myModal");
        modal.style.display = "none";
      }
       
      	
      	
      	
      	
      // Função para aumentar a quantidade de um produto
      	  function subtotal(subtotalSpan, subtotalValue,quantidade, idProduto, id) {
      	  subtotalSpan.textContent = subtotalValue;
      	  
      	  var quantidadeSpan = document.getElementById("quantidade_" + idProduto);
      	  document.getElementById("id_produto").value = idProduto;
      	  document.getElementById("quantidade").value = quantidade;
      	  document.getElementById("id_User_quantidade").value = id;
      	  
      	  document.getElementById("quantidadeForm").submit();
      	  
      	}

      	function aumentarQuantidade(idProduto, preco, id) {
      	  var quantidadeSpan = document.getElementById("quantidade_" + idProduto);
      	  var quantidade = parseInt(quantidadeSpan.textContent);
      	  quantidade++;
      	  quantidadeSpan.textContent = quantidade;

      	  var subtotalSpan = document.getElementById("subtotal_" + idProduto);
      	  var subtotalValue = (quantidade * preco).toFixed(1);
      	  
      	  subtotal(subtotalSpan, subtotalValue, quantidade, idProduto, id);
      	} 

      	// Função para diminuir a quantidade de um produto
      	function diminuirQuantidade(idProduto, preco, id) {
      	  var quantidadeSpan = document.getElementById("quantidade_" + idProduto);
      	  var quantidade = parseInt(quantidadeSpan.textContent);
      	  if (quantidade > 0) {
      	    quantidade--;
      	    quantidadeSpan.textContent = quantidade;

      	    var subtotalSpan = document.getElementById("subtotal_" + idProduto);
      	    var subtotalValue = (quantidade * preco).toFixed(1);

      	    subtotal(subtotalSpan, subtotalValue, quantidade, idProduto, id);
      	  }
      	}
      	
      	
      	
	      	 function changeTamanho(selectElement, idProduto, id, valor_padrao) {
	             // Obtenha a opção selecionada no <select>
	             var selectedOption = selectElement.options[selectElement.selectedIndex];
	            
	             // Obtenha o valor da opção selecionada
	             var tamanhoSelecionado = selectedOption.value;
	            
	             // Defina o valor da opção selecionada no elemento 'tamanho'
	             document.getElementById("tamanho").value = tamanhoSelecionado;
	             document.getElementById("id_produtoo").value = idProduto;
	             document.getElementById("id_User_tamanho").value = id;
	             
	             var preco = parseFloat(selectedOption.getAttribute("data-preco"));
	            
	           
	            preco_padrao = parseFloat(valor_padrao);
	             document.getElementById("preco_por_tamanho").value = preco_padrao + preco;
	             
	             document.getElementById("tamnhoForm").submit();
	         
	            }
	            
    </script>
  </body>
</html>