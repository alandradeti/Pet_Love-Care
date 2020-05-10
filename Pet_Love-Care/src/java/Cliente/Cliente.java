package Cliente;

public class Cliente {
    private int     iId_cliente;
    private String  sNome_cliente;
    private String  sCpf_cliente;
    private String  sRg_cliente;
    private char    cSexo_cliente;
    private String  sEndereco_cliente;
    private String  sEmail_cliente;
    private String  sTelefone_fixo_cliente;
    private String  sTelefone_celular_cliente;
    private String  sData_nascimento_cliente;
    private String  sSenha_cliente;

    public Cliente() {
    }
    
    public int getId_cliente() {
        return iId_cliente;
    }

    public void setId_cliente(int iId_cliente) {
        this.iId_cliente = iId_cliente;
    }

    public String getNome_cliente() {
        return sNome_cliente;
    }

    public void setNome_cliente(String sNome_cliente) {
        this.sNome_cliente = sNome_cliente;
    }

    public String getCpf_cliente() {
        return sCpf_cliente;
    }

    public void setCpf_cliente(String sCpf_cliente) {
        this.sCpf_cliente = sCpf_cliente;
    }

    public String getRg_cliente() {
        return sRg_cliente;
    }

    public void setRg_cliente(String sRg_cliente) {
        this.sRg_cliente = sRg_cliente;
    }

    public char getSexo_cliente() {
        return cSexo_cliente;
    }

    public void setSexo_cliente(char sSexo_cliente) {
        this.cSexo_cliente = sSexo_cliente;
    }

    public String getEndereco_cliente() {
        return sEndereco_cliente;
    }

    public void setEndereco_cliente(String sEndereco_cliente) {
        this.sEndereco_cliente = sEndereco_cliente;
    }

    public String getEmail_cliente() {
        return sEmail_cliente;
    }

    public void setEmail_cliente(String sEmail_cliente) {
        this.sEmail_cliente = sEmail_cliente;
    }

    public String getTelefone_fixo_cliente() {
        return sTelefone_fixo_cliente;
    }

    public void setTelefone_fixo_cliente(String sTelefone_fixo_cliente) {
        this.sTelefone_fixo_cliente = sTelefone_fixo_cliente;
    }

    public String getTelefone_celular_cliente() {
        return sTelefone_celular_cliente;
    }

    public void setTelefone_celular_cliente(String sTelefone_celular_cliente) {
        this.sTelefone_celular_cliente = sTelefone_celular_cliente;
    }
    
    public String getData_nascimento_cliente(){
        return sData_nascimento_cliente;
    }
    
    public void setData_nascimento_cliente(String sData_nascimento_cliente){
        this.sData_nascimento_cliente = sData_nascimento_cliente;
    }
    
    public String getSenha_cliente() {
        return sSenha_cliente;
    }

    public void setSenha_cliente(String sSenha_cliente) {
        this.sSenha_cliente = sSenha_cliente;
    }

}
