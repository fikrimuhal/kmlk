package startupservices

import com.mongodb.DBCollection
import com.mongodb.WriteConcern
import grails.converters.JSON

import org.bson.types.ObjectId

class KimlikController {
    def profileService
    def authenticationService
    def skillService

    def ajaxFriends() {
        def data = shallowUser(authenticationService.authenticatedUser.friends)
        render(data as JSON)
//        render 'ok'
    }


    def ajaxSkills() {
        def data = []
        authenticationService.authenticatedUser.skills.each {
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
        assert authenticationService.loggedIn
        assert params.skillName
        assert params.value  //1,2,3,4
        int value = Integer.parseInt(params.value)
        def skillName = params.skillName
        def currentUsersId = authenticationService.authenticatedUserId

        profileService.rateSelfSkill(currentUsersId, skillName, value)

        def result = [result: 'success']
        render result as JSON
    }
    /**
     * @param value {delete | worst | same | better}*
     * @return
     */
    def ajaxRateFriend() {
        assert authenticationService.loggedIn
        assert params.friendId
        assert params.skillName
        assert params.value

        def value = params.value
        def friendId = ObjectId.massageToObjectId(params.friendId)
        def skillName = params.skillName
        def currentUsersId = authenticationService.authenticatedUserId

//        def bucketNames = ['worst', 'same', 'better']
        DBCollection col = Profile.collection
        def _QUERY = [_id: currentUsersId, 'skills.name': skillName]
//        println _QUERY
//        println col.update(_QUERY, [$set: ['skills.$.worstThanMe': friendId]], false, false, WriteConcern.SAFE)
        switch (value) {
            case 'worst':
                log.debug(params.value)
                col.update(_QUERY, [$pull: ['skills.$.betterThanMe': friendId]], false, false, WriteConcern.NONE)
                col.update(_QUERY, [$pull: ['skills.$.sameAsMe': friendId]], false, false, WriteConcern.NONE)
                col.update(_QUERY, [$addToSet: ['skills.$.worstThanMe': friendId]], false, false, WriteConcern.SAFE)
                break

            case 'same':
                log.debug(params.value)
                col.update(_QUERY, [$pull: ['skills.$.betterThanMe': friendId]], false, false, WriteConcern.NONE)
                col.update(_QUERY, [$pull: ['skills.$.worstThanMe': friendId]], false, false, WriteConcern.NONE)
                col.update(_QUERY, [$addToSet: ['skills.$.sameAsMe': friendId]], false, false, WriteConcern.NONE)
                break

            case 'better':
                log.debug(params.value)
                col.update(_QUERY, [$pull: ['skills.$.worstThanMe': friendId]], false, false, WriteConcern.NONE)
                col.update(_QUERY, [$pull: ['skills.$.sameAsMe': friendId]], false, false, WriteConcern.NONE)
                col.update(_QUERY, [$addToSet: ['skills.$.betterThanMe': friendId]], false, false, WriteConcern.NONE)
                break
            default:
                render(status: 404)
                return
        }

        def result = [result: 'success']
        render result as JSON
    }

    def ajaxSaveBasicInfo() {
        assert authenticationService.loggedIn

        def profile = authenticationService.authenticatedUser

        profile.first_name = params.first_name
        profile.last_name = params.last_name
        profile.middle_name = params.middle_name
        profile.aboutText = params.aboutText
        profile.contactInfo.webSite = params.webSite
        profile.save()
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

    def personalInfo() {
        [profile: fetchProfile()]
    }

    def skill() {
        [profile: fetchProfile(), skill: 'Javaa']
    }

    def contacts() {
        [profile: authenticationService.authenticatedUser]

    }

    def messageInbox() {
        [profile: authenticationService.authenticatedUser]

    }

    def notifications() {
        [profile: authenticationService.authenticatedUser]
    }

    def positionPreferences() {
        [profile: authenticationService.authenticatedUser]
    }

    def positionInbox() {
        [profile: authenticationService.authenticatedUser]
    }

    private fetchProfile() {
        def profile = Profile.findByUsername(params.username)
        if (!profile) {
            //id dene
            def id = ObjectId.massageToObjectId(params.username)
            if (id) profile = Profile.findById(id)

        } else if (!profile) {
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
                    pictureUrl: it.profilePictureUrl
            ]
        }
        return data
    }

    def random = new Random()

}
