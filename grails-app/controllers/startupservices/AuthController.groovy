package startupservices

import grails.converters.JSON
import org.bson.types.ObjectId

class AuthController {

    def index() {}



    def ajaxAuth() {
        def currentUsersId = ObjectId.massageToObjectId(session.loggedinProfileId)

        def data = Profile.get(currentUsersId)
        if (data) {

            render data as JSON
        } else {
            render status: 404
        }
    }


}
