package kimlik.account

/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 9/10/13
 * Time: 8:20 PM
 * To change this template use File | Settings | File Templates.
 */
class SocialAccount {
    String remoteId   //facebookId
    String token_secret
    String token
    String first_name
    String last_name
    String middle_name
    String name
    String name_format
    String gender
    String username
    String picture_url

    static constraints = {
        token_secret(nullable: true)
        token(nullable: true)
        first_name(nullable: true)
        last_name(nullable: true)
        middle_name(nullable: true)
        name(nullable: true)
        name_format(nullable: true)
        gender(nullable: true)
        username(nullable: true)
        picture_url(nullable: true)
    }
}

