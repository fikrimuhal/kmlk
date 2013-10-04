package startupservices

class ProfileTagLib {
    static defaultEncodeAs = 'html'
    def authenticationService
    //static encodeAsForTags = [tagName: 'raw']
    /**
     * @attr profile
     */
    def isSelfProfile = { attrs, body ->
        def isSelf = authenticationService.loggedIn && attrs.profile.id == authenticationService.authenticatedUserId
        out << isSelf
    }
}
