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
        personal.dateBorn= Date.parse("yyyy-MM-dd", pers.dateBorn);
        personal.dni=pers.cuil.substring(3,11).toLong()
        personal.cuil=pers.cuil
        personal.addres=pers.addres
        personal.phone=pers.phone
        personal.cargo=Cargo.findById(pers.cargo)
        //personal.active=pers.active
        personal.save()
        if (personal.hasErrors()==true){
            log.error("Error al crear el Personal - ${personal.getErrors()}")
            return [status: 404, message: "Error al crear el Personal ${pers.name}, este ya se encuentra registrado."]
        }else{
            return [status: 201, message:"Personal ${pers.name} creado correctamente"]
        }
    }

    def deletePersonal(Object pers){
        def personal = Personal.get(pers.id)
        personal.delete(flush: true)
        if (personal.hasErrors()==true){
            log.error("Error al eliminar el Personal - ${personal.getErrors()}")
            return [status: 404, message: "Error al eliminar el Personal ${pers.name}, este no se encuentra registrado."]
        }else{
            return [status: 201, message:"Personal ${pers.name} eliminado correctamente"]
        }
    }

    def inactivePersonal(Object pers){
        def personal = Personal.get(pers.id)
        personal.active = !pers.active
        personal.save(flush: true)
        if (personal.hasErrors()==true){
            log.error("Error al activar/desactivar el Personal - ${personal.getErrors()}")
            return [status: 404, message: "Error al ${(pers.active==true? 'desactivar' : 'activar')}  a ${pers.name} , este no se encuentra registrado.", persInact: personal]
        }else{
            return [status: 201, message:"Personal ${pers.name} ${(pers.active==true? 'desactivado' : 'activado')} correctamente" , persInact: personal]
        }
    }

    def updatePersonal(Object pers){
        def personal = Personal.findAllByCuil(pers.cuil)[0]
        personal.name= pers.name
        personal.surname=pers.surname
        personal.email=pers.email? pers.email : null
        personal.dateBorn= pers.dateBorn? Date.parse("yyyy-MM-dd", pers.dateBorn): null;
        personal.dni=pers.cuil.substring(3,11).toLong()
        personal.cuil=pers.cuil
        personal.addres=pers.addres? pers.addres : null
        personal.phone=pers.phone? pers.phone : null
        personal.cargo=Cargo.findById(pers.cargo)
        //personal.active=pers.active
        personal.save(flush: true)
        if (personal.hasErrors()==true){
            log.error("Error al actualizar el Personal - ${personal.getErrors()}")
            return [status: 404, message: "Error al actualizar el Personal ${pers.name}, este no se encuentra registrado."]
        }else{
            return [status: 201, message:"Personal ${pers.name} actualizado correctamente",  persUpdated: personal]
        }
    }
}
