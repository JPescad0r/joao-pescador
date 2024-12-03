package model;

public class Produto {
    private int codigo;
    private String nome;
    private String marca;
    private double preco;

   
   
    
    public Produto() {}

    public Produto(int codigo, String nome, String marca, double preco) {
        this.codigo = codigo;
        this.nome = nome;
        this.marca = marca;
        this.preco = preco;   
    }
    
    public Produto(int codigo, String nome, double preco) {
        this.codigo = codigo;
        this.nome = nome;
        this.preco = preco;   
    }
    
     public Produto( String nome, String marca, double preco) {
        this.nome = nome;
        this.marca = marca;
        this.preco = preco;   
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

   

    @Override
    public String toString() {
        return "Produto{" + "codigo=" + codigo + ", nome=" + nome + ", marca=" + marca + ", preco=" + preco + '}';
    }
            
}
