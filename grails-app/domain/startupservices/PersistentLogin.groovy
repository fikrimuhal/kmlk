package startupservices

import org.bson.types.ObjectId

class PersistentLogin {
    ObjectId id  // device id i.e unique to browser

    Profile profile

    String token

    static constraints = {
    }
}
