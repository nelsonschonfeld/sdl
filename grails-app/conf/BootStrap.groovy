import cargos.Cargo
import personal.Personal

class BootStrap {

    def init = { servletContext ->

        def cargo = new Cargo()
        cargo.name = "Profesor"
        cargo.description = "Profesor de la secundaria"
        //cargo.active = true
        cargo.save()

        def personal = new Personal()
        personal.name = "Nelson"
        personal.surname = "Schon"
        personal.email= "nelson@hotmail.com"
        personal.dateBorn = new Date()
        personal.dni = 34555123
        personal.cuil = "20-34555123-4"
        personal.addres = "los angeles 123"
        personal.phone = "3423423323"
        personal.cargo = cargo
        personal.save()

        def cargo1 = new Cargo()
        cargo1.name = "Recepcionista"
        cargo1.description = "Recepcionista de la secundaria"
        //cargo1.active = true
        cargo1.save()

        def personal1 = new Personal()
        personal1.name = "Javier"
        personal1.surname = "Schon"
        personal1.email= "javier@hotmail.com"
        personal1.dateBorn = new Date()
        personal1.dni = 34544123
        personal1.cuil = "20-34544123-4"
        personal1.addres = "los angeles 44"
        personal1.phone = "3423423123"
        personal1.cargo = cargo1
        personal.active = false
        personal1.save()

        def cargo2 = new Cargo()
        cargo2.name = "Secretario"
        cargo2.description = "Secretario de la secundaria"
        cargo2.active = false
        cargo2.save()

        def personal2 = new Personal()
        personal2.name = "Mauro"
        personal2.surname = "Heit"
        personal2.email= "mauro@hotmail.com"
        personal2.dateBorn = new Date()
        personal2.dni = 39555129
        personal2.cuil = "20-39555129-4"
        personal2.addres = "los angeles 129"
        personal2.phone = "3423429998"
        personal2.cargo = cargo2
        personal2.active = false
        personal2.save()
    }
    def destroy = {
    }
}
