package Agendamento;

import Banco.DataSource;
import java.sql.*;

public class AgendamentoDAO extends Agendamento {
    
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
                    "INSERT INTO TB_Agendamento("
                        + "Tipo_Agendamento,"
                        + "Data_inicial_Agendamento,"
                        + "Data_final_Agendamento,"
                        + "Horario_Agendamento,"
                        + "Vacina_Id_Vacina,"
                        + "Pet_Id_Pet,"
                        + "Cliente_Id_Cliente,"
                        + "Veterinario_Id_Veterinario"
                    + ")VALUES("
                        + "'" + getTipo_agendamento() + "',"
                        + "'" + getData_inicial_agendamento() + "',"
                        + "'" + getData_final_agendamento() + "',"
                        + "'" + getHorario_agendamento() + "',"
                        + "'" + getId_vacina() + "',"
                        + "'" + getId_pet() + "',"
                        + "'" + getId_cliente() + "',"
                        + "'" + getId_veterinario() + "')";
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
    public boolean Alterar(int iId_Agendamento) {
        try {
            String sSql = 
                    "UPDATE "
                        + "TB_Agendamento"
                    + " SET "
                        + "Tipo_Agendamento = '" + getTipo_agendamento() + "',"
                        + "Horario_Agendamento = '" + getHorario_agendamento() + "',"
                        + "Vacina_Id_Vacina = '" + getId_vacina() + "',"
                        + "Pet_Id_Pet = '" + getId_pet() + "',"
                        + "Cliente_Id_Cliente = '" + getId_cliente() + "',"
                        + "Veterinario_Id_Veterinario = '" + getId_veterinario() + "',"
                        + "Data_Final_Agendamento = '" + getData_final_agendamento() + "',"
                        + "Data_Inicial_Agendamento = '" + getData_inicial_agendamento() + "'"
                    + " WHERE "
                        + "Id_Agendamento = " + iId_Agendamento;
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
    public boolean Excluir(int iId_Agendamento){
    	 try {
            String sSql = "DELETE FROM "
                            + "TB_Agendamento "
                        + "WHERE "
                            + "Id_Agendamento = " + iId_Agendamento;
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
