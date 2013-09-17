package startupservices

import groovyx.net.http.RESTClient
import uk.co.desirableobjects.oauth.scribe.OauthService
import org.scribe.model.Token

class SocialFacebookService {
    OauthService oauthService // or new OauthService() would work if you're not in a spring-managed class.
    final String FACEBOOK_GRAPH_URL = 'https://graph.facebook.com/'


    def addToProfile(def profile, Token token) {
        //To change body of created methods use File | Settings | File Templates.
    }


    def fetchUpStream(Token token) {
//        def consumerKey = grailsApplication.config.oauth.providers.facebook.key
//        def consumerSecret = grailsApplication.config.oauth.providers.facebook.secret
        def facebook = new RESTClient(FACEBOOK_GRAPH_URL)
        def r = facebook.get(path: "me", params: [access_token: token.token, fields: 'email,first_name,last_name,languages,username,name,middle_name,hometown,location,education,devices,age_range,picture.type(large),friends.fields(first_name,last_name,username,middle_name)'], requestContentType: 'application/json')
        r.status == 200
        return r.data
    }

}
