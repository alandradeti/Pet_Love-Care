package classesBanco;

import java.io.Serializable;
import java.sql.*;

public class Veterinario {
    //private int iId_veterinario;
    private String  sNome_veterinario;
    private String  sCpf_veterinario;
    private String  sRg_veterinario;
    private char    cSexo_veterinario;
    private String  sEndereco_veterinario;
    private String  sEmail_veterinario;
    private String  sTelefone_fixo_veterinario;
    private String  sTelefone_celular_veterinario;
    private String  sSenha_veterinario;

    public Veterinario() {
    }

    public String getsNome_veterinario() {
        return sNome_veterinario;
    }

    public void setsNome_veterinario(String sNome_veterinario) {
        this.sNome_veterinario = sNome_veterinario;
    }

    public String getsCpf_veterinario() {
        return sCpf_veterinario;
    }

    public void setsCpf_veterinario(String sCpf_veterinario) {
        this.sCpf_veterinario = sCpf_veterinario;
    }

    public String getsRg_veterinario() {
        return sRg_veterinario;
    }

    public void setsRg_veterinario(String sRg_veterinario) {
        this.sRg_veterinario = sRg_veterinario;
    }

    public char getcSexo_veterinario() {
        return cSexo_veterinario;
    }

    public void setcSexo_veterinario(char cSexo_veterinario) {
        this.cSexo_veterinario = cSexo_veterinario;
    }

    public String getsEndereco_veterinario() {
        return sEndereco_veterinario;
    }

    public void setsEndereco_veterinario(String sEndereco_veterinario) {
        this.sEndereco_veterinario = sEndereco_veterinario;
    }

    public String getsEmail_veterinario() {
        return sEmail_veterinario;
    }

    public void setsEmail_veterinario(String sEmail_veterinario) {
        this.sEmail_veterinario = sEmail_veterinario;
    }

    public String getsTelefone_fixo_veterinario() {
        return sTelefone_fixo_veterinario;
    }

    public void setsTelefone_fixo_veterinario(String sTelefone_fixo_veterinario) {
        this.sTelefone_fixo_veterinario = sTelefone_fixo_veterinario;
    }

    public String getsTelefone_celular_veterinario() {
        return sTelefone_celular_veterinario;
    }

    public void setsTelefone_celular_veterinario(String sTelefone_celular_veterinario) {
        this.sTelefone_celular_veterinario = sTelefone_celular_veterinario;
    }

    public String getsSenha_veterinario() {
        return sSenha_veterinario;
    }

    public void setsSenha_veterinario(String sSenha_veterinario) {
        this.sSenha_veterinario = sSenha_veterinario;
    }
    
    public String incluir() {
        try {
            // Carregar Driver do MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Fazer a conexão verifique se o usuário root e a senha são iguais na máquina de teste caso contrário, altere na linha abaixo.
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce?useTimezone=true&serverTimezone=UTC&useSSL=false", "root", "123");
            Statement stmt = con.createStatement();//Criar o fluxo para mandar comando sql o banco

            String sql = 
                    "INSERT INTO TB_Veterinario("
                        + "Nome_Veterinario, "
                        + "CPF_Veterinario, "
                        + "RG_Veterinario, "
                        + "Sexo_Veterinario, "
                        + "Endereco_Veterinario, "
                        + "Email_Veterinario, "
                        + "Telefone_Fixo_Veterinario, "
                        + "Telefone_Celular_Veterinario, "
                        + "Senha_Veterinario) "
                    + "VALUES("
                        + getsNome_veterinario() + "','"
                        + getsCpf_veterinario() + "','" 
                        + getsRg_veterinario() + "','" 
                        + getcSexo_veterinario() + "','"
                        + getsEndereco_veterinario() + "','" 
                        + getsEmail_veterinario() + "','" 
                        + getsTelefone_fixo_veterinario() + "','" 
                        + getsTelefone_celular_veterinario() + "','" 
                        + getsSenha_veterinario() + "')";
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
                        + "TB_Veterinario "
                    + "SET "
                        + "Nome_Veterinario='" + getsNome_veterinario() + "',"
                        + "CPF_Veterinario='" + getsCpf_veterinario() + "',"
                        + "RG_Veterinario='" + getsRg_veterinario() + "',"
                        + "Sexo_Veterinario='" + getcSexo_veterinario() + "',"
                        + "Endereco_Veterinario='" + getsEndereco_veterinario() + "',"
                        + "Email_Veterinario='" + getsEmail_veterinario() + "',"
                        + "Telefone_Fixo_Veterinario='" + getsTelefone_fixo_veterinario() + "'," 
                        + "Telefone_Celular_Veterinario='" + getsTelefone_celular_veterinario() + "'," 
                        + "Senha_Veterinario='" + getsSenha_veterinario() + "' "
                    + "WHERE "
                        + "ID_Veterinario = " + id;
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
            String sql = "DELETE FROM TB_Veterinario WHERE ID_Veterinario = " + id;
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
