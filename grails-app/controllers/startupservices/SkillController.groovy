package startupservices

import com.mongodb.DBCollection
import com.mongodb.WriteConcern
import grails.converters.JSON
import org.bson.types.ObjectId

class SkillController {
    def skillService
    def profileService

    def getAll() {
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
     * @required session.loggedinProfileId != null
     * @return
     */
    def addSkill() {
        assert session.loggedinProfileId
        def currentUsersId = ObjectId.massageToObjectId(session.loggedinProfileId)

        String skillName = params.skillName

        profileService.addSkill(currentUsersId, skillName)

        def data = [result: 'success']
        render data as JSON
    }

    def removeSkill() {
        assert session.loggedinProfileId
        def currentUsersId = ObjectId.massageToObjectId(session.loggedinProfileId)
        String skillName = params.skillName

        profileService.removeSkill(currentUsersId, skillName)

        def data = [result: 'success']
        render data as JSON
    }


}
