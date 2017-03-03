package personal

import cargos.Cargo
import grails.transaction.Transactional

@Transactional
class PersonalService {

    def personalList() {
       return Personal.findAll()
    }

    def newPersonal(Object pers){
       def personal = new Personal()
        personal.name= pers.name
        personal.surname=pers.surname
        personal.email=pers.email
        personal.dateBorn=new Date(pers.dateBorn)
        personal.dni=pers.cuil.substring(3,11).toLong()
        personal.cuil=pers.cuil
        personal.addres=pers.addres
        personal.phone=pers.phone
        personal.cargo=Cargo.findById(pers.cargo)
        //personal.active=pers.active
        personal.save()
        if (personal.hasErrors()==true){
            log.error("Error al crear el Personal - ${personal.getErrors()}")
            return [status: 404, message: "Error al crear el Personal, este ya se encuentra registrado."]
        }else{
            return [status: 201, message:"Personal creado correctamente"]
        }
    }
}
