package kimlik
/**
 * Created by sumnulu on 21/01/14.
 */
class ProfileUtils {
    static postProcessProfile(Map profile) {
        if (profile == null) return null

        profilePicture profile

        otherFields profile

        removeConfidentialData profile

        return profile
    }

    static Map otherFields(def profile) {

        profile.profileUrl = '/kimlik/profile/' + (profile.username ?: profile._id)

        return profile
    }

    static profilePicture(Map profile) {
        //add Facebook picture to the list
        if (profile?.accounts?.facebook) {

            String facebookProfilePictureUrl = "http://graph.facebook.com/${profile.accounts.facebook.remoteId}/picture?height=400"

            def facebookPicture = [
                    _id: "",
                    broken: false,
                    bucket: "",
                    path: "",
                    source: "facebook",
                    url: facebookProfilePictureUrl
            ]

            profile.profilePicture.pictures << facebookPicture
        }

        /**
         * If no picture exists or default picture url set it
         */
        if (!profile.profilePicture.url) {
            def firstPicture = profile.profilePicture.pictures[0]
            profile.profilePicture.url = firstPicture.url
        }



        return profile
    }

    static removeConfidentialData(Map profile) {
        profile?.accounts?.linkedin?.remove('token')
        profile?.accounts?.linkedin?.remove('token_secret')
        profile?.accounts?.facebook?.remove('token')
    }

}
