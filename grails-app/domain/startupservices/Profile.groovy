package startupservices

import kimlik.account.Accounts
import kimlik.account.ContactInfo
import kimlik.account.history.GeneralisedHistory
import org.bson.types.ObjectId

class Profile {
    static embedded = ['accounts', 'contactInfo']
    ObjectId id

    /**
     * true ise kulanici kimli.io ya register olmus
     * False ise register olmus bir kisinin arkadasi
     */
    Boolean registered

    Accounts accounts
    ContactInfo contactInfo

    GeneralisedHistory workHistory
    GeneralisedHistory educationHistory

    String username
    String aboutText

    String first_name
    String last_name
    String middle_name
    Date birthDate

    static constraints = {
//        accounts nullable: true
//        registered nullable: true
        username(unique: true, minSize: 4)

    }

    static mapping = {
        username(index: true)

    }

    String getName() {

        def r = first_name
        if (middle_name)
            r += ' ' + middle_name
        if (last_name)
            r += ' ' + last_name
        return r
    }
}
