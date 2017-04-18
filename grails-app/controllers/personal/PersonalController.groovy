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
        def cargosList = cargoService.cargoList()
        def cargos = cargosList as JSON
        render(view: "index", model: [personales: personales, cargos: cargos])
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

    def delete() {
        def data = request.getJSON()
        def resp= personalService.deletePersonal(data)
        respond(resp)
    }

    def inactive() {
        def data = request.getJSON()
        def resp= personalService.inactivePersonal(data)
        respond(resp)
    }

    def update() {
        def data = request.getJSON()
        def resp= personalService.updatePersonal(data)
        respond(resp)
    }

}
