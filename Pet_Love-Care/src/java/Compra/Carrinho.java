package Compra;


public class Carrinho {
    
    private int iId_Carrinho;
    private float fPreco_carrinho;
    private int iQuantidade_carrinho;
    private int iStatus_carrinho;
    private int iId_produto;
    private int iId_cliente;

    public int getId_Carrinho() {
        return iId_Carrinho;
    }

    public void setId_Carrinho(int iId_Carrinho) {
        this.iId_Carrinho = iId_Carrinho;
    }

    public float getPreco_carrinho() {
        return fPreco_carrinho;
    }

    public void setPreco_carrinho(float fPreco_carrinho) {
        this.fPreco_carrinho = fPreco_carrinho;
    }

    public int getQuantidade_carrinho() {
        return iQuantidade_carrinho;
    }

    public void setQuantidade_carrinho(int iQuantidade_carrinho) {
        this.iQuantidade_carrinho = iQuantidade_carrinho;
    }

    public int getStatus_carrinho() {
        return iStatus_carrinho;
    }

    public void setStatus_carrinho(int iStatus_carrinho) {
        this.iStatus_carrinho = iStatus_carrinho;
    }

    public int getId_produto() {
        return iId_produto;
    }

    public void setId_produto(int iId_produto) {
        this.iId_produto = iId_produto;
    }

    public int getId_cliente() {
        return iId_cliente;
    }

    public void setId_cliente(int iId_cliente) {
        this.iId_cliente = iId_cliente;
    }


    
        
}
