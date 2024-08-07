package DTO;



public class ProdutoDTO {
    private int id_produto;
    private String nome_produto;
    private String tamanho;
    private int quantidade;
    private double preco;
    private double sub_total;
    private String imagem_url;
    private UserDTO usuario; // Referência ao usuário

    // Construtor vazio
    public ProdutoDTO() {
    }

    public int getId_produto() {
        return id_produto;
    }

    public void setId_produto(int id_produto) {
        this.id_produto = id_produto;
    }

    public String getNome_produto() {
        return nome_produto;
    }

    public void setNome_produto(String nome_produto) {
        this.nome_produto = nome_produto;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public String getImagem_url() {
        return imagem_url;
    }

    public void setImagem_url(String imagem_url) {
        this.imagem_url = imagem_url;
    }

    public UserDTO getUsuario() {
        return usuario;
    }

    public void setUsuario(UserDTO usuario) {
        this.usuario = usuario;
    }
    public double getSub_total() {
  		return sub_total;
  	}

  	public void setSub_total(double sub_total) {
  		this.sub_total = sub_total;
  	}

}
