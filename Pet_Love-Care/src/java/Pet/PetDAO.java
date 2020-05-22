package Pet;

import Banco.DataSource;
import java.sql.*;



public class PetDAO extends Pet{
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
                        "INSERT INTO TB_Pet("
                            + "Especie_Pet, "
                            + "Nome_Pet, "
                            + "Raca_Pet, "
                            + "Idade_Pet, "
                            + "Porte_Pet, "
                            + "Peso_Pet, "
                            + "Altura_Pet, "
                            + "Sexo_Pet, "
                            + "Castracao_Pet, "
                            + "Cor_Pelagem_Pet,"
                            + "Cliente_Id_Cliente"
                        +")VALUES("
                            +"'" + getEspecie_pet() + "',"
                            +"'" + getNome_pet() + "',"
                            +"'" + getRaca_pet() + "',"
                            +"'" + getIdade_pet() + "',"
                            +"'" + getPorte_pet() + "'," 
                            +"'" + getPeso_pet() + "',"
                            +"'" + getAltura_pet() + "'," 
                            +"'" + getSexo_pet() + "'," 
                            +"'" + getCastracao_pet() + "',"
                            +"'" + getCor_pelagem_pet() + "',"
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
     * @param: iIdPet
     * @purpose: Realizar a alteração de um pet existente. 
     * @return: boolean.
     */
    public boolean Alterar(int iId_Pet) {
        try {
            String sSql =   "UPDATE "
                                + "TB_Pet"
                            + " SET "
                                + "Especie_Pet = '" + getEspecie_pet() + "',"
                                + "Nome_Pet = '" + getNome_pet() + "',"
                                + "Raca_Pet = '" + getRaca_pet() + "',"
                                + "Idade_Pet = '" + getIdade_pet() + "',"
                                + "Porte_Pet = '" + getPorte_pet() + "',"
                                + "Peso_Pet = '" + getPeso_pet() + "',"
                                + "Altura_Pet = '" + getAltura_pet() + "',"
                                + "Sexo_Pet = '" + getSexo_pet() + "',"
                                + "Castracao_Pet = '" + getCastracao_pet() + "',"
                                + "Cor_Pelagem_Pet = '" + getCor_pelagem_pet() + "',"
                                + "Cliente_Id_Cliente = '" + getId_cliente() + "'"
                            + " WHERE "
                                + "Id_Pet = " + iId_Pet;
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
     * @param: iIdPet
     * @purpose: Realizar a exclusão de um pet existente. 
     * @return: boolean.
     */
    public boolean Excluir(int iId_Pet){
    	 try {
            String sSql = "DELETE FROM "
                            + "TB_Pet "
                        + "WHERE "
                            + "Id_Pet = " + iId_Pet;
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
