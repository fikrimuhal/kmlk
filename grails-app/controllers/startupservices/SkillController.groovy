package startupservices

import com.mongodb.DBCollection
import com.mongodb.WriteConcern
import grails.converters.JSON
import org.bson.types.ObjectId

class SkillController {
    def skillService
    def profileService
    def authenticationService

    def getAll() {
        cache("public_10")

        def data = []
        def skills = skillService.list()
        skills.each {
            data << [
                    id: it.id,
                    name: it.name,
                    numberOfUsersHas: it.numberOfUsersHas
            ]
        }
        render data as JSON
    }

    /**
     * @return
     */
    def addSkill() {
        cache("private_nostore")

        assert authenticationService.loggedIn
        def currentUsersId = authenticationService.authenticatedUserId

        String skillName = params.skillName

        profileService.addSkill(currentUsersId, skillName)

        def data = [result: 'success']
        render data as JSON
    }

    def removeSkill() {
        cache("private_nostore")

        assert authenticationService.loggedIn
        def currentUsersId = authenticationService.authenticatedUserId
        String skillName = params.skillName

        profileService.removeSkill(currentUsersId, skillName)

        def data = [result: 'success']
        render data as JSON
    }


}
