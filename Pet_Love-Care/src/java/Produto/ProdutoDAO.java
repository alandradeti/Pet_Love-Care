package Produto;

import Banco.DataSource;
import java.sql.*;


public class ProdutoDAO extends Produto{
    //Instanciando a classe de conexão
    DataSource dataSource = new DataSource();

    /**
     * Método: Consultar()
     * @param:
     * @purpose: Realizar a consulta no banco. 
     * @return: Retorna um ResultSet com os clientes.
     */
    public ResultSet Consultar(String sSql){
        ResultSet resultado;
        try {
            PreparedStatement ps = dataSource.getConnection().prepareStatement(sSql); // Realiza a conexão e o preparo da query
            resultado = ps.executeQuery(sSql); // Executa a query
            return resultado;
            
        }catch (Exception ex) {
            return null;
        }  	
    }
    
    /**
     * Método: Incluir()
     * @param:
     * @purpose: Realizar a inclusão de um novo cliente. 
     * @return: boolean.
     */
    public boolean Incluir() {
        try {
            String sSql
                    = "INSERT INTO TB_Produto("
                        + "Nome_Produto,"
                        + "Valor_Produto,"
                        + "Quantidade_Estoque_Produto,"
                        + "Descricao_Produto,"
                        + "Numero_Imagem_Produto"
                    + ")VALUES("
                        + "'" + getNome_produto() + "',"
                        + "'" + getValor_produto() + "',"
                        + "'" + getQuantidade_estoque_produto() + "',"
                        + "'" + getDescricao_produto() + "',"
                        + "'" + getNumero_imagem_produto() 
                    + "')";
            PreparedStatement ps = dataSource.getConnection().prepareStatement(sSql); // Realiza a conexão e o preparo da query
            ps.executeUpdate(sSql); // Executa a query

            //Fechando a conexão
            dataSource.closeDataSource();
            ps.close();

        } catch (SQLException ex) {
            return (false);
        } catch (Exception ex) {
            return (false);
        }
        return (true);
    }

    /**
     * Método: Alterar()
     * @param: iIdCliente
     * @purpose: Realizar a alteração de um cliente existente. 
     * @return: boolean.
     */
   /* public boolean Alterar(int iId_Vacina) {
        try {
            String sSql = 
                        "UPDATE "
                            + "TB_Vacina "
                        + " SET "
                            + "Nome_Vacina='"+ getNome_vacina()+"',"
                            + "Valor_Vacina='"+ getValor_vacina()+"',"
                            + "Descricao_Vacina='"+ getDescricao_vacina()+"'"
                        + " WHERE"
                            + " Id_Vacina = " + iId_Vacina;
            PreparedStatement ps = dataSource.getConnection().prepareStatement(sSql); // Realiza a conexão e o preparo da query
            ps.executeUpdate(sSql); // Executa a query

            //Fechando a conexão
            dataSource.closeDataSource();
            ps.close();

        } catch (SQLException ex) {
            return (false);
        } catch (Exception ex) {
            return (false);
        }
        return (true);
    }*/
    
    /**
     * Método: Excluir()
     * @param: iIdCliente
     * @purpose: Realizar a exclusão de um cliente existente. 
     * @return: boolean.
     */
    /*public boolean Excluir(int iId_Vacina){
    	 try {
            String sSql = "DELETE FROM "
                            + "TB_Vacina "
                        + "WHERE "
                            + "Id_Vacina = " + iId_Vacina;
            PreparedStatement ps = dataSource.getConnection().prepareStatement(sSql); // Realiza a conexão e o preparo da query
            ps.executeUpdate(sSql); // Executa a query
            
            //Fechando a conexão
            dataSource.closeDataSource();
            ps.close();
            
        } catch (SQLException ex) {
            return (false);
        } catch (Exception ex) {
            return (false);
        }
        return(true);
    }*/
}
