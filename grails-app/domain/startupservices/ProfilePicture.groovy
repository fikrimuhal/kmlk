package startupservices

class ProfilePicture {
    static embedded = ['pictures', 'defaultPicture']
    static transients = ['profilePictureUrl']


    Set<Picture> pictures = new HashSet<Picture>()
    Picture defaultPicture

    static hasMany = [
            pictures: Picture,
    ]
    static constraints = {
    }


    String getProfilePictureUrl() {
       if(defaultPicture){
           return defaultPicture.url
       }else{
           return null
       }

    }


}
