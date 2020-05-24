package CarteiraVacinacao;

import Banco.DataSource;
import java.sql.*;

public class CarteiraVacinacaoDAO extends CarteiraVacinacao {
    
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
            String sSql =   
                    "INSERT INTO TB_Carteira_Vacinacao("
                        + "Pet_Id_Pet,"
                        + "Vacina_Id_Vacina,"
                        + "Data_Pet_Vacina"
                    + ")VALUES("
                        + "'" + getId_pet() + "',"
                        + "'" + getId_vacina() + "',"
                        + "'" + getData_pet_vacina()  
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
    public boolean Alterar(int iId_Carteira_Vacinacao) {
        try {
            String sSql = 
                    "UPDATE "
                        + "TB_Carteira_Vacinacao"
                    + " SET "
                        + "Pet_Id_Pet = '" + getId_pet() + "',"
                        + "Vacina_Id_Vacina = '" + getId_vacina() + "',"
                        + "Data_Pet_Vacina = '" + getData_pet_vacina() + "'" 
                    + " WHERE "
                        + "Id_Carteira_Vacinacao = " + iId_Carteira_Vacinacao;
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
     * Método: Excluir()
     * @param: iIdCliente
     * @purpose: Realizar a exclusão de um cliente existente. 
     * @return: boolean.
     */
    public boolean Excluir(int iId_Carteira_Vacinacao){
    	 try {
            String sSql = "DELETE FROM "
                            + "TB_Carteira_Vacinacao "
                        + "WHERE "
                            + "Id_Carteira_Vacinacao = " + iId_Carteira_Vacinacao;
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
    }
}
