import cargos.Cargo
import personal.Personal

class BootStrap {

    def init = { servletContext ->

        def cargo = new Cargo()
        cargo.name = "profesor"
        cargo.description = "profesor de la secundaria"
        //cargo.active = true
        cargo.save()

        def personal = new Personal()
        personal.dni = 34555123
        personal.name = "nelson"
        personal.surname = "schon"
        personal.dateBorn = new Date()
        personal.addres = "los angeles 123"
        personal.cellPhone = "3423423"
        personal.phone = "3423423"
        personal.cargo = cargo
        personal.save()

        def personal1 = new Personal()
        personal1.dni = 34555122
        personal1.name = "nelson"
        personal1.surname = "schon"
        personal1.dateBorn = new Date()
        personal1.addres = "los angeles 123"
        personal1.cellPhone = "3423423"
        personal1.phone = "3423423"
        personal1.cargo = cargo
        personal1.active = false
        personal1.save()

        def cargo1 = new Cargo()
        cargo1.name = "profesorw"
        cargo1.description = "profesor de la secundaria"
        cargo1.active = false
        cargo1.save()

        def personal2 = new Personal()
        personal2.dni = 34555121
        personal2.name = "nelson"
        personal2.surname = "schon"
        personal2.dateBorn = new Date()
        personal2.addres = "los angeles 123"
        personal2.cellPhone = "3423423"
        personal2.phone = "3423423"
        personal2.cargo = cargo1
        personal2.save(flush: true)
    }
    def destroy = {
    }
}
