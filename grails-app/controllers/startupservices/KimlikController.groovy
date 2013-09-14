package startupservices

import com.mongodb.DBCollection
import com.mongodb.WriteConcern
import grails.converters.JSON
import kimlik.account.Accounts
import kimlik.account.Address
import kimlik.account.ContactInfo
import kimlik.account.Facebook
import kimlik.account.MapCoordinates
import kimlik.account.history.GeneralisedHistory
import kimlik.account.history.HistoryEntity
import org.bson.types.ObjectId

class KimlikController {

    def ajaxFriends() {

        def currentUsersId = ObjectId.massageToObjectId(session.loggedinProfileId)

        def data = shallowUser(Profile.get(currentUsersId).friends)
        render(data as JSON)
//        render 'ok'
    }


    def ajaxSkills() {
        def data = []
        fetchProfile().skills.each {
            data << [
                    name: it.name,
                    self_score: it.self_score,
                    profiles: [
                            better: it.betterThanMe*.id*.toStringMongod(),
                            same: it.sameAsMe*.id*.toStringMongod(),
                            worst: it.worstThanMe*.id*.toStringMongod()
                    ]
            ]
        }
        render(data as JSON)
    }

    def ajaxRateSelf() {
        assert session.loggedinProfileId
        assert params.skillName
        assert params.value  //1,2,3,4
        int value = Integer.parseInt(params.value)
        def skillName = params.skillName
        def currentUsersId = ObjectId.massageToObjectId(session.loggedinProfileId)

        DBCollection col = Profile.collection
        def percent
        switch (value) {
            case 1:
                percent = 5
                break
            case 2:
                percent = 22
                break
            case 3:
                percent = 60
                break
            case 4:
                percent = 90
                break
            default:
                percent = 0
        }

        def result = col.update([_id: currentUsersId, 'skills.name': skillName], [$set: ['skills.$.self_score': value]], false, false, WriteConcern.NONE)

        //todo percentler burada hesaplanmayacak   , ornek olsun diye koydum
       col.update([_id: currentUsersId, 'skills.name': skillName], [$set: ['skills.$.percent': percent]], false, false, WriteConcern.NONE)


        render result as JSON
    }

    def ajaxRateFriend() {
        assert session.loggedinProfileId
        assert params.friendId
        assert params.skillName
        assert params.value

        def result = [result: 'success']
        render result as JSON
    }



    def index() {
        [profile: fetchProfile()]

    }

    def follow() {
        [profile: fetchProfile()]
    }

    def education() {
        [profile: fetchProfile()]
    }

    def employment() {
        [profile: fetchProfile()]
    }

    def skills() {
        [profile: fetchProfile()]
    }

    private fetchProfile() {
        def profile = Profile.findByUsername(params.username)
        if (!profile) {
            redirect(url: '/')
        }

        return profile
    }

    private Collection<Profile> shallowUser(Collection<Profile> profiles) {
        def data = []
        profiles.each {
            data << [
                    id: it.id?.toStringMongod(),
                    name: it.name,
                    pictureUrl: "http://graph.facebook.com/${it.accounts.facebook.remoteId}/picture"
            ]
        }
        return data
    }

    def random = new Random()

}
