package startupservices

import com.mongodb.DBCollection
import com.mongodb.DBObject
import com.mongodb.WriteConcern
import org.bson.types.ObjectId
import org.codehaus.groovy.grails.web.util.WebUtils

import javax.annotation.PostConstruct
import javax.servlet.http.Cookie


class PersistentLoginService {
    def authenticationService
    def grailsApplication

    final String COOKIE_BASE = 'remember'
    final String COOKIE_DEVICE = COOKIE_BASE + '.device'
    final String COOKIE_TOKEN = COOKIE_BASE + '.token'
    final int COOKIE_AGE = 3600 * 24 * 30 * 12   //1 yil

    @PostConstruct
    void init() {
        println 'PersistentLoginService post construct called'
        authenticationService.registerPersistentLoginService(this)
    }

    /**
     * if request has cookie updates
     * @return ProfileId or null
     */
    ObjectId authenticate() {
        ObjectId profileId = null
        getDomain()
        def cookie = currentPersistentLoginCookie
        if (!cookie) {
            //log.debug('No persistent login cookie found in the request')
            return null
        }

        def device = findDevice(ObjectId.massageToObjectId(cookie.device))


        if (device) {
            log.debug("Device found, url ${request.requestURI}")

            if (device.token == cookie.token) {
                log.debug('token valid')

                /**
                 * send new token only if requestURI is "/grails/auth/ajaxAuth.dispatch" i.e controller= auth action=ajaxAuth
                 * This ensures other authenticated yet and valid concurrent requests handled successfully.
                 * Note that sendCookie method invalidates used cookies(tokens)
                 */
                if (request.requestURI == "/grails/auth/ajaxAuth.dispatch") {
                    sendCookie(upsertDeviceToken(ObjectId.massageToObjectId(cookie.device), null))
                }

                profileId = device.profile
                authenticationService.setAuthenticatedUserId(profileId)

            } else {
                log.debug('invalid token')
                sendCancelCookie(device._id)
            }
        } else {
            log.debug('device not found!')
            sendCancelCookie(null)
        }

        return profileId
    }

    void registerCurrentDevice() {
        log.debug('registering new device')
        def previousCookie = currentPersistentLoginCookie
        if (previousCookie) {
//            log.debug(previousCookie.device)
//            log.debug(previousCookie.token)
            deleteDevice(ObjectId.massageToObjectId(previousCookie.device))
        }
        def profileId = authenticationService.authenticatedUserId
        sendCookie(upsertDeviceToken(null, profileId))

    }

    boolean isDeviceRegistered() {
        return currentPersistentLoginCookie
    }

    def sendCookie(def persistentLogin) {
        log.debug('sending new token')
        assert persistentLogin

        def cookies = [:]
        cookies.put(COOKIE_DEVICE, persistentLogin._id.toString())
        cookies.put(COOKIE_TOKEN, persistentLogin.token.toString())

        cookies.each { String key, String val ->
            def cookie = new Cookie(key, val)
            cookie.path = '/'
            cookie.maxAge = COOKIE_AGE
            cookie.domain = '.' + domain
            response.addCookie(cookie)
        }
    }

    def sendCancelCookie(ObjectId deviceId) {
        deleteDevice(deviceId ?: ObjectId.massageToObjectId(currentPersistentLoginCookie.device))
        [COOKIE_DEVICE, COOKIE_TOKEN].each {
            def cookie = new Cookie(it, '')
            cookie.path = '/'
            cookie.maxAge = 0 // delete,
            cookie.domain = '.' + domain
            response.addCookie(cookie)
        }

    }


    def getCurrentPersistentLoginCookie() {
        //todo return cookie
        def result = [:]
        result.device = request.getCookies().find { it.name == COOKIE_DEVICE }?.value
        result.token = request.getCookies().find { it.name == COOKIE_TOKEN }?.value
        return (result.device && result.token) ? result : null
    }

    /**
     * deletes all persistentLogin entries for user
     * @param profileId
     */
    private deleteAllDevices(ObjectId profileId) {

        DBCollection col = PersistentLogin.collection
        def _QUERY = [profile: profileId]

        col.remove(_QUERY)
    }

    private deleteDevice(ObjectId deviceId) {
        log.debug("deleting device record _id: ${deviceId}")
        DBCollection col = PersistentLogin.collection
        def _QUERY = [_id: deviceId]

        col.remove(_QUERY, WriteConcern.SAFE)

    }

    private findDevice(ObjectId deviceId) {
        DBCollection col = PersistentLogin.collection
        def _QUERY = [_id: deviceId]
        return col.findOne(_QUERY)
    }

    private upsertDeviceToken(ObjectId deviceId, ObjectId profileId) {
        log.debug("updating database, device id to update: ${deviceId}")
        String token = generateNewToken()

        DBCollection col = PersistentLogin.collection

        // if deviceId is missing we are creating a new Id here
        def _QUERY = [_id: deviceId ?: new ObjectId()]
        def _OPS = [:]

        _OPS.'$set' = [token: token]
        _OPS.'$setOnInsert' = [profile: profileId]

        return col.findAndModify(_QUERY, null, null, false, _OPS, true, true)

    }


    private String generateNewToken() {
        def token = UUID.randomUUID().toString()
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
     *
     * @return localhost.kimlik.io
     */
    private getDomain() {
        grailsApplication.config.grails.serverURL.toLowerCase() - 'http://'

    }
}
