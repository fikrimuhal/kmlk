package kimlik.account

import kimlik.account.Facebook

/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 9/10/13
 * Time: 8:16 PM
 * To change this template use File | Settings | File Templates.
 */
class Accounts {
    static embedded = ['facebook']

    Facebook facebook
//    Linkedin linkedin
//    Twitter twitter
//    Google google


    static constraints = {
        facebook(nullable: true)
    }
}
