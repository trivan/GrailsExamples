package test.trip.planer2



import org.junit.*
import grails.test.mixin.*

@TestFor(AirportController)
@Mock(Airport)
class AirportControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/airport/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.airportInstanceList.size() == 0
        assert model.airportInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.airportInstance != null
    }

    void testSave() {
        controller.save()

        assert model.airportInstance != null
        assert view == '/airport/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/airport/show/1'
        assert controller.flash.message != null
        assert Airport.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/airport/list'

        populateValidParams(params)
        def airport = new Airport(params)

        assert airport.save() != null

        params.id = airport.id

        def model = controller.show()

        assert model.airportInstance == airport
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/airport/list'

        populateValidParams(params)
        def airport = new Airport(params)

        assert airport.save() != null

        params.id = airport.id

        def model = controller.edit()

        assert model.airportInstance == airport
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/airport/list'

        response.reset()

        populateValidParams(params)
        def airport = new Airport(params)

        assert airport.save() != null

        // test invalid parameters in update
        params.id = airport.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/airport/edit"
        assert model.airportInstance != null

        airport.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/airport/show/$airport.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        airport.clearErrors()

        populateValidParams(params)
        params.id = airport.id
        params.version = -1
        controller.update()

        assert view == "/airport/edit"
        assert model.airportInstance != null
        assert model.airportInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/airport/list'

        response.reset()

        populateValidParams(params)
        def airport = new Airport(params)

        assert airport.save() != null
        assert Airport.count() == 1

        params.id = airport.id

        controller.delete()

        assert Airport.count() == 0
        assert Airport.get(airport.id) == null
        assert response.redirectedUrl == '/airport/list'
    }
}
