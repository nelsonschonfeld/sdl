package cargos

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Cargo)
class CargoSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void testCreateCargo() {
        given: "A new Cargo"
        def cargo = new Cargo()
        cargo.name = "profesor4"
        cargo.description = "Profesor de la secundaria"
        cargo.active = true
        when: "The Cargo is saved"
        cargo.save(flush: true)
        then: "It saved successfully and can be found in the database"
        assert cargo.errors.errorCount == 0
    }

    void testCreateCargoDuplicate() {
        given: "A new Cargo"
        def cargo = new Cargo()
        cargo.name = "profesor4"
        cargo.description = "Profesor de la secundaria"
        cargo.active = true
        cargo.save(flush: true)

        assert cargo.errors.errorCount == 0

        def cargoDup = new Cargo()
        cargoDup.name = "profesor4"
        cargoDup.description = "Profesor de la secundaria"
        cargoDup.active = true

        when: "The Cargo duplicated is goint to saving"
        cargoDup.save(flush: true)
        then: "It saved successfully and can be found in the database"
        println(cargoDup.errors.getAllErrors().toString())
        assert cargoDup.errors.errorCount == 1
    }

    void testCreateWrongCargo() {
        given: "A new Cargo"
        def cargo = new Cargo()
        cargo.name = null
        cargo.description = "Profesor de la secundaria"
        cargo.active = true
        when: "The Cargo is saved"
        cargo.save(flush: true)
        then: "It saved successfully and can be found in the database"
        assert cargo.errors.errorCount == 1
    }

    void testCreateCargoDefaultValue() {
        given: "A new Cargo"
        def cargo = new Cargo()
        cargo.name = "Preceptor"
        cargo.description = "Preceptor de la secundaria"
        when: "The Cargo is saved"
        cargo.save(flush: true)
        then: "It saved successfully and can be found in the database"
        assert cargo.errors.errorCount == 0
    }
}
