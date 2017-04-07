package personal

import cargos.Cargo
import grails.converters.JSON

class PersonalController {
    static responseFormats = ['json']

    def personalService
    def cargoService

    def index() {
        def personalList= personalService.personalList()
        def personales = personalList as JSON
        render(view: "index", model: [personales: personales])
    }

    def create() {
        def cargosList = cargoService.cargoList()
        def cargos = cargosList as JSON
        render(view: "create", model: [cargos: cargos])
    }

    def save() {
        def data = request.getJSON()
        def resp= personalService.newPersonal(data)
        respond(resp)
    }


}
