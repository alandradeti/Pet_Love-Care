package CarteiraVacinacao;

public class CarteiraVacinacao {
    private String sData_pet_vacina;
    private int iId_vacina;
    private int iId_pet;

    public String getData_pet_vacina() {
        return sData_pet_vacina;
    }

    public void setData_pet_vacina(String sData_pet_vacina) {
        this.sData_pet_vacina = sData_pet_vacina;
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
    
}
