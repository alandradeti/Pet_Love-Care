package Agendamento;

public class Agendamento {
    //private int iId_agendamento;
    private String sTipo_agendamento;
    private String sData_inicial_agendamento;
    private String sData_final_agendamento;
    private String sHorario_agendamento;
    private int iId_vacina;
    private int iId_pet;
    private int iId_cliente;
    private int iId_veterinario;
    
    public Agendamento() {
    }

    public String getTipo_agendamento() {
        return sTipo_agendamento;
    }

    public void setTipo_agendamento(String sTipo_agendamento) {
        this.sTipo_agendamento = sTipo_agendamento;
    }

    public String getHorario_agendamento() {
        return sHorario_agendamento;
    }

    public void setHorario_agendamento(String sHorario_agendamento) {
        this.sHorario_agendamento = sHorario_agendamento;
    }

    public int getId_vacina() {
        return iId_vacina;
    }

    public void setId_vacina(int iId_vacina) {
        this.iId_vacina = iId_vacina;
    }

    public int getId_pet() {
        return iId_pet;
    }

    public void setId_pet(int iId_pet) {
        this.iId_pet = iId_pet;
    }

    public int getId_cliente() {
        return iId_cliente;
    }

    public void setId_cliente(int iId_cliente) {
        this.iId_cliente = iId_cliente;
    }

    public int getId_veterinario() {
        return iId_veterinario;
    }

    public void setId_veterinario(int iId_veterinario) {
        this.iId_veterinario = iId_veterinario;
    }

    public String getData_inicial_agendamento() {
        return sData_inicial_agendamento;
    }

    public void setData_inicial_agendamento(String sData_inicial_agendamento) {
        this.sData_inicial_agendamento = sData_inicial_agendamento;
    }

    public String getData_final_agendamento() {
        return sData_final_agendamento;
    }

    public void setData_final_agendamento(String sData_final_agendamento) {
        this.sData_final_agendamento = sData_final_agendamento;
    }

    
}
