package startupservices

import grails.converters.JSON
import org.bson.types.ObjectId

class AuthController {
    def authenticationService
    def persistentLoginService

    def index() {}


    def ajaxAuth() {
        cache("private_nostore")

        def data = authenticationService.authenticatedUser
        if (data) {
//           data.notificationInbox = null
            render data as JSON
        } else {
            render status: 401
        }
    }


    def logout() {
        cache("private_nostore")

        persistentLoginService.sendCancelCookie()
        authenticationService.logout()

        redirect(url: '/')
    }


}
