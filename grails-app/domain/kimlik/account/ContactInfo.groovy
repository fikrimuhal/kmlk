package kimlik.account

import startupservices.Location

class ContactInfo {
    static embedded = ['address']
    Set<String> authenticatedEmails = new HashSet<String>()
    Set<String> unAuthenticatedEmails = new HashSet<String>()
    String primaryEmail
    String publicEmail

    String privateTel
    String publicTel

    Location address  = new Location()
    String webSite


    static constraints = {
        authenticatedEmails nullable: true
        unAuthenticatedEmails nullable: true
        primaryEmail nullable: true
        publicEmail nullable: true

        privateTel nullable: true
        publicTel nullable: true

        address nullable: true
        webSite nullable: true
    }

    Set<String> getAllEmails() {
        Set<String> r = new HashSet<>()
        r << authenticatedEmails + unAuthenticatedEmails << primaryEmail << publicEmail
        return r
    }
}
