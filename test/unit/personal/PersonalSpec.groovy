package personal

import cargos.Cargo
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Personal)
@Mock(Cargo)
class PersonalSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void testCreatePersonal() {
        given: "A new Cargo"
        def cargo = new Cargo()
        cargo.name = "profesor"
        cargo.description = "profesor de la secundaria"
        cargo.save()

        def personal = new Personal()
        personal.dni = 34555121
        personal.name = "nelson"
        personal.surname = "schon"
        personal.dateBorn = new Date()
        personal.addres = "los angeles 123"
        personal.cellPhone = "3423423"
        personal.phone = "3423423"
        personal.cargo = cargo

        when: "The Cargo is saved"
        personal.save(flush: true)
        then: "It saved successfully and can be found in the database"
        assert cargo.errors.errorCount == 0
        assert personal.errors.errorCount == 0
    }

    void testCreateCargoDuplicate() {
        given: "A new Cargo"
        def cargo = new Cargo()
        cargo.name = "profesor"
        cargo.description = "profesor de la secundaria"
        cargo.save()

        def personal = new Personal()
        personal.dni = 34555121
        personal.name = "nelson"
        personal.surname = "schon"
        personal.dateBorn = new Date()
        personal.addres = "los angeles 123"
        personal.cellPhone = "3423423"
        personal.phone = "3423423"
        personal.cargo = cargo
        personal.save(flush: true)

        def personalDup = new Personal()
        personalDup.dni = 34555121
        personalDup.name = "nelson"
        personalDup.surname = "schon"
        personalDup.dateBorn = new Date()
        personalDup.addres = "los angeles 123"
        personalDup.cellPhone = "3423423"
        personalDup.phone = "3423423"
        personalDup.cargo = cargo

        when: "The Cargo duplicated is goint to saving"
        personalDup.save(flush: true)
        then: "It saved successfully and can be found in the database"
        assert cargo.errors.errorCount == 0
        assert personal.errors.errorCount == 0
        assert personalDup.errors.errorCount == 1

    }

    void testCreateDefaultValuePersonal() {
        given: "A new Cargo"
        def cargo = new Cargo()
        cargo.name = "profesor"
        cargo.description = "profesor de la secundaria"
        cargo.save()

        def personal = new Personal()
        personal.dni = 34555121
        personal.name = "nelson"
        personal.surname = "schon"
        personal.cargo = cargo

        when: "The Cargo is saved"
        personal.save(flush: true)
        then: "It saved successfully and can be found in the database"
        assert cargo.errors.errorCount == 0
        assert personal.errors.errorCount == 0
    }
}
