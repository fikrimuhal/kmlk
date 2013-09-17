package kimlik.account

class SocialMeta {
    String source

    String upstreamId

    Date upstreamFetchDate

    boolean editedByUser

    static constraints = {
    }

    boolean updateFromUpStreamAllowed() {
        return !editedByUser
    }
}
