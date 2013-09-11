package kimlik.account

/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 9/10/13
 * Time: 8:20 PM
 * To change this template use File | Settings | File Templates.
 */
class Facebook {
    String remoteId   //facebookId
    String secret
    String first_name
    String last_name
    String middle_name
    String name
    String name_format
    String gender
    String username

    static constraints = {
        secret(nullable: true)
        first_name(nullable: true)
        last_name(nullable: true)
        middle_name(nullable: true)
        name(nullable: true)
        name_format(nullable: true)
        gender(nullable: true)
        username(nullable: true)
    }
}

