package startupservices

import grails.converters.JSON

import org.bson.types.ObjectId
import org.scribe.model.Token
import uk.co.desirableobjects.oauth.scribe.OauthService


class RegisterController {
    def authenticationService
    def random = new Random()
    def socialLinkedInService
    def socialFacebookService
    boolean forceUpdate = true

    def index() {
    }

    def signIn() {
    }

    def signUp() {
    }

    def failure() {
        render 'fail'
    }

    //social callback
    def success() {
        if (authenticationService.loggedIn) {
            def profile = authenticationService.authenticatedUserWithGorm
            log.debug 'session da kullanıcı var, hesaba yeni account ekleyelim'
            switch (params.id) {
                case 'facebook':
                    if (!forceUpdate && profile.accounts.hasFacebook()) {
                        redirectToProfile(profile.username)
                    } else {
                        socialFacebookService.addToProfile(profile, facebookToken);
                        redirectToProfile(profile.username)
                    }
                    break
                case 'linkedin':
                    if (!forceUpdate && profile.accounts.hasLinkedin()) {
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
                    linkedinSuccess();
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
        redirect(controller: 'kimlik', action: 'profile', params: [id: username], fragment: '')
    }

    /**
     * kullanici registered olabilir
     * kallinici arkadas olarak eklenmis olabilir
     * kullanici yeni olabilir
     * @return
     */
    private linkedinSuccess() {
        def data = socialLinkedInService.fetchUpStream(linkedinToken)

        def id = data.id
        def result = Profile.collection.findOne(['accounts.linkedin.remoteId': id])
        //todo
        if (result?.registered == true) {
            authenticationService.authenticatedUserId = result._id
            redirectToProfile(result.username)
        } else {
            session.linkedinRaw = data
            session._reg_profile = result

        }

    }

    private facebookSuccess() {
        def data = socialFacebookService.fetchUpStream(facebookToken)

        def facebookId = data.id
        def result = Profile.collection.findOne(['accounts.facebook.remoteId': facebookId])
        //todo
        if (result?.registered) {
            authenticationService.authenticatedUserId = result._id
            redirectToProfile(result.username)
        } else {
            session.facebookRaw = data
            session._reg_profile = result

        }

    }
    /**
     * Kullanici registered degil fakat
     * arkadasi tarafindan eklenmis olabilir yada
     * ilk defa karsilasiyor olabiliriz
     *
     * username i yok eminiz
     * @return
     */
    def ajaxCreate() {
        Boolean userNameExists = Profile.countByUsername(params.username) != 0
        if (userNameExists) {
            render(code: 404)
            return
        }

        //===============================
        def profile
        if (session._reg_profile) {
            profile = Profile.get(ObjectId.massageToObjectId(session._reg_profile._id))
        } else {
            profile = new Profile()
        }
        profile.username = params.username
        profile.registered = true


        profile = profile.save(failOnError: true)  // hata olursa exeption at

        authenticationService.authenticatedUserId = profile.id
        //===============================

        if (session.facebookRaw) {
            socialFacebookService.addToProfile(profile, facebookToken);
            session.facebookRaw = null
        } else if (session.linkedinRaw) {
            socialLinkedInService.addToProfile(profile, linkedinToken);
            session.linkedinRaw = null
        }

        session._reg_profile = null



        def data = [
                username: params.username
        ]
        render(data as JSON)
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
        return (Token) session[sessionKey]

    }

    Token getLinkedinToken() {

        String sessionKey = oauthService.findSessionKeyForAccessToken('linkedin')
        return (Token) session[sessionKey]

    }


}
