package startupservices

import org.bson.types.ObjectId

class DomainToPage {

    ObjectId id // buna gerek yok

    String[] domains = []
    String pageName
    boolean isCompany
    boolean isProfile
    boolean enabled

    static constraints = {
    }
}
