package cargos

class Cargo {

    String name
    String description
    Boolean active = true

    static constraints = {
        name unique: true
        description nullable: true
    }
}
