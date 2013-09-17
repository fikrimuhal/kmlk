package startupservices

import grails.converters.JSON
import groovy.json.JsonSlurper
import groovyx.net.http.RESTClient
import kimlik.account.Accounts
import kimlik.account.Address
import kimlik.account.ContactInfo
import kimlik.account.SocialAccount
import kimlik.account.MapCoordinates
import kimlik.account.history.GeneralisedHistory
import kimlik.account.history.HistoryEntity
import org.bson.types.ObjectId
import org.scribe.model.Token
import uk.co.desirableobjects.oauth.scribe.OauthService
import org.scribe.model.Response


class RegisterController {
    def random = new Random()
    def socialLinkedInService
    def socialFacebookService

    def index() {
    }

    def failure() {
        render 'fail'
    }

    //social callback
    def success() {
        if (session.loggedinProfileId) {
            def profile = Profile.get(session.loggedinProfileId)
            log.debug 'session da kullanıcı var, hesaba yeni account ekleyelim'
            switch (params.id) {
                case 'facebook':
                    if (profile.accounts.hasFacebook()) {
                        redirectToProfile(profile.username)
                    } else {
                        socialFacebookService.addToProfile(profile, facebookToken);
                        redirectToProfile(profile.username)
                    }
                    break
                case 'linkedin':
                    if (false && profile.accounts.hasLinkedin()) {
                        redirectToProfile(profile.username)
                    } else {
                        socialLinkedInService.addToProfile(profile, linkedinToken);

                        redirectToProfile(profile.username)
                    }
                    break
                case 'google':
                    profile.accounts.hasGoogle() ? redirectToProfile(profile.username) : addGoogleToProfile(profile);
                    redirectToProfile(profile.username)
                    break
                case 'twitter':
                    profile.accounts.hasTwitter() ? redirectToProfile(profile.username) : addTwitterToProfile(profile);
                    redirectToProfile(profile.username)
                    break
                default:
                    log.warn("Unknown social provider! procider=${id}")
                    redirectToProfile(profile.username)
                    break
            }
            //yeni hesap eklendi, anasayfaya yolla
            // redirectToProfile(profile.username)
        } else {
            log.debug 'session da kullanıcı yok. bu noktada ya kullanici ilk defa kayit oluyor yada yeni login oluyor'
            switch (params.id) {
                case 'facebook':
                    facebookSuccess()
                    break
                case 'linkedin':
//                    addLinkedInToProfile(profile);
                    break
                case 'google':
//                   addGoogleToProfile(profile);
                    break
                case 'twitter':
//                     addTwitterToProfile(profile);
                    break
                default:
                    log.error("Unknown social provider! provider=${id}")
                    render status: 404
//                    redirectToProfile(profile.username)
                    break
            }
        }


    }

    private addTwitterToProfile(def profile) {
        //To change body of created methods use File | Settings | File Templates.
    }

    private addGoogleToProfile(def profile) {
        //To change body of created methods use File | Settings | File Templates.
    }

    private redirectToProfile(String username) {
        redirect(controller: 'kimlik', params: [username: username], fragment: '')
    }















    private facebookSuccess() {
        def data = socialFacebookService.fetchUpStream(facebookToken)

        def facebookId = data.id
        def result = Profile.collection.findOne(['accounts.facebook.remoteId': facebookId])

        if (result) {
            session.loggedinProfileId = result._id
            log.debug(session.loggedinProfileId)
            redirect(controller: 'kimlik', params: [username: result.username], fragment: '')
        } else {
            session.facebookRaw = data

        }

    }

    def ajaxCreate() {
        Boolean userNameExists = Profile.countByUsername(params.username) != 0
        if (userNameExists) {
            render(code: 404)
        }
        def fbData = session.facebookRaw
        assert fbData
        assert fbData.id
        println fbData.id

        //===============================
        def profile = new Profile(
                username: params.username,
                first_name: fbData.first_name,
                last_name: fbData.last_name,
                middle_name: fbData.middle_name,
                registered: true,
                accounts: new Accounts(
                        facebook: new SocialAccount(
                                remoteId: fbData.id,
                                first_name: fbData.first_name,
                                last_name: fbData.last_name,
                                middle_name: fbData.middle_name,
                        )
                ),
                contactInfo: new ContactInfo(
                        primaryEmail: 'sumnulu@gmail.com',
                        publicEmail: 'sumnulu@gmail.com',
                        authenticatedEmails: ['sumnulu@gmail.com'],
                        unAuthenticatedEmails: ['ilgaz@fikrimuhal.com'],

                        publicTel: '333 55 44',

                        address: new Address(
                                country: 'Turkey',
                                city: 'Istanbul',
                                other: 'Elysium garden k4, cekmekoy',
                                googleMapsCoordinates: new MapCoordinates(
                                        latitude: 41.0136,
                                        longitude: 28.9550,
                                        zoomLevel: 1000
                                )
                        ),
                        webSite: 'www.kimlik.io'
                ),
                educationHistory: new GeneralisedHistory(
                        history: []),
                workHistory: new GeneralisedHistory(
                        history: []),
                aboutText: '',
                birthDate: null,
                skills: [],
                friends: []
        )

        //===============================


        profile = profile.save(failOnError: true)  // hata olursa exeption at
        session.loggedinProfileId = profile.id
        createFriends(profile)

        session.facebookRaw = null  //facebook datasiyle isimiz bitti

        def data = [
                username: params.username
        ]
        render(data as JSON)
    }

    private createFriends(Profile currentProfile) {
        def friendRaw = session.facebookRaw?.friends?.data
        assert friendRaw
        def friends = []
        friendRaw.each { fbData ->
            def profile = new Profile(
                    registered: false,
                    accounts: new Accounts(
                            facebook: new SocialAccount(
                                    remoteId: fbData.id,
                                    first_name: fbData.first_name,
                                    last_name: fbData.last_name,
                                    middle_name: fbData.middle_name,
                            )
                    ),
                    first_name: fbData.first_name,
                    last_name: fbData.last_name,
                    middle_name: fbData.middle_name,
            )//.save(failOnError: true);
            friends << profile
        }
        currentProfile.friends = friends
        currentProfile.save(failOnError: true)

    }

    def ajaxCheckUsername() {
        Boolean userNameExists = Profile.countByUsername(params.username) != 0
        def data = [
                available: !userNameExists,
                username: params.username
        ]
        render(data as JSON)
    }



    OauthService oauthService // or new OauthService() would work if you're not in a spring-managed class.
    Token getFacebookToken() {

        String sessionKey = oauthService.findSessionKeyForAccessToken('facebook')
        return session[sessionKey]

    }

    Token getLinkedinToken() {

        String sessionKey = oauthService.findSessionKeyForAccessToken('linkedin')
        return session[sessionKey]

    }


}
