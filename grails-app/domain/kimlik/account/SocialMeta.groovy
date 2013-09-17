package kimlik.account

class SocialMeta {
    String source

    String upstreamId

    Date upstreamFetchDate = new Date()

    boolean editedByUser

    static constraints = {
    }

    boolean isUpdateFromUpStreamAllowed() {
        return !editedByUser
    }
}
