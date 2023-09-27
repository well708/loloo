<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="DTO.UserDTO" %>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
    <title>Lohane Lima</title>
  </head>
  <style>
  
   input[readonly] {
         background-color: #f2f2f2; /* Define a cor de fundo para campos desabilitados */
    color: #888888;
    }
    .modal {
    display: none; 
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
    }
    .modal-content {
    background-color: #ffccb4;
    position: absolute; /* Mude para absolute */
    left: 50%; /* Centralize horizontalmente na tela */
    top: 50%; /* Centralize verticalmente na tela */
    transform: translate(-50%, -50%); /* Centralize tanto horizontal quanto verticalmente */
    margin: 0 auto; /* Remova a margem anterior */
    padding: 20px;
    border: 2px solid #888;
    width: 80%;
    max-width: 400px;
}
    .close {
    color: #3f3f3f;
    float: right;
    font-size: 28px;
    font-weight: bold;
    }
    .close:hover,
    .close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
    }
    .modal-title {
    text-align: center;
    }
    form {
    display: flex;
    flex-direction: column;
    }
    input,
    button {
    margin-bottom: 10px;
    }
    .caixa-form {
    padding: 9px;
    border-radius: 9px;
    }
    button {
    padding: 10px;
    background-color: rgb(233, 188, 129);
    color: black;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    font-weight: 600;
    }
    button:hover {
    color: white;
    background-color: rgb(186, 155, 113);
    }
    .titulo h1 {
    text-align: center;
    font-size: 20px;
    text-decoration: underline;
    }
    .titulo h2 {
    font-size: 12px;
    margin-top: 6px;
    margin-bottom: 6px;
    }
    form {
    display: flex;
    flex-direction: column;
    }
    input,select {
    margin-bottom: 10px;
    padding: 10px;
    border-radius: 3px;
    outline: none;
    }
    input:hover {
    border-bottom: 3px solid rgb(186, 155, 113);
    }
    .usuario{
    margin-top: 30px;
    }
  </style>
  <body>
      <% 
      String nome = request.getParameter("nome_User");
      String email = request.getParameter("email_User");
      String senha = request.getParameter("senha_User");
      int id = Integer.parseInt(request.getParameter("id_User"));
        
        %>
    <script>
      // open modal de logar
      function Alterar_User() {
        document.getElementById("alterar").style.display = "block";
      }
      
      // open modal de register 
      function Excluir_User() {
        document.getElementById("excluir").style.display = "block";
      }
      
      // close modal
      function closeModal() {
        document.getElementById("alterar").style.display = "none";
        document.getElementById("excluir").style.display = "none";
        document.getElementById("form-carrinho").style.display = "none";
      }
      
      // Emissão de alerta ao retornar da página de cadastro.
      var retorna = new URLSearchParams(window.location.search);
      var elemento = retorna.get('conf');
      
      switch (elemento) {
        case 'altera':
          setTimeout(function() {
            alert('Usuário alterado!');
          }, 100);
          break;
          
        case 'existe':
            setTimeout(function() {
              alert('Este usuário não pode ser alterado!');
            }, 100);
            break;
        }

      
      
      
      
      
      
      
      
      
      
      
      
      
   
      
      function Form_carrinho(nomeProduto, quantidade, preco, imagemUrl, idUsuario, tamanhoSelecionado) {
    	  var selectTamanho = document.getElementById("tamanho");

    	  // Adicionar um evento onchange ao selectTamanho
    	  selectTamanho.onchange = function () {
    	    // Obter a opção selecionada
    	    var opcaoSelecionada = selectTamanho.options[selectTamanho.selectedIndex];

    	    // Obter o preço da opção selecionada usando o atributo data-preco
    	    var precoSelecionado = parseFloat(opcaoSelecionada.getAttribute("data-preco"));
    	    var tamanho = opcaoSelecionada.getAttribute("value");

    	    // Certificar-se de que preco e precoSelecionado são números
    	    preco = parseFloat(preco);

    	    // Calcular o novo preço somando ao preço atual
    	    var novo_valor = preco + precoSelecionado;

    	    // Atualizar o campo de preço
    	    document.getElementById("preco").value = novo_valor.toFixed(2); // Formate o preço como desejar

    	    // Atualizar o campo de tamanho
    	    document.getElementById("tam").value = tamanho;
    	  };
    	  preco = parseFloat(preco);
    	  document.getElementById("nome_produto").value = nomeProduto;
    	  document.getElementById("quantidade").value = quantidade;
    	  document.getElementById("tam").value = tamanhoSelecionado; // Defina o tamanho selecionado aqui
    	  document.getElementById("preco_padrao").value = preco; // Defina o tamanho selecionado aqui

    	  document.getElementById("imagem_url").value = imagemUrl;
    	  document.getElementById("id_usuario").value = idUsuario;

    	  // Abra o modal ou realize outras ações com os valores
    	  document.getElementById("form-carrinho").style.display = "block";
    	}

      
      
      
    </script>
    <div class="background">
    <header>
      <div class="logo">
        <h1>Styloh</h1>
      </div>
      <div class="cabeçalho-link">
        <a href="#">Inicio</a>
        <a href="#">Destaque</a>
        <a href="#">Novo</a>
        <a href="#contato">Contato</a>
        <li class="dropdown">
          <a href="#">Login</a>
          <div class="dropdown-content">
            <a href="../PG_Principal/index.html">Sair</a>
            <a href="#" onclick="Alterar_User()">Alterar</a>
            <a href="#" onclick="Excluir_User()">Excluir</a>
          </div>
        </li>



