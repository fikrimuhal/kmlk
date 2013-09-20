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
    boolean forceUpdate = true

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
                   //todo
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
            return
        }

        //===============================
        def profile = new Profile(
                username: params.username,
                registered: true,
        )

        profile = profile.save(failOnError: true)  // hata olursa exeption at
        session.loggedinProfileId = profile.id
        //===============================

        if (session.facebookRaw) {
            socialFacebookService.addToProfile(profile, facebookToken);
            session.facebookRaw = null
        } else if (session.linkedinRaw) {
            session.linkedinRaw = null
        }




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
        return session[sessionKey]

    }

    Token getLinkedinToken() {

        String sessionKey = oauthService.findSessionKeyForAccessToken('linkedin')
        return session[sessionKey]

    }


}
