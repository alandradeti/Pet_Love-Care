package Cliente;

import Banco.DataSource;
import ClassesUtilitarias.FormataData;
import java.sql.*;
import java.util.ArrayList;

public class ClienteDAO extends Cliente {

    //Instanciando a classe de conexão
    DataSource dataSource = new DataSource();

    /**
     * Método: Consultar()
     * @param:
     * @purpose: Realizar a consulta no banco. 
     * @return: Lista de clientes existentes.
     */
    public ArrayList<Cliente> Consultar(){
        try{
            String sSql = "SELECT *, date_format(`Data_Nascimento_Cliente`,'%d/%m/%Y') FROM TB_Cliente";
            PreparedStatement ps = dataSource.getConnection().prepareStatement(sSql);
            ResultSet rs = ps.executeQuery();
            
            ArrayList<Cliente> arListaCliente = new ArrayList<Cliente>();
            FormataData formata = new FormataData();
            String data_nascimento;
            
            while(rs.next()){
                Cliente cliente = new Cliente();
                
                cliente.setId_cliente(rs.getInt("Id_Cliente"));
                cliente.setNome_cliente(rs.getString("Nome_Cliente"));
                cliente.setCpf_cliente(rs.getString("CPF_Cliente"));
                cliente.setRg_cliente(rs.getString("RG_Cliente"));
                cliente.setSexo_cliente(rs.getString("Sexo_Cliente").charAt(0));
                cliente.setEndereco_cliente(rs.getString("Endereco_Cliente"));
                cliente.setEmail_cliente(rs.getString("Email_Cliente"));
                cliente.setTelefone_fixo_cliente(rs.getString("Telefone_Fixo_Cliente"));
                cliente.setTelefone_celular_cliente(rs.getString("Telefone_celular_Cliente"));
                data_nascimento = rs.getString("Data_Nascimento_Cliente");
                try { 
                    cliente.setData_nascimento_cliente(formata.formataData(data_nascimento, "diaMesAno")); 
                } catch (Exception e) {
                    e.printStackTrace(); 
                }
                cliente.setSenha_cliente(rs.getString("Senha_Cliente"));
                
                arListaCliente.add(cliente);
            }
            
            ps.close();
            return arListaCliente;
            
        }catch(SQLException ex){
            System.err.println("Erro ao recuperar " + ex.getMessage());
        }catch(Exception ex){
            System.err.println("Erro geral " + ex.getMessage());
        }
        return null;
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
                    = "INSERT INTO TB_Cliente("
                    + "Nome_Cliente,"
                    + "CPF_Cliente,"
                    + "RG_Cliente,"
                    + "Sexo_Cliente,"
                    + "Endereco_Cliente,"
                    + "Email_Cliente,"
                    + "Telefone_Fixo_Cliente,"
                    + "Telefone_Celular_Cliente,"
                    + "Data_Nascimento_Cliente,"
                    + "Senha_Cliente"
                    + ")VALUES("
                    + "'" + getNome_cliente() + "',"
                    + "'" + getCpf_cliente() + "',"
                    + "'" + getRg_cliente() + "',"
                    + "'" + getSexo_cliente() + "',"
                    + "'" + getEndereco_cliente() + "',"
                    + "'" + getEmail_cliente() + "',"
                    + "'" + getTelefone_fixo_cliente() + "',"
                    + "'" + getTelefone_celular_cliente() + "',"
                    + "'" + getData_nascimento_cliente() + "',"
                    + "'" + getSenha_cliente() + "')";
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
    public boolean Alterar(int iId_Cliente) {
        try {
            String sSql = "UPDATE "
                    + "TB_Clientes"
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
                    + "Senha_Cliente = '" + getSenha_cliente() + "'"
                    + "WHERE"
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
    }
    
    /**
     * Método: Excluir()
     * @param: iIdCliente
     * @purpose: Realizar a exclusão de um cliente existente. 
     * @return: boolean.
     */
    public boolean Excluir(int iId_Cliente){
    	 try {
            String sSql = "DELETE FROM "
                            + "TB_Clientes "
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
        return(true);
    }

}
