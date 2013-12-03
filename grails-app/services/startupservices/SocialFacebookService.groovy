package startupservices

import groovyx.net.http.RESTClient
import kimlik.account.SocialAccount
import kimlik.account.SocialMeta
import kimlik.account.history.HistoryEntity
import uk.co.desirableobjects.oauth.scribe.OauthService
import org.scribe.model.Token

import java.text.SimpleDateFormat

class SocialFacebookService {
    OauthService oauthService // or new OauthService() would work if you're not in a spring-managed class.
    final String FACEBOOK_GRAPH_URL = 'https://graph.facebook.com/'

    def profileService
    def pictureService

    def addToProfile(def profile, Token token) {
        log.debug('addFacebookProfile to existing profile')

        def data = fetchUpStream(token)

        updateAccounts(profile, token, data)

//        updateContactInfo(profile, data)

        updateBasicInfo(profile, data)

        updateFriends(profile, data)

    }


    private updateFriends(Profile profile, def data) {
        log.debug('updating updateFriends')
        println data
        if (data.friends) {

            data.friends.data.each {
                def friendsData = [
                        id: it.id,
                        first_name: it.first_name,
                        middle_name: it.middle_name,
                        last_name: it.last_name,
                ]
                profileService.addFriend(profile.id, friendsData, 'facebook')
            }
        }
    }

    private updateBasicInfo(Profile profile, def data) {
        log.debug('updating updateBasicInfo')
        profile.first_name = profile.first_name ?: data.first_name
        profile.last_name = profile.last_name ?: data.last_name
        profile.contactInfo.primaryEmail = profile.contactInfo.primaryEmail ?: data.email
        profile.save()
    }

    private updateContactInfo(Profile profile, def data) {
        log.debug('updating updateContactInfo')
        profile
        println data.emailAddress
    }

    private updateAccounts(Profile profile, Token token, def data) {
        log.debug('updating updateAccounts')

        profile.accounts.facebook = new SocialAccount(
                remoteId: data.id,
                first_name: data.first_name,
                last_name: data.last_name,
                middle_name: data.middle_name,
                token: token.token,
                token_secret: token.secret
        )
        profile.save(failOnError: true)


    }


    def fetchUpStream(Token token) {
//        def consumerKey = grailsApplication.config.oauth.providers.facebook.key
//        def consumerSecret = grailsApplication.config.oauth.providers.facebook.secret
        def facebook = new RESTClient(FACEBOOK_GRAPH_URL)
        def r = facebook.get(path: "me", params: [access_token: token.token, fields: 'email,first_name,last_name,languages,username,name,middle_name,hometown,location,education,devices,age_range,picture.height(400),friends.fields(picture.height(400),first_name,last_name,username,middle_name)'], requestContentType: 'application/json')
        r.status == 200
        return r.data
    }

}
//
//def profile = new Profile(
//        username: params.username,
//        first_name: fbData.first_name,
//        last_name: fbData.last_name,
//        middle_name: fbData.middle_name,
//        registered: true,
//        accounts: new Accounts(
//                facebook: new SocialAccount(
//                        remoteId: fbData.id,
//                        first_name: fbData.first_name,
//                        last_name: fbData.last_name,
//                        middle_name: fbData.middle_name,
//                )
//        ),
//        contactInfo: new ContactInfo(
//                primaryEmail: 'sumnulu@gmail.com',
//                publicEmail: 'sumnulu@gmail.com',
//                authenticatedEmails: ['sumnulu@gmail.com'],
//                unAuthenticatedEmails: ['ilgaz@fikrimuhal.com'],
//
//                publicTel: '333 55 44',
//
//                address: new Address(
//                        country: 'Turkey',
//                        city: 'Istanbul',
//                        other: 'Elysium garden k4, cekmekoy',
//                        googleMapsCoordinates: new MapCoordinates(
//                                latitude: 41.0136,
//                                longitude: 28.9550,
//                                zoomLevel: 1000
//                        )
//                ),
//                webSite: 'www.kimlik.io'
//        ),
//        educationHistory: new GeneralisedHistory(
//                history: []),
//        workHistory: new GeneralisedHistory(
//                history: []),
//        aboutText: '',
//        birthDate: null,
//        skills: [],
//        friends: []
//)