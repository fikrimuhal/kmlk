package startupservices

import kimlik.account.Accounts
import kimlik.account.ContactInfo
import kimlik.account.history.GeneralisedHistory
import notification.NotificationInbox
import org.bson.types.ObjectId

class Profile {
    static embedded = ['accounts', 'contactInfo', 'workHistory', 'educationHistory', 'skills', 'profilePicture'/*,'notificationInbox'*/]

    static transients = ['profilePictureUrl','name','profileUrl']
            ObjectId id

    /**
     * true ise kulanici kimli.io ya register olmus
     * False ise register olmus bir kisinin arkadasi
     */
    Boolean registered

    Accounts accounts = new Accounts()
    ContactInfo contactInfo = new ContactInfo()

    GeneralisedHistory workHistory = new GeneralisedHistory()
    GeneralisedHistory educationHistory = new GeneralisedHistory()

    List<PersonalSkill> skills = new ArrayList<PersonalSkill>()

    ProfilePicture profilePicture = new ProfilePicture()

    List<Profile> friends = new ArrayList<Profile>()
    List<ProfileMerge> contactMerges = new ArrayList<ProfileMerge>()

//    NotificationInbox notificationInbox

    String username
    String aboutText

    String first_name
    String last_name
    String middle_name
    String birthDate

    static hasMany = [
            friends: Profile,
            skills:PersonalSkill,
            contactMerges: ProfileMerge
    ]

    static constraints = {
//        accounts nullable: true
//        registered nullable: true
        username(unique: false, minSize: 4)

    }

    static mapping = {
        username(index: true)

    }

    String getName() {

        def r = first_name
        if (middle_name)
            r += ' ' + middle_name
        if (last_name)
            r += ' ' + last_name
        return r
    }

    String getProfilePictureUrl() {
        if (profilePicture?.profilePictureUrl) {
            return profilePicture?.profilePictureUrl
        } else if (accounts.hasFacebook()) {
            return "http://graph.facebook.com/${accounts.facebook.remoteId}/picture?height=400"
        } else if (accounts.hasLinkedin()) {
            return accounts.linkedin.picture_url
        }
    }



    String getProfileUrl() {
        if (registered) {
            return '/kimlik/profile/' + username

        } else {
            return '/kimlik/profile/' + id

        }
    }
}
