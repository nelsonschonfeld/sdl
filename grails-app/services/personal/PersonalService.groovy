package personal

import cargos.Cargo
import grails.transaction.Transactional

@Transactional
class PersonalService {

    def personalList() {
       return Personal.list()
    }
}
