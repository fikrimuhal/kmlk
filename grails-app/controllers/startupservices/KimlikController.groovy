package startupservices

import com.mongodb.DBCollection
import com.mongodb.WriteConcern
import grails.converters.JSON

import org.bson.types.ObjectId

import static kimlik.ProfileUtils.removePrivateProfileData


class KimlikController {
    def profileService
    def authenticationService
    def skillService
    def domainService

    def ajaxFriends() {
        def data = shallowUser(authenticationService.authenticatedUser.friends)
        render(data as JSON)
//        render 'ok'
    }

    def updateLocation() {
        org.codehaus.groovy.grails.web.json.JSONObject data = request.JSON
        data.remove('id')
        println '____'
        println data as Map
        println '____'
        def result = [status: profileService.updateLocation(data, authenticationService.authenticatedUserId)]
        render result as JSON
    }

    def ajaxSkills() {
        def data = []
        def EMPTY_ARRAY = []
        println authenticationService.authenticatedUserId
        DBCollection col = Profile.collection

        def _QUERY = [_id: authenticationService.authenticatedUserId]
        def skills = col.findOne(_QUERY, [skills: 1])?.skills
        println skills.dump()



        skills.each {
//            if(it.name == 'J2EE'){
            println it.dump()
            println ' '
            println ' '
//            }
            data << [
                    name: it.name,
                    self_score: it.self_score,
                    profiles: [
                            better: it.betterThanMe ?: EMPTY_ARRAY,
                            same: it.sameAsMe ?: EMPTY_ARRAY,
                            worst: it.worstThanMe ?: EMPTY_ARRAY
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
//                log.debug(params.value)
                col.update(_QUERY, [$pull: ['skills.$.betterThanMe': friendId]], false, false, WriteConcern.NONE)
                col.update(_QUERY, [$pull: ['skills.$.sameAsMe': friendId]], false, false, WriteConcern.NONE)
                col.update(_QUERY, [$addToSet: ['skills.$.worstThanMe': friendId]], false, false, WriteConcern.SAFE)
                break

            case 'same':
//                log.debug(params.value)
                col.update(_QUERY, [$pull: ['skills.$.betterThanMe': friendId]], false, false, WriteConcern.NONE)
                col.update(_QUERY, [$pull: ['skills.$.worstThanMe': friendId]], false, false, WriteConcern.NONE)
                col.update(_QUERY, [$addToSet: ['skills.$.sameAsMe': friendId]], false, false, WriteConcern.NONE)
                break

            case 'better':
//                log.debug(params.value)
                col.update(_QUERY, [$pull: ['skills.$.worstThanMe': friendId]], false, false, WriteConcern.NONE)
                col.update(_QUERY, [$pull: ['skills.$.sameAsMe': friendId]], false, false, WriteConcern.NONE)
                col.update(_QUERY, [$addToSet: ['skills.$.betterThanMe': friendId]], false, false, WriteConcern.NONE)
                break
            case 'delete':
//                log.debug(params.value)
                col.update(_QUERY, [$pull: ['skills.$.worstThanMe': friendId]], false, false, WriteConcern.NONE)
                col.update(_QUERY, [$pull: ['skills.$.sameAsMe': friendId]], false, false, WriteConcern.NONE)
                col.update(_QUERY, [$pull: ['skills.$.betterThanMe': friendId]], false, false, WriteConcern.NONE)
                break
            default:
                render(status: 404)
                return
        }

        def result = [result: 'success']
        render result as JSON
    }

    def ajaxSaveBasicInfo() {
        if (!authenticationService.loggedIn) {
            render status: 401
            return
        }

        def profile = [:]

        profile.first_name = params.first_name
        profile.birthDate = params.birthDate
        profile.last_name = params.last_name
        profile.middle_name = params.middle_name
        profile.gender = params.gender
        profile.aboutText = params.aboutText
        profile.'contactInfo.webSite' = params.webSite
        profile.'contactInfo.publicEmail' = params.publicEmail
        profile.'contactInfo.publicTel' = params.publicTel
        profileService.updateFields(authenticationService.authenticatedUserId, profile)

        def result = [result: 'success']
        render result as JSON
    }

    def profile() {
        cache("public_3600")

        session._responseCommitedExceptionWorkAround = 'force to create new session with very this assignment'
        def profile = fetchProfile()
        def skills = profile.skills.sort { it.percent ? -1 * it.percent : 0 } //sirket yetkilisinin izin verdigi skiller
        //skilleri 2 ayri DIV icinde gosteriyoruz
        def skills1, skills2
        if (skills.size() < 5) {
            skills1 = skills
            skills2 = null
        } else {
            int midIdx = Math.ceil(skills.size() / 2)
            skills1 = skills.subList(0, midIdx)

            skills2 = skills.subList(midIdx, skills.size())
        }
        def ADDRESS_PRIVACY_LEVELS = [
                COUNTRY: 100,
                CITY: 200,
                DISTRICT: 300,
                FULL_ADDRESS: 1000]

        def location = [
                //default hidden address
                privacyLevel: profile.contactInfo?.address.privacyLevel ?: 100, //todo
                display_address: ''
        ]
        //noinspection GroovyFallthrough
        switch (location.privacyLevel) {
            case ADDRESS_PRIVACY_LEVELS.FULL_ADDRESS:
                location.lat = profile.contactInfo?.address?.latLng?.lat
                location.lng = profile.contactInfo?.address?.latLng?.lng
            case ADDRESS_PRIVACY_LEVELS.DISTRICT:
                location.district = profile?.contactInfo?.address?.district
                location.display_address += (location.district) ? location.district + ', ' : ''
            case ADDRESS_PRIVACY_LEVELS.CITY:
                location.city = profile?.contactInfo?.address?.city
                location.display_address += (location.city) ? location.city + ', ' : ''
            case ADDRESS_PRIVACY_LEVELS.COUNTRY:
                location.country = profile?.contactInfo?.address?.country ?: 'Türkiye' //todo
                location.display_address += (location.country) ? location.country : ''
        }

        if (location.privacyLevel == ADDRESS_PRIVACY_LEVELS.FULL_ADDRESS)
            location.display_address = profile?.contactInfo?.address?.display_address


        [profile: profile, skills1: skills1, skills2: skills2, location: location]

    }
    /**
     * @Deprecated
     * @return
     */
    def getProfileById() {
        assert false
//        def result = [x:params.id]
//        sleep(1000)
        def id = ObjectId.massageToObjectId(params.id)
//        log.debug(id)
        def result = Profile.list()[random.nextInt(150)]//Profile.findById(id) ?: [:]

        render result as JSON
    }

    def getProfilesByIds() {
        def ids = []
        request.JSON.ids.each { ids << ObjectId.massageToObjectId(it) }
        def result = profileService.getProfilesByIds(ids).collect { removePrivateProfileData(it) }

        render result as JSON
    }


    def domainSettings() {
        def result = [:]
        def profile = authenticationService.authenticatedUser
        def domainId = profile.domainToPage

        switch (request.method) {
            case 'POST':
                println request.JSON
                if (domainId) {
                    //AA check todo do not use assert please
                    assert domainId == ObjectId.massageToObjectId(request.JSON.id ?: request.JSON._id)
                    println 'update www s'
                    result = domainService.update(request.JSON)
                } else {
                    println 'create www s'
                    result = domainService.createForProfile(profile, request.JSON)

                }
                break
            case 'GET':
                result = domainService.get(domainId) ?: new DomainToPage()
                break

        }


        render result as JSON
    }


    private fetchProfile() {
        def profile = Profile.findByUsername(params.id)
        if (!profile) {
            //id dene
            def id = ObjectId.massageToObjectId(params.id)
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
