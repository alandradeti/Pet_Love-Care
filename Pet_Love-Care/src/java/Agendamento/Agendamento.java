package Agendamento;

public class Agendamento {
    //private int iId_agendamento;
    private String sTipo_agendamento;
    private String sData_agendamento;
    private String sHorario_agendamento;
    
    public Agendamento() {
    }

    public String getTipo_agendamento() {
        return sTipo_agendamento;
    }

    public void setTipo_agendamento(String sTipo_agendamento) {
        this.sTipo_agendamento = sTipo_agendamento;
    }

    public String getData_agendamento() {
        return sData_agendamento;
    }

    public void setData_agendamento(String sData_agendamento) {
        this.sData_agendamento = sData_agendamento;
    }

    public String getHorario_agendamento() {
        return sHorario_agendamento;
    }

    public void setHorario_agendamento(String sHorario_agendamento) {
        this.sHorario_agendamento = sHorario_agendamento;
    }
    
}