<%

session.setAttribute("id_User", id);

%>

<a href="../Carrinho_de_compras/Carrinho.jsp"> <span class="material-symbols-outlined" target="_self">shopping_cart</span></a>
<a href="../Carrinho_de_compras/teste.jsp"><span class="material-symbols-outlined" target="_self">favorite</span></a>

      </div>
    </header>
    
    <div id="alterar" class="modal"><!-- modal alterar -->
      <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <div class="titulo">
          <h1 >Alterar</h1>
          <h2>Tela de alteração</h2>
        </div>
        <form action="Alterar.jsp" method="post">
          <label>Código do usuário:</label>
          <input type="text" name="idcliente" id="idcliente" disabled="disabled" value="<%= id %>">
          <input type="hidden" name="huser" id="huser" value="<%= id %>">
          <p>Nome:</p>
          <input type="text" name="nome" id="nome" value="<%= nome%>">
          <p>E-mail:</p>
          <input type="email" name="email" id="email" value="<%=email%>" required>
          <input type="hidden" name="email_antigo" id="email_antigo" value="<%= email%>" >
          <p>Senha:</p>
          <input type="text" name="senha_alterar" id="senha_alterar" value="<%= senha%>" required> 
          <button type="submit">Alterar</button>
        </form>
      </div>
    </div>
   
    <div id="excluir" class="modal"> <!-- Modal para excluir-->
      <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <div class="titulo">
          
          <h1 style="margin-bottom: 20px;">Tenm certeza que deseja excluir?</h1>
          <form action="Excluir.jsp" method="post">
            <label>Código do usuário:</label>
            <input type="text" name="idcliente" id="idcliente" disabled="disabled" value="<%= id %>">
            <input type="hidden" name="huser" id="huser" value="<%= id %>">
            <p>Nome:</p>
            <input type="text" name="nome" id="nome" disabled="disabled" value="<%= nome%>">
            <p>E-mail:</p>
            <input type="email" name="email" id="email" disabled="disabled" value="<%= email%>" required>
            <p>Senha:</p>
            <input type="text" name="senha_alterar" id="senha_alterar" disabled="disabled" value="<%= senha%>" required> 
            <button type="submit">Excluir</button>
           </form>
        </div>
      </div>
    </div>
    
     <div id="form-carrinho" class="modal"> <!-- Modal para cadastrar carrinho-->
      <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <div class="titulo">
          
          <h1 style="margin-bottom: 20px;">Produtos</h1>
          
     <form id="form-carrinho" action="../Carrinho_de_compras/Cadastra_Produto.jsp" method="post">
    <label for="id_usuario">Código do Usuário:</label>
    <input type="number" id="id_usuario" name="id_usuario" required readonly>
    <input type="hidden" id="imagem_url" name="imagem_url">
    
    <label for="nome_produto">Nome do Produto:</label>
    <input type="text" id="nome_produto" name="nome_produto" required readonly>

    <label for="preco">Preço:</label>
    <input type="text" id="preco" name="preco" required readonly value="Primeiro escolha o tamanho">
     <input type="hidden" id="preco_padrao" name="preco_padrao" required >

    <label for="quantidade">Quantidade:</label>
    <input type="number" id="quantidade" name="quantidade" required>

    <label for="tamanho">Tamanho:</label>
    <input type="hidden" id="tam" name="tam" >
 
