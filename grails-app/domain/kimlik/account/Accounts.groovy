package kimlik.account

/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 9/10/13
 * Time: 8:16 PM
 * To change this template use File | Settings | File Templates.
 */
class Accounts {
    static embedded = ['facebook', 'linkedin']

    SocialAccount facebook
    SocialAccount linkedin
//    Twitter twitter
//    Google google


    static constraints = {
        facebook(nullable: true)
        linkedin(nullable: true)
    }

    Boolean hasFacebook() {
        facebook?.remoteId
    }

    Boolean hasGoogle() {
        false //facebook.remoteId
    }

    Boolean hasTwitter() {
        false //facebook.remoteId
    }

    Boolean hasLinkedin() {
        linkedin?.remoteId
    }
}
