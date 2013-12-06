package startupservices

import grails.converters.JSON
import org.bson.types.ObjectId

class AuthController {
    def authenticationService
    def persistentLoginService

    def index() {}


    def ajaxAuth() {

        def data = authenticationService.authenticatedUser
        if (data) {
            data.notificationInbox = null
            render data as JSON
        } else {
            render status: 401
        }
    }


    def logout() {
        persistentLoginService.sendCancelCookie()
        authenticationService.logout()
        //todo put cancel cookie
        redirect(url: '/')
    }


}
