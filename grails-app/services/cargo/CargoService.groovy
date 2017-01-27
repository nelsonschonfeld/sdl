package cargo

import cargos.Cargo
import grails.transaction.Transactional

@Transactional
class CargoService {

    def cargoList() {
        return Cargo.list()
    }
}
