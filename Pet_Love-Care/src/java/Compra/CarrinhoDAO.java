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
    
    /**
     * Método: Alterar()
     * @param: iIdCliente
     * @purpose: Realizar a alteração de um cliente existente. 
     * @return: boolean.
     */
    /*public boolean Alterar(int iId_Cliente) {
        try {
            String sSql = "UPDATE "
                    + "TB_Cliente "
                    + "SET "
                    + "Nome_Cliente = '" + getNome_cliente() + "',"
                    + "CPF_Cliente = '" + getCpf_cliente() + "',"
                    + "RG_Cliente = '" + getRg_cliente() + "',"
                    + "Sexo_Cliente = '" + getSexo_cliente() + "',"
                    + "Endereco_Cliente = '" + getEndereco_cliente() + "',"
                    + "Email_Cliente = '" + getEmail_cliente() + "',"
                    + "Telefone_Fixo_Cliente = '" + getTelefone_fixo_cliente() + "',"
                    + "Telefone_Celular_Cliente = '" + getTelefone_celular_cliente() + "',"
                    + "Data_Nascimento_Cliente = '" + getData_nascimento_cliente() + "',"
                    + "Tipo_Cliente = '" + getTipo_cliente() + "',"
                    + "Codigo_Funcionario = '" + getCodigo_funcionario() + "',"
                    + "Senha_Cliente = '" + getSenha_cliente() + "' "
                    + "WHERE "
                    + "Id_Cliente = " + iId_Cliente;
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
    public boolean Excluir(int iId_Carrinho){
    	 try {
            String sSql = "DELETE FROM "
                            + "TB_Carrinho "
                        + "WHERE "
                            + "Id_Carrinho = " + iId_Carrinho;
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
