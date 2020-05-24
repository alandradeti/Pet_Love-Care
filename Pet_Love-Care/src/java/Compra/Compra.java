package Compra;

public class Compra {
    
    //private int iId_compra;
    private String sData_compra;
    private float fValor_compra;
    private String sTipo_pagamento_compra;
    private String sNumero_cartao;
    private String iNumero_seguranca_cartao;
    private int iNumero_parcela;
    private int iId_cliente;

    public Compra() {
    }

    public String getData_compra() {
        return sData_compra;
    }

    public void setData_compra(String sData_compra) {
        this.sData_compra = sData_compra;
    }

    public float getValor_compra() {
        return fValor_compra;
    }

    public void setValor_compra(float fValor_compra) {
        this.fValor_compra = fValor_compra;
    }

    public String getTipo_pagamento_compra() {
        return sTipo_pagamento_compra;
    }

    public void setTipo_pagamento_compra(String sTipo_pagamento_compra) {
        this.sTipo_pagamento_compra = sTipo_pagamento_compra;
    }

    public String getNumero_cartao() {
        return sNumero_cartao;
    }

    public void setNumero_cartao(String sNumero_cartao) {
        this.sNumero_cartao = sNumero_cartao;
    }

    public int getId_cliente() {
        return iId_cliente;
    }

    public void setId_cliente(int iId_cliente) {
        this.iId_cliente = iId_cliente;
    }

    public int getNumero_parcela() {
        return iNumero_parcela;
    }

    public void setNumero_parcela(int iNumero_parcela) {
        this.iNumero_parcela = iNumero_parcela;
    }

    public String getNumero_seguranca_cartao() {
        return iNumero_seguranca_cartao;
    }

    public void setNumero_seguranca_cartao(String iNumero_seguranca_cartao) {
        this.iNumero_seguranca_cartao = iNumero_seguranca_cartao;
    }
    

    
}
