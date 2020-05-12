package Vacina;

public class Vacina {
    //private int iId_vacina;
    private String  sNome_vacina;
    private float   fValor_vacina;
    private int     iQuantidade_estoque_vacina;
    private String  sDescricao_vacina;

    public Vacina() {
    }

    public String getsNome_vacina() {
        return sNome_vacina;
    }

    public void setsNome_vacina(String sNome_vacina) {
        this.sNome_vacina = sNome_vacina;
    }

    public float getfValor_vacina() {
        return fValor_vacina;
    }

    public void setfValor_vacina(float fValor_vacina) {
        this.fValor_vacina = fValor_vacina;
    }

    public int getiQuantidade_estoque_vacina() {
        return iQuantidade_estoque_vacina;
    }

    public void setiQuantidade_Estoque_Vacina(int iQuantidade_estoque_vacina) {
        this.iQuantidade_estoque_vacina = iQuantidade_estoque_vacina;
    }

    public String getsDescricao_vacina() {
        return sDescricao_vacina;
    }

    public void setsDescricao_Vacina(String sDescricao_vacina) {
        this.sDescricao_vacina = sDescricao_vacina;
    }
    
    /*public String incluir() {
        try {
            // Carregar Driver do MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Fazer a conexão verifique se o usuário root e a senha são iguais na máquina de teste caso contrário, altere na linha abaixo.
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce?useTimezone=true&serverTimezone=UTC&useSSL=false", "root", "123");
            Statement stmt = con.createStatement();//Criar o fluxo para mandar comando sql o banco

            String sql = 
                    "INSERT INTO TB_Vacina("
                        + "Nome_Vacina, "
                        + "Valor_Vacina, "
                        + "Quantidade_Estoque_Vacina, "
                        + "Descricao_Vacina) "
                    + "VALUES("
                        + getsNome_vacina() + "','"
                        + getfValor_vacina() + "','" 
                        + getiQuantidade_estoque_vacina() + "','" 
                        + getsDescricao_vacina() + "')";
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
                        + "TB_Vacina "
                    + "SET "
                        + "Nome_Vacina='" + getsNome_vacina() + "',"
                        + "Valor_Vacina='" + getfValor_vacina() + "',"
                        + "Quantidade_Estoque_Vacina='" + getiQuantidade_estoque_vacina() + "',"
                        + "Descricao_Vacina='" + getsDescricao_vacina() + "' "
                    + "WHERE "
                        + "ID_Vacina = " + id;
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
            String sql = "DELETE FROM TB_Vacina WHERE ID_Vacina = " + id;
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
    }*/
}
