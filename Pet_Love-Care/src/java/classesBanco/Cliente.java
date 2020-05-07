package classesBanco;

import java.io.Serializable;
import java.sql.*;

public class Cliente {
//    private int id_cliente;
    private String nome_cliente;
    private String endereco_cliente;
    private String email_cliente;
    private char sexo_cliente;
    private String cpf_cliente;
    private String rg_cliente;
    private String data_cadastro_cliente;
    private String telefone_fixo_cliente;
    private String telefone_celular_cliente;

    public Cliente() {
    }

    public String getNome_cliente() {
        return nome_cliente;
    }

    public void setNome_cliente(String nome_cliente) {
        this.nome_cliente = nome_cliente;
    }

    public String getEndereco_cliente() {
        return endereco_cliente;
    }

    public void setEndereco_cliente(String endereco_cliente) {
        this.endereco_cliente = endereco_cliente;
    }

    public String getEmail_cliente() {
        return email_cliente;
    }

    public void setEmail_cliente(String email_cliente) {
        this.email_cliente = email_cliente;
    }

    public char getSexo_cliente() {
        return sexo_cliente;
    }

    public void setSexo_cliente(char sexo_cliente) {
        this.sexo_cliente = sexo_cliente;
    }

    public String getCpf_cliente() {
        return cpf_cliente;
    }

    public void setCpf_cliente(String cpf_cliente) {
        this.cpf_cliente = cpf_cliente;
    }

    public String getRg_cliente() {
        return rg_cliente;
    }

    public void setRg_cliente(String rg_cliente) {
        this.rg_cliente = rg_cliente;
    }

    public String getData_cadastro_cliente() {
        return data_cadastro_cliente;
    }

    public void setData_cadastro_cliente(String data_cadastro_cliente) {
        this.data_cadastro_cliente = data_cadastro_cliente;
    }

    public String getTelefone_fixo_cliente() {
        return telefone_fixo_cliente;
    }

    public void setTelefone_fixo_cliente(String telefone_fixo_cliente) {
        this.telefone_fixo_cliente = telefone_fixo_cliente;
    }

    public String getTelefone_celular_cliente() {
        return telefone_celular_cliente;
    }

    public void setTelefone_celular_cliente(String telefone_celular_cliente) {
        this.telefone_celular_cliente = telefone_celular_cliente;
    }
    
    public String incluir(){
        try {
            // Carregar Driver do MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Fazer a conexão verifique se o usuário root e a senha são iguais na máquina de teste caso contrário, altere na linha abaixo.
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce?useTimezone=true&serverTimezone=UTC&useSSL=false", "root", "123");
            Statement stmt = con.createStatement();//Criar o fluxo para mandar comando sql o banco
 			
            String sql = "INSERT INTO TB_Clientes(Nome_Cliente, Endereco_Cliente, Email_Cliente, Sexo_Cliente, CPF_Cliente, RG_Cliente, Data_Cadastro_Cliente, Telefone_Fixo_Cliente,"
                    + " Telefone_Celular_Cliente) VALUES('"+ getNome_cliente()+"','"+ getEndereco_cliente()+"','"+ getEmail_cliente()+"','"+ getSexo_cliente()+"','"
                    + getCpf_cliente()+"','"+ getRg_cliente()+"','"+ getData_cadastro_cliente()+"','"+ getTelefone_fixo_cliente()+"','"+ getTelefone_celular_cliente()+"')";
            stmt.executeUpdate(sql);// Executa o comando SQL
	    con.close();//Fecha a conexão
            stmt.close();//Fecha o fluxo 
        } 
        catch (ClassNotFoundException e) { return "Erro:" + e.getMessage();  }
        catch (SQLException e) { return "Erro:" + e.getMessage();}
        return "ok";
    }
    
    public boolean alterar(int id) {
        try {
            // Carregar Driver do MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Fazer a conexão verifique se o usuário root e a senha são iguais na máquina de teste caso contrário, altere na linha abaixo.
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce?useTimezone=true&serverTimezone=UTC&useSSL=false", "root", "123");
            Statement stmt = con.createStatement();//Criar o fluxo para mandar comando sql o banco
            String sql = "UPDATE TB_Clientes SET Nome_Cliente='"+ getNome_cliente()+"',"+
                    "Endereco_Cliente='"+ getEndereco_cliente()+"',Email_Cliente='"+ getEmail_cliente()+"',"+
                    "Sexo_Cliente='"+ getSexo_cliente()+"', CPF_Cliente='"+ getCpf_cliente()+"',"+
                    "RG_Cliente='"+ getRg_cliente()+"', Data_Cadastro_Cliente='"+ getData_cadastro_cliente()+"',"+
                    "Telefone_Fixo_Cliente='"+ getTelefone_fixo_cliente()+"',"+ "Telefone_Celular_Cliente='" + getTelefone_celular_cliente()+"' WHERE id = "+id;
             stmt.executeUpdate(sql);// Executa o comando SQL
             con.close();//Fecha a conexão
             stmt.close();//Fecha o fluxo
        } 
        catch (ClassNotFoundException e) { return(false);  }
        catch (SQLException e) { return(false);}
        return(true);
    }
    
    public boolean excluir(int id) {
        try {
            // Carregar Driver do MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Fazer a conexão verifique se o usuário root e a senha 123 são iguais na máquina de teste caso contrário, altere na linha abaixo.
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce?useTimezone=true&serverTimezone=UTC&useSSL=false", "root", "123");
            Statement stmt = con.createStatement();//Criar o fluxo para mandar comando sql o banco
            String sql = "DELETE FROM TB_Clientes WHERE id = "+id;
            stmt.executeUpdate(sql);// Executa o comando SQL
            con.close();//Fecha a conexão
            stmt.close();//Fecha o fluxo 
        } 
        catch (ClassNotFoundException e) { return(false);  }
        catch (SQLException e) { return(false);}
        return(true);
    }
    
    public ResultSet consultar(String sql){
        ResultSet resultado;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");// Carregar Driver do MySQL
            //Fazer a conexão verifique se o usuário root e a senha 123 são iguais na máquina de teste caso contrário, altere na linha abaixo.
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce?useTimezone=true&serverTimezone=UTC&useSSL=false", "root", "123");
            Statement stmt = con.createStatement();//Criar o fluxo para mandar comando sql o banco		
            resultado = stmt.executeQuery(sql);// Executa o comando SQL
            return resultado;			
        } 
        catch (Exception ex) { return null;}  	
    }
}
