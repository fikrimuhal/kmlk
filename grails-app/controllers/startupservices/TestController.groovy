package startupservices

import org.bson.types.ObjectId

class TestController {
    def persistentLoginService
    def authenticationService

    def index() {
        render 'ok index'
    }

    def a() {
        def profile = Profile.findByUsername('sumnulu')
//        authenticationService.setAuthenticatedUserId(profile.id)
//
//        persistentLoginService.registerCurrentDevice()
        def result = authenticationService.authenticate()
        println result

        println authenticationService.getAuthenticatedUserId()
        println authenticationService.authenticatedUser

        render 'ok'
    }
}
