package personal

import cargos.Cargo

class Personal {
    Long dni
    String name
    String surname
    Date dateBorn
    String addres
    String cellPhone
    String phone
    Cargo cargo
    Boolean active = true

    static constraints = {
        dni unique: true
        dateBorn nullable: true
        addres nullable: true
        cellPhone nullable: true
        phone nullable: true
    }
}
