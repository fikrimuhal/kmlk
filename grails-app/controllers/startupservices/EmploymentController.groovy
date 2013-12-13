package startupservices

import com.mongodb.DBCollection
import com.mongodb.WriteConcern
import grails.converters.JSON
import kimlik.account.SocialMeta
import kimlik.account.history.HistoryEntity
import org.bson.types.ObjectId

import java.text.DateFormat

class EmploymentController {
    def profileService
    def authenticationService
    /**
     * @deprecated
     * @return
     */
    def addNew() {
        def p = fetchProfile()
        Date startDate
        Date endDate
        if (params.startDate) {
            long s = Long.parseLong(params.startDate)
            startDate = new Date(s)
        }
        if (params.endDate) {
            long s = Long.parseLong(params.endDate)
            endDate = new Date(s)
        }
        println startDate
        println endDate
        def w = new HistoryEntity(
                entity: params.entity,
                position: params.position,
                note: params.note,
                socialMeta: new SocialMeta(source: 'kimlik', editedByUser: true, upstreamFetchDate: new Date()),
                startDate: startDate,
                endDate: new Date()//endDate
        )
        p.workHistory.history.add(w)
//        p.save()
        def r = [result: 'success']
        render r as JSON
    }


    def save() {

        ObjectId profileId = authenticationService.authenticatedUserId
        log.debug(request.JSON)

        switch (request.method) {
            case 'POST':
                saveEntity(request.JSON, profileId)
                break

            case 'DELETE':
                log.debug(params.entityId)
                ObjectId entityId = ObjectId.massageToObjectId(params.entityId)
                deleteEntity(entityId, params.typeKey, profileId)
                break

        }
        def result = [:]
        render result as JSON
    }

    private saveEntity(def data, ObjectId profileId) {
        def entity = data.data
        def fieldToUpdate
        if (data.typeKey == 'work') {
            fieldToUpdate = 'workHistory.history'
        } else if (data.typeKey == 'education') {
            fieldToUpdate = 'educationHistory.history'
        } else {
            return
        }

        def documentMap = [
                _id: ObjectId.massageToObjectId(entity._id) ?: new ObjectId(),
                entity: entity.entity,
                position: entity.position ?: '',
                note: entity.note ?: '',
                socialMeta: [source: entity.socialMeta?.source ?: 'user', editedByUser: true, upstreamFetchDate: new Date()],
                startDate: entity.startDate ?: new Date(),
                endDate: new Date()//endDate
        ]


        DBCollection col = Profile.collection

        def _QUERY = [_id: profileId]

        if (entity._id) _QUERY.(fieldToUpdate + '._id') = ObjectId.massageToObjectId(entity._id)

        def _OPS = [:]

        if (!entity._id) _OPS.'$addToSet' = [(fieldToUpdate): documentMap]
        //todo update op socialMeta datayi kullanicidan alip degistirmemesi lazim
        //todo update op da entity turu degistirilemiyor olmasi lazim
        else _OPS.'$set' = [(fieldToUpdate + '.$'): documentMap]
        println _OPS
        col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)

    }

    private deleteEntity(ObjectId entityId, String typeKey, ObjectId profileId) {
        def fieldToUpdate
        if (typeKey == 'work') {
            fieldToUpdate = 'workHistory.history'
        } else if (typeKey == 'education') {
            fieldToUpdate = 'educationHistory.history'
        } else {
            return
        }
        DBCollection col = Profile.collection

        def _QUERY = [
                _id: profileId,
                (fieldToUpdate + '._id'): entityId
        ]

        def _OPS = [:]

        _OPS.'$pull' = [(fieldToUpdate): ['_id': entityId]]
        println _OPS
        println _QUERY
        log.debug col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)

    }

    def list() {
        def data = fetchProfile().workHistory.history
        JSON.use('deep')

//        JSON.registerObjectMarshaller(Date) { return [year: it?.year + 1900, month: it?.month, day: it?.day] }
//        JSON.registerObjectMarshaller(Date) { return it.getTime() }

        render(data as JSON)

    }
    /**
     * @deprecated
     * @return
     */
    private fetchProfile() {
        def profile = Profile.findByUsername(params.username)
        return profile
    }
}
