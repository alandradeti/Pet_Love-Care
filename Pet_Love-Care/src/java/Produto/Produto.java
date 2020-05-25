package Produto;

public class Produto {
    //private int iId_produto;
    private String sNome_produto;
    private float fValor_produto;
    private String sDescricao_produto;
    private int iNumero_imagem_produto;

    public Produto() {
    }

    public String getNome_produto() {
        return sNome_produto;
    }

    public void setNome_produto(String sNome_produto) {
        this.sNome_produto = sNome_produto;
    }

    public float getValor_produto() {
        return fValor_produto;
    }

    public void setValor_produto(float fValor_produto) {
        this.fValor_produto = fValor_produto;
    }

    public int getNumero_imagem_produto() {
        return iNumero_imagem_produto;
    }

    public void setNumero_imagem_produto(int iNumero_imagem_produto) {
        this.iNumero_imagem_produto = iNumero_imagem_produto;
    }
    
    public String getDescricao_produto() {
        return sDescricao_produto;
    }

    public void setDescricao_produto(String sDescricao_produto) {
        this.sDescricao_produto = sDescricao_produto;
    }


    
    /*public String incluir() {
        try {
            // Carregar Driver do MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Fazer a conexão verifique se o usuário root e a senha são iguais na máquina de teste caso contrário, altere na linha abaixo.
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce?useTimezone=true&serverTimezone=UTC&useSSL=false", "root", "123");
            Statement stmt = con.createStatement();//Criar o fluxo para mandar comando sql o banco

            String sql = 
                    "INSERT INTO TB_Produto("
                        + "Nome_Produto, "
                        + "Valor_Produto, "
                        + "Quantidade_Produto, "
                        + "Quantidade_Estoque_Produto) "
                    + "VALUES("
                        + getsNome_produto() + "','"
                        + getfValor_produto() + "','" 
                        + getiQuantidade_produto() + "','" 
                        + getiQuantidade_estoque_produto() + "')";
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
                        + "TB_Produto "
                    + "SET "
                        + "Nome_Produto='" + getsNome_produto() + "',"
                        + "Valor_Produto='" + getfValor_produto() + "',"
                        + "Quantidade_Produto='" + getiQuantidade_produto() + "',"
                        + "Quantidade_Estoque_Produto='" + getiQuantidade_estoque_produto() + "' "
                    + "WHERE "
                        + "ID_Produto = " + id;
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
            String sql = "DELETE FROM TB_Produto WHERE ID_Produto = " + id;
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
