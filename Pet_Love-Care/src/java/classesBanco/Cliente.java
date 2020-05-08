package classesBanco;

import java.io.Serializable;
import java.sql.*;

public class Cliente {
    //private int iId_cliente;
    private String  sNome_cliente;
    private String  sCpf_cliente;
    private String  sRg_cliente;
    private char    cSexo_cliente;
    private String  sEndereco_cliente;
    private String  sEmail_cliente;
    private String  sTelefone_fixo_cliente;
    private String  sTelefone_celular_cliente;

    public Cliente() {
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

    public String incluir() {
        try {
            // Carregar Driver do MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Fazer a conexão verifique se o usuário root e a senha são iguais na máquina de teste caso contrário, altere na linha abaixo.
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce?useTimezone=true&serverTimezone=UTC&useSSL=false", "root", "123");
            Statement stmt = con.createStatement();//Criar o fluxo para mandar comando sql o banco

            String sql = 
                    "INSERT INTO TB_Clientes("
                        + "Nome_Cliente, "
                        + "CPF_Cliente, "
                        + "RG_Cliente, "
                        + "Sexo_Cliente, "
                        + "Endereco_Cliente, "
                        + "Email_Cliente, "
                        + "Telefone_Fixo_Cliente,"
                        + " Telefone_Celular_Cliente) "
                    + "VALUES("
                        + getNome_cliente() + "','"
                        + getCpf_cliente() + "','" 
                        + getRg_cliente() + "','" 
                        + getSexo_cliente() + "','"
                        + getEndereco_cliente() + "','" 
                        + getEmail_cliente() + "','" 
                        + getTelefone_fixo_cliente() + "','" 
                        + getTelefone_celular_cliente() + "')";
            stmt.executeUpdate(sql);// Executa o comando SQL
            con.close();//Fecha a conexão
            stmt.close();//Fecha o fluxo 
        } catch (ClassNotFoundException e) {
            return "Erro:" + e.getMessage();
        } catch (SQLException e) {
            return "Erro:" + e.getMessage();
        }
        return "ok";
    }

    public boolean alterar(int id) {
        try {
            // Carregar Driver do MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Fazer a conexão verifique se o usuário root e a senha são iguais na máquina de teste caso contrário, altere na linha abaixo.
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce?useTimezone=true&serverTimezone=UTC&useSSL=false", "root", "123");
            Statement stmt = con.createStatement();//Criar o fluxo para mandar comando sql o banco
            String sql = 
                    "UPDATE "
                        + "TB_Clientes "
                    + "SET "
                        + "Nome_Cliente='" + getNome_cliente() + "',"
                        + "CPF_Cliente='" + getCpf_cliente() + "',"
                        + "RG_Cliente='" + getRg_cliente() + "',"
                        + "Sexo_Cliente='" + getSexo_cliente() + "',"
                        + "Endereco_Cliente='" + getEndereco_cliente() + "',"
                        + "Email_Cliente='" + getEmail_cliente() + "',"
                        + "Telefone_Fixo_Cliente='" + getTelefone_fixo_cliente() + "'," 
                        + "Telefone_Celular_Cliente='" + getTelefone_celular_cliente() + "' "
                    + "WHERE "
                        + "ID_Cliente = " + id;
            stmt.executeUpdate(sql);// Executa o comando SQL
            con.close();//Fecha a conexão
            stmt.close();//Fecha o fluxo
        } catch (ClassNotFoundException e) {
            return (false);
        } catch (SQLException e) {
            return (false);
        }
        return (true);
    }

    public boolean excluir(int id) {
        try {
            // Carregar Driver do MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Fazer a conexão verifique se o usuário root e a senha 123 são iguais na máquina de teste caso contrário, altere na linha abaixo.
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce?useTimezone=true&serverTimezone=UTC&useSSL=false", "root", "123");
            Statement stmt = con.createStatement();//Criar o fluxo para mandar comando sql o banco
            String sql = "DELETE FROM TB_Clientes WHERE ID_Cliente = " + id;
            stmt.executeUpdate(sql);// Executa o comando SQL
            con.close();//Fecha a conexão
            stmt.close();//Fecha o fluxo 
        } catch (ClassNotFoundException e) {
            return (false);
        } catch (SQLException e) {
            return (false);
        }
        return (true);
    }

    public ResultSet consultar(String sql) {
        ResultSet resultado;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");// Carregar Driver do MySQL
            //Fazer a conexão verifique se o usuário root e a senha 123 são iguais na máquina de teste caso contrário, altere na linha abaixo.
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce?useTimezone=true&serverTimezone=UTC&useSSL=false", "root", "123");
            Statement stmt = con.createStatement();//Criar o fluxo para mandar comando sql o banco		
            resultado = stmt.executeQuery(sql);// Executa o comando SQL
            return resultado;
        } catch (Exception ex) {
            return null;
        }
    }
}
