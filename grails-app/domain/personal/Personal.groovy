package personal

import cargos.Cargo

class Personal {

    String name
    String surname
    String email
    Date dateBorn
    Long dni
    String cuil
    String addres
    String phone
    Cargo cargo
    Boolean active = true

    static constraints = {
        dni unique: true
        cuil unique: true
        dateBorn nullable: true
        addres nullable: true
        email nullable: true
        phone nullable: true
    }
}
