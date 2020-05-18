package Veterinario;

import Banco.DataSource;
import java.sql.*;

public class VeterinarioDAO extends Veterinario {
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
                    = "INSERT INTO TB_Veterinario("
                    + "Nome_Veterinario,"
                    + "CPF_Veterinario,"
                    + "RG_Veterinario,"
                    + "Sexo_Veterinario,"
                    + "Endereco_Veterinario,"
                    + "Email_Veterinario,"
                    + "Telefone_Fixo_Veterinario,"
                    + "Telefone_Celular_Veterinario,"
                    + "Data_Nascimento_Veterinario"
                    + ")VALUES("
                    + "'" + getNome_veterinario() + "',"
                    + "'" + getCpf_veterinario() + "',"
                    + "'" + getRg_veterinario() + "',"
                    + "'" + getSexo_veterinario() + "',"
                    + "'" + getEndereco_veterinario() + "',"
                    + "'" + getEmail_veterinario() + "',"
                    + "'" + getTelefone_fixo_veterinario() + "',"
                    + "'" + getTelefone_celular_veterinario() + "',"
                    + "'" + getData_nascimento_veterinario() + "')";
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
    public boolean Alterar(int iId_veterinario) {
        try {
            String sSql = "UPDATE "
                    + "TB_Veterinario"
                    + "SET "
                    + "Nome_Veterinario = '" + getNome_veterinario() + "',"
                    + "CPF_Veterinario = '" + getCpf_veterinario() + "',"
                    + "RG_Veterinario = '" + getRg_veterinario() + "',"
                    + "Sexo_Veterinario = '" + getSexo_veterinario() + "',"
                    + "Endereco_Veterinario = '" + getEndereco_veterinario() + "',"
                    + "Email_Veterinario = '" + getEmail_veterinario() + "',"
                    + "Telefone_Fixo_Veterinario = '" + getTelefone_fixo_veterinario() + "',"
                    + "Telefone_Celular_Veterinario = '" + getTelefone_celular_veterinario() + "',"
                    + "Data_Nascimento_Veterinario = '" + getData_nascimento_veterinario() + "'"
                    + "WHERE"
                    + "Id_Veterinario = " + iId_veterinario;
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
    public boolean Excluir(int iId_veterinario){
    	 try {
            String sSql = "DELETE FROM "
                            + "TB_Veterinario "
                        + "WHERE "
                            + "Id_Veterinario = " + iId_veterinario;
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