<select class="select_tamanho" id="tamanho" onchange="atualizarPreco(this.value)" required>
  <option value="" disabled selected>Ecolha o tamanho</option>   
  <option value="PP" data-preco="0" >PP</option>
  <option value="P" data-preco="10.00">P</option>
  <option value="M" data-preco="11.00">M</option>
  <option value="G" data-preco="12.00">G</option>
  <option value="GG" data-preco="13.50">GG</option>
</select>




    <br>

    <button type="submit">Cadastrar Produto</button>
</form>


        </div>
      </div>
    </div>
    
    
    
    
    
    <div class="Meio">
      <h1><%=nome.toUpperCase()%>: TEMOS NOVIDADES</h1>
      <p>Na loja Styloh você encontrará as últimas tendências em moda feminina e várias novidades para você.<br>Monte looks incríveis e estilosos com a nossa variedade de roupas femininas.</p>
      <button>Nova Coleção</button>
    </div>
    <section>
      <br>
      <h1 style="margin-top: 40px;">NOVAS CATEGORIAS</h1>
      <div class="container-card">
        <div class="cards">
          <img src="roupaCapa/IMG-20230423-WA0004.jpg">
        </div>
        <div class="cards">
          <img src="roupaCapa/IMG-20230423-WA0005.jpg">
        </div>
        <div class="cards">
          <img src="roupaCapa/IMG-20230423-WA0006.jpg">
        </div>
        <div class="cards">
          <img src="roupaCapa/IMG-20230423-WA0007.jpg">
        </div>
        <div class="cards">
          <img src="roupaCapa/IMG-20230423-WA0008.jpg">
        </div>
        <div class="cards">
          <img src="roupaCapa/IMG-20230423-WA0009.jpg">
        </div>
      </div>
    </section>
    <section class="cta">
      <div class="text-cta">
        <h6>Monte seu Look aqui</h6>
        <h4>30% OFF<br>NOVAS ROUPAS</h4>
        <a href="#" class="btn">Compre agora</a>
      </div>
    </section>
    <section>
    
    
    
 

	
	
	
	
	
      <h1>ESTOQUES NOVOS</h1>
      <div class="container-roupas">
        <div class="roupa">
          <img src="roupasSite/roup1.jpg">
          <p>R$45</p>
