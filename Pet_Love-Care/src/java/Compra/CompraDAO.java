package Compra;

import Banco.DataSource;
import java.sql.*;

public class CompraDAO extends Compra {
    
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
                        "INSERT INTO TB_Compra("
                            + "Data_Compra, "
                            + "Valor_Compra, "
                            + "Tipo_Pagamento_Compra, "
                            + "Numero_Cartao, "
                            + "Numero_Seguranca_Cartao, "
                            + "Numero_Parcela, "
                            + "Cliente_Id_Cliente"
                        +")VALUES("
                            +"'" + getData_compra() + "',"
                            +"'" + getValor_compra() + "',"
                            +"'" + getTipo_pagamento_compra() + "',"
                            +"'" + getNumero_cartao() + "',"
                            +"'" + getNumero_seguranca_cartao() + "',"
                            +"'" + getNumero_parcela() + "',"
                            +"'" + getId_cliente() + "')"; 

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
    public boolean Excluir(int iId_Compra){
    	 try {
            String sSql = "DELETE FROM "
                            + "TB_Compra "
                        + "WHERE "
                            + "Id_Compra = " + iId_Compra;
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
