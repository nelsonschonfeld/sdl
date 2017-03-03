package cargo

import cargos.Cargo
import grails.transaction.Transactional

@Transactional
class CargoService {

    def cargoList() {
        return Cargo.findAll()
    }

    def newCargo(Object carg){
        def cargo = new Cargo()
        cargo.name= carg.name
        cargo.description=carg.description
        //cargo.active=carg.active
        cargo.save()
        if (cargo.hasErrors()==true){
            log.error("Error al crear el Cargo - ${cargo.getErrors()}")
            return [status: 404, message:"Error al crear el Cargo, este ya se encuentra registrado."]
        }else{
            return [status: 201, message: "Cargo creado correctamente"]
        }
    }
}