<div class="preco-container" onclick="Form_carrinho('Cropped preta', 1, '45', 'roupasSite/roup1.jpg', <%=id%>)">Comprar<span class="material-symbols-outlined">shopping_cart_checkout</span></div>
        </div>
        <div class="roupa">
          <img src="roupasSite/roup2.jpg">
          <p>R$100</p>
          <div class="preco-container" onclick="Form_carrinho('Calça', 1, '100', 'roupasSite/roup2.jpg', <%=id%>)">Comprar<span class="material-symbols-outlined">shopping_cart_checkout</span></div>
        </div>
        <div class="roupa">
          <img src="roupasSite/roup3.jpg">
          <p>R$50</p>
          <div class="preco-container" onclick="Form_carrinho('Cropped verde', 1, '50', 'roupasSite/roup3.jpg', <%=id%>)" >Comprar<span class="material-symbols-outlined">shopping_cart_checkout</span></div>
        </div>
        <div class="roupa">
          <img src="roupasSite/roup4.jpg">
          <p>R$70</p>
          <div class="preco-container" onclick="Form_carrinho('Short jeans ', 1, '70', 'roupasSite/roup4.jpg', <%=id%>)">Comprar<span class="material-symbols-outlined">shopping_cart_checkout</span></div>
        </div>
        <div class="roupa">
          <img src="roupasSite/roup5.jpg">
          <p>R$63</p>
          <div class="preco-container" onclick="Form_carrinho('Camisa de botão ', 1, '63', 'roupasSite/roup5.jpg', <%=id%>)" >Comprar<span class="material-symbols-outlined">shopping_cart_checkout</span></div>
        </div>
        <div class="roupa">
          <img src="roupasSite/roup7.jpg">
          <p>R$85</p>
          <div class="preco-container" onclick="Form_carrinho('Conjunto shorte e regata', 1, '85', 'roupasSite/roup7.jpg', <%=id%>)">Comprar<span class="material-symbols-outlined">shopping_cart_checkout</span></div>
        </div>
        <div class="roupa">
          <img src="roupasSite/roup8.jpg">
          <p>R$75</p>
          <div class="preco-container" onclick="Form_carrinho('Conjunto saia e cropped', 1, '75', 'roupasSite/roup8.jpg', <%=id%>)">Comprar<span class="material-symbols-outlined">shopping_cart_checkout</span></div>
        </div>
        <div class="roupa">
          <img src="roupasSite/roup11.jpg">
          <p>R$55</p>
          <div class="preco-container" onclick="Form_carrinho('Saia verde', 1, '55', 'roupasSite/roup11.jpg', <%=id%>)">Comprar<span class="material-symbols-outlined">shopping_cart_checkout</span></div>
        </div>
        <div class="roupa">
          <img src="roupasSite/roup9.jpg">
          <p>R$49.9</p>
          <div class="preco-container" onclick="Form_carrinho('Conjunto cropped e shorte', 1, '49.90', 'roupasSite/roup9.jpg', <%=id%>)">Comprar<span class="material-symbols-outlined">shopping_cart_checkout</span></div>
        </div>
        <div class="roupa">
          <img src="roupasSite/roup12.jpg">
          <p>R$60</p>
          <div class="preco-container" onclick="Form_carrinho('Saia', 1, '60', 'roupasSite/roup12.jpg', <%=id%>)">Comprar<span class="material-symbols-outlined">shopping_cart_checkout</span></div>
        </div>
      </div>
    </section>
    <section class="Sobre">
      <h4>Sobre nossa empresa</h4>
      <p1>A Styloh é uma das principais lojas de roupas femininas do Brasil. É sinônimo de uma moda que traduz as tendências mais atuais de forma estilosa, feminina e com looks perfeitos para você. Fundada em 2023, nossa loja aposta em looks que representam o estilo de vida de mulheres modernas e sofisticadas. Blusas, calças e vestidos perfeitos para todos os momentos, a Styloh é sempre a protagonista quando se fala em moda e estilo.</p1>
    </section>
    <section class="Contato" id="contato">
      <div class="meio-contato">
        <h1>Styloh</h1>
        <h1>Entre em contato conosco</h1>
      </div>
      <div class="meio-contato">
        <h1>Explore</h1>
        <li><a href="#"> Página inicial</a></li>
        <li><a href="#">Destaque</a></li>
        <li><a href="#">Novo</a></li>
        <li><a href="#">Contato</a></li>
      </div>
      <div class="meio-contato">
        <h1>Outros serviços</h1>
        <li><a href="#">Preços</a></li>
        <li><a href="#">Frete grátis</a></li>
        <li><a href="#">Cartões-presente</a></li>
      </div>
      <div class="meio-contato">
        <h1>Redes Sociais</h1>
        <div class="logo-container">
          <li><a href="#"><img src="img logos/face.png" alt="facebook" class="objetoslogo"></a></li>
          <li><a href="#"><img src="img logos/wapp.png" alt="whatsapp" class="objetoslogo"></a></li>
          <li><a href="https://www.instagram.com/looh_lims/"><img src="img logos/insta.png" alt="instagram" class="objetoslogo"></a></li>
        </div>
      </div>
    </section>
  </body>
</html>