package startupservices

class ProfilePicture {
    static embedded = ['pictures', 'defaultPicture']
    static transients = ['profilePictureUrl']


    Set<Picture> pictures = new HashSet<Picture>()

    /**
     * @Deprecated
     */
    Picture defaultPicture

    String url //default Picture

    static hasMany = [
            pictures: Picture,
    ]
    static constraints = {
    }


    String getProfilePictureUrl() {
      url
    }


}
