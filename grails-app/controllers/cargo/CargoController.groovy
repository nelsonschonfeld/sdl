package cargo

class CargoController {

    def cargoService

    def index() {
        def cargoList = cargoService.cargoList()
        return [cargoList : cargoList]
    }
}
