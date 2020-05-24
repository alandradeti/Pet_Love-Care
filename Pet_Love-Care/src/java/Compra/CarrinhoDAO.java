package Compra;

import Banco.DataSource;
import java.sql.*;

public class CarrinhoDAO extends Carrinho {
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
                        "INSERT INTO TB_Carrinho("
                            + "Preco_Carrinho, "
                            + "Quantidade_Carrinho, "
                            + "Status_Carrinho, "
                            + "Produto_Id_Produto, "
                            + "Cliente_Id_Cliente"
                        +")VALUES("
                            +"'" + getPreco_carrinho() + "',"
                            +"'" + getQuantidade_carrinho() + "',"
                            +"'" + getStatus_carrinho() + "',"
                            +"'" + getId_produto() + "',"
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
}
