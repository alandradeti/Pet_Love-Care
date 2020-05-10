package ClassesUtilitarias;

import java.text.SimpleDateFormat;
import java.util.Date;


public class FormataData {
    //Método para formatar data. 
    public String formataData(String data, String formato) {
        SimpleDateFormat formatoEntrada = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat formatoSaidaDtCompleta = new SimpleDateFormat("dd/MM/yyyy 'à(s)' HH:mm:ss");
        SimpleDateFormat formatoSaidaDiaMesAno = new SimpleDateFormat("dd/MM/yyyy");
        Date dataTypeDate = null; 
        String resultado = null;
        try { 
            dataTypeDate = formatoEntrada.parse(data);
            if ("dataCompleta".equals(formato)){
                resultado = formatoSaidaDtCompleta.format(dataTypeDate); 
            } else if ("diaMesAno".equals(formato)){
                resultado = formatoSaidaDiaMesAno.format(dataTypeDate); 
            } 
        } catch (Exception e) {
            e.printStackTrace(); 
        } 
        return resultado; 
    }
}
