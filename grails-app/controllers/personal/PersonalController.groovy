package personal

import cargos.Cargo

class PersonalController {

    def personalService

    def index() {

        def personalList= personalService.personalList()
        return [personalList:personalList]
    }

    def create() {
        def saveParamshere = params
    }


}
