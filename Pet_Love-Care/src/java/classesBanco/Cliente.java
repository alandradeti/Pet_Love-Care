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
    private String  sSenha_cliente;

    public Cliente() {
    }

    public String getsNome_cliente() {
        return sNome_cliente;
    }

    public void setsNome_cliente(String sNome_cliente) {
        this.sNome_cliente = sNome_cliente;
    }

    public String getsCpf_cliente() {
        return sCpf_cliente;
    }

    public void setsCpf_cliente(String sCpf_cliente) {
        this.sCpf_cliente = sCpf_cliente;
    }

    public String getsRg_cliente() {
        return sRg_cliente;
    }

    public void setsRg_cliente(String sRg_cliente) {
        this.sRg_cliente = sRg_cliente;
    }

    public char getcSexo_cliente() {
        return cSexo_cliente;
    }

    public void setcSexo_cliente(char cSexo_cliente) {
        this.cSexo_cliente = cSexo_cliente;
    }

    public String getsEndereco_cliente() {
        return sEndereco_cliente;
    }

    public void setsEndereco_cliente(String sEndereco_cliente) {
        this.sEndereco_cliente = sEndereco_cliente;
    }

    public String getsEmail_cliente() {
        return sEmail_cliente;
    }

    public void setsEmail_cliente(String sEmail_cliente) {
        this.sEmail_cliente = sEmail_cliente;
    }

    public String getsTelefone_fixo_cliente() {
        return sTelefone_fixo_cliente;
    }

    public void setsTelefone_fixo_cliente(String sTelefone_fixo_cliente) {
        this.sTelefone_fixo_cliente = sTelefone_fixo_cliente;
    }

    public String getsTelefone_celular_cliente() {
        return sTelefone_celular_cliente;
    }

    public void setsTelefone_celular_cliente(String sTelefone_celular_cliente) {
        this.sTelefone_celular_cliente = sTelefone_celular_cliente;
    }

    public String getsSenha_cliente() {
        return sSenha_cliente;
    }

    public void setsSenha_cliente(String sSenha_cliente) {
        this.sSenha_cliente = sSenha_cliente;
    }
    
    public String incluir() {
        try {
            // Carregar Driver do MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Fazer a conexão verifique se o usuário root e a senha são iguais na máquina de teste caso contrário, altere na linha abaixo.
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce?useTimezone=true&serverTimezone=UTC&useSSL=false", "root", "123");
            Statement stmt = con.createStatement();//Criar o fluxo para mandar comando sql o banco

            String sql = 
                    "INSERT INTO TB_Cliente("
                        + "Nome_Cliente, "
                        + "CPF_Cliente, "
                        + "RG_Cliente, "
                        + "Sexo_Cliente, "
                        + "Endereco_Cliente, "
                        + "Email_Cliente, "
                        + "Telefone_Fixo_Cliente, "
                        + "Telefone_Celular_Cliente, "
                        + "Senha_Cliente) "
                    + "VALUES("
                        + getsNome_cliente() + "','"
                        + getsCpf_cliente() + "','" 
                        + getsRg_cliente() + "','" 
                        + getcSexo_cliente() + "','"
                        + getsEndereco_cliente() + "','" 
                        + getsEmail_cliente() + "','" 
                        + getsTelefone_fixo_cliente() + "','" 
                        + getsTelefone_celular_cliente() + "','" 
                        + getsSenha_cliente() + "')";
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
                        + "TB_Cliente "
                    + "SET "
                        + "Nome_Cliente='" + getsNome_cliente() + "',"
                        + "CPF_Cliente='" + getsCpf_cliente() + "',"
                        + "RG_Cliente='" + getsRg_cliente() + "',"
                        + "Sexo_Cliente='" + getcSexo_cliente() + "',"
                        + "Endereco_Cliente='" + getsEndereco_cliente() + "',"
                        + "Email_Cliente='" + getsEmail_cliente() + "',"
                        + "Telefone_Fixo_Cliente='" + getsTelefone_fixo_cliente() + "'," 
                        + "Telefone_Celular_Cliente='" + getsTelefone_fixo_cliente() + "',"
                        + "Senha_Cliente='" + getsSenha_cliente() + "' "
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
            String sql = "DELETE FROM TB_Cliente WHERE ID_Cliente = " + id;
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
