package cargo

import grails.converters.JSON

class CargoController {
    static responseFormats = ['json']

    def cargoService

    def index() {
        def cargoList = cargoService.cargoList()
        def cargos = cargoList as JSON
        render(view: "index", model: [cargos : cargos])
    }

    def create() {
        def cargoList = cargoService.cargoList()
        def cargos = cargoList as JSON
        render(view: "create", model: [cargos: cargos])
    }

    def save() {
        def data = request.getJSON()
        def resp= cargoService.newCargo(data)
        respond(resp)
    }
}
