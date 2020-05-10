package classesBanco;

import java.io.Serializable;
import java.sql.*;

public class Pet {
    //private int iId_pet;
    private String sEspecie_pet;
    private String sNome_pet;
    private String sRaca_pet;
    private int iIdade_pet;
    private String sPorte_pet;
    private float fPeso_pet;
    private float fAltura_pet;
    private char cSexo_pet;
    private boolean bCastracao_pet;
    private String sCor_pelagem_pet;

    public Pet() {
    }

    public String getsEspecie_pet() {
        return sEspecie_pet;
    }

    public void setsEspecie_pet(String sEspecie_pet) {
        this.sEspecie_pet = sEspecie_pet;
    }

    public String getsNome_pet() {
        return sNome_pet;
    }

    public void setsNome_pet(String sNome_pet) {
        this.sNome_pet = sNome_pet;
    }

    public String getsRaca_pet() {
        return sRaca_pet;
    }

    public void setsRaca_pet(String sRaca_pet) {
        this.sRaca_pet = sRaca_pet;
    }

    public int getiIdade_pet() {
        return iIdade_pet;
    }

    public void setiIdade_pet(int iIdade_pet) {
        this.iIdade_pet = iIdade_pet;
    }

    public String getsPorte_pet() {
        return sPorte_pet;
    }

    public void setsPorte_pet(String sPorte_pet) {
        this.sPorte_pet = sPorte_pet;
    }

    public float getfPeso_pet() {
        return fPeso_pet;
    }

    public void setfPeso_pet(float fPeso_pet) {
        this.fPeso_pet = fPeso_pet;
    }

    public float getfAltura_pet() {
        return fAltura_pet;
    }

    public void setfAltura_pet(float fAltura_pet) {
        this.fAltura_pet = fAltura_pet;
    }

    public char getcSexo_pet() {
        return cSexo_pet;
    }

    public void setcSexo_pet(char cSexo_pet) {
        this.cSexo_pet = cSexo_pet;
    }

    public boolean isbCastracao_pet() {
        return bCastracao_pet;
    }

    public void setbCastracao_pet(boolean bCastracao_pet) {
        this.bCastracao_pet = bCastracao_pet;
    }

    public String getsCor_pelagem_pet() {
        return sCor_pelagem_pet;
    }

    public void setsCor_pelagem_pet(String sCor_pelagem_pet) {
        this.sCor_pelagem_pet = sCor_pelagem_pet;
    }
    
    public String incluir() {
        try {
            // Carregar Driver do MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Fazer a conexão verifique se o usuário root e a senha são iguais na máquina de teste caso contrário, altere na linha abaixo.
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce?useTimezone=true&serverTimezone=UTC&useSSL=false", "root", "123");
            Statement stmt = con.createStatement();//Criar o fluxo para mandar comando sql o banco

            String sql = 
                    "INSERT INTO TB_Pet("
                        + "Especie_Pet, "
                        + "Nome_Pet, "
                        + "Raca_Pet, "
                        + "Idade_Pet, "
                        + "Porte_Pet, "
                        + "Peso_Pet, "
                        + "Altura_Pet, "
                        + "Sexo_Pet, "
                        + "Castracao_Pet, "
                        + "Cor_Pelagem_Pet) "
                    + "VALUES("
                        + getsEspecie_pet() + "','"
                        + getsNome_pet() + "','" 
                        + getsRaca_pet() + "','" 
                        + getiIdade_pet() + "','"
                        + getsPorte_pet() + "','" 
                        + getfPeso_pet() + "','" 
                        + getfAltura_pet() + "','" 
                        + getcSexo_pet() + "','" 
                        + isbCastracao_pet() + "','" 
                        + getsCor_pelagem_pet() + "')";
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
                        + "TB_Pet "
                    + "SET "
                        + "Especie_Pet='" + getsEspecie_pet() + "',"
                        + "Nome_Pet='" + getsNome_pet() + "',"
                        + "Raca_Pet='" + getsRaca_pet() + "',"
                        + "Idade_Pet='" + getiIdade_pet() + "',"
                        + "Porte_Pet='" + getsPorte_pet() + "',"
                        + "Peso_Pet='" + getfPeso_pet() + "',"
                        + "Altura_Pet='" + getfAltura_pet() + "'," 
                        + "Sexo_Pet='" + getcSexo_pet() + "'," 
                        + "Castracao_Pet='" + isbCastracao_pet() + "'," 
                        + "Cor_Pelagem_Pet='" + getsCor_pelagem_pet() + "' "
                    + "WHERE "
                        + "ID_Pet = " + id;
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
            String sql = "DELETE FROM TB_Pet WHERE ID_Pet = " + id;
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
