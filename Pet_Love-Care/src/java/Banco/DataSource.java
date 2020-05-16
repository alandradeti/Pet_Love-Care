package Banco;

import java.io.Serializable;
import java.sql.*;

public class DataSource implements Serializable {

    //Definição das constantes de acesso ao banco de dados
    private final String sHOSTNAME_DB = "localhost";
    private final String sBASE_DB = "BD_PetLoveCare";
    private final String sUSUARIO_DB = "root";
    private final String sSENHA_DB = "123";
    private final int sPORTA_DB = 3306;
    private final String sDRIVER_DB = "com.mysql.cj.jdbc.Driver";
    private Connection connection; //Variável Connection para uso na conexão
    
    public DataSource(){
        try {
            Class.forName(sDRIVER_DB);//Carregando driver
            //Url de acesso ao servidor
            String sUrl = "jdbc:mysql://" + sHOSTNAME_DB + ":" + sPORTA_DB + "/" + sBASE_DB + "?useTimezone=true&serverTimezone=UTC&useSSL=false";

            //Abrindo conexão
            connection = DriverManager.getConnection(sUrl, sUSUARIO_DB, sSENHA_DB);

            //System.out.println("Teste");
        } catch (SQLException ex) {
            System.err.println("Erro de conexão " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println("Erro driver não encontrado " + ex.getMessage());
        }

    }

    /**
     * Método: getConnection()
     * @param: 
     * @purpose: Realiza o retorno da conexão. 
     * @return: Connection.
     */
    public Connection getConnection() {
        return this.connection;
    }
    
    /**
     * Método: closeDataSource()
     * @param: 
     * @purpose: Realiza o fechamento da conexão. 
     * @return:
     */
    public void closeDataSource(){
        try{
            connection.close();
        }
        catch(Exception ex){
            System.out.println("Erro ao desconectar " + ex.getMessage());
        }
    }
}
