package cargo

import grails.converters.JSON

class CargoController {

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
        def response= cargoService.newCargo(params)
        if(response.status == 201){
            flash.message = response.message
        }else{
            flash.error = response.message
        }
        redirect(action: "create")
    }
}
