package classesBanco;

import java.sql.*;
import java.util.ArrayList;

public class ClienteDAO extends Cliente{
    //Instanciando conexão
    DataSource dataSource = new DataSource();
    
    /*public ArrayList<Cliente> Consultar(){
        try{
            String sSql = "SELECT * FROM TB_Cliente";
            PreparedStatement ps = dataSource.getConnection().prepareStatement(sSql);
            ResultSet rs = ps.executeQuery();
            
            ArrayList<Cliente> arListaCliente = new ArrayList<Cliente>();
            
            while(rs.next()){
                Cliente cliente = new Cliente();
                
                cliente.setId_cliente(rs.getInt("Id_Cliente"));
                cliente.setNome_cliente(rs.getString("Nome_Cliente"));
                cliente.setCpf_cliente(rs.getString("CPF_Cliente"));
                cliente.setRg_cliente(rs.getString("RG_Cliente"));
                cliente.setSexo_cliente(rs.getString("Sexo_Cliente").charAt(0));
                cliente.setEndereco_cliente(rs.getString("RG_Cliente"));
                cliente.setEmail_cliente(rs.getString("RG_Cliente"));
                cliente.setTelefone_fixo_cliente(rs.getString("RG_Cliente"));
                cliente.setTelefone_celular_cliente(rs.getString("RG_Cliente"));
                
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
    }*/
    
    public Boolean Incluir() {
        try {
            String sSql = 
                    "INSERT INTO TB_Cliente("
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
 
        }catch(SQLException ex){
            System.err.println("Erro ao realizar inserção " + ex.getMessage());
        }catch(Exception ex){
            System.err.println("Erro geral " + ex.getMessage());
        }
        return true;
    }
}
