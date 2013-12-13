package startupservices

import com.mongodb.DBCollection
import org.bson.types.ObjectId
import org.codehaus.groovy.grails.web.util.WebUtils


class AuthenticationService {
    def persistentLoginSRV

    static lazyInit = false

    final String AUTHENTICATED_USER_ID = 'AuthenticationService.AUTHENTICATED_USER_ID'

    boolean isLoggedIn() {

        request.getSession(false) && authenticatedUserId
    }

    def getAuthenticatedUser() {
        DBCollection col = Profile.collection
        return fixDeprecatedProfileFields(col.findOne([_id: authenticatedUserId]).toMap())
    }

    @Deprecated
    def getAuthenticatedUserWithGorm() {
        return Profile.findById(authenticatedUserId)
    }

    def logout() {
        session.invalidate()
    }

    /**
     * Try to authenticate with  available methods
     */
    def authenticate() {
        if (loggedIn) {
            //we got him with the session :)
            return authenticatedUserId
        } else if (persistentLoginSRV?.authenticate()) {
            //we got him with the cookie :)
            return authenticatedUserId
        }
    }


    void setAuthenticatedUserId(ObjectId id) {
        session.setAttribute(AUTHENTICATED_USER_ID, id)
    }

    ObjectId getAuthenticatedUserId() {
        (ObjectId) session.getAttribute(AUTHENTICATED_USER_ID)
    }


    private getGrailsWebRequest() {
        return WebUtils.retrieveGrailsWebRequest()

    }

    private getRequest() {
        return grailsWebRequest.currentRequest
    }

    private getResponse() {
        return grailsWebRequest.currentResponse
    }

    private getSession() {
        return grailsWebRequest.session
    }

    /**
     * circular dep. olmasin diye
     * @param persistentLoginService
     */
    void registerPersistentLoginService(PersistentLoginService persistentLoginService) {
        persistentLoginSRV = persistentLoginService
    }
    /**
     * @deprecated
     * @param it
     * @return
     */
    private static fixDeprecatedProfileFields(Map it) {
        def timeline = []

        def addToTimeline = { typeKey, i ->
            timeline << [
                    _id: i._id, //todo fix this id must be unique.
                    typeKey: typeKey,
                    data: i,
                    content: '',
                    title: "$i.entity - $i.position",
                    visible: true,
                    sDate: i.startDate,
                    eDate: i.endDate
            ]
        }

        it.workHistory.history.each addToTimeline.curry('work')
        it.educationHistory.history.each addToTimeline.curry('education')

        it.timeline = timeline
        return it
    }
}
