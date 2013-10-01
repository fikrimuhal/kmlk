package startupservices

class ProfileTagLib {
    static defaultEncodeAs = 'html'
    //static encodeAsForTags = [tagName: 'raw']
    /**
     * @attr profile
     */
    def isSelfProfile = { attrs, body ->
        def isSelf = request.getSession(false) && attrs.profile.id == session?.loggedinProfileId
        out << isSelf
    }
}
