package startupservices

import grails.converters.JSON
import kimlik.account.SocialMeta
import kimlik.account.history.HistoryEntity
import org.bson.types.ObjectId

import java.text.DateFormat

class EmploymentController {
    def profileService
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
        p.save()
        def r = [result: 'success']
        render r as JSON
    }

    def remove() {
        log.debug(params)
    }

    def edit() {
        log.debug(params)
    }

    def list() {
        def data = fetchProfile().workHistory.history
        data.each {
            println it.endDate?.getYear()
        }
        JSON.registerObjectMarshaller(ObjectId) { return it.toStringMongod() }
        JSON.registerObjectMarshaller(Date) { return [year: it?.year+1900, month: it?.month, day: it?.day] }

        JSON.use('deep')
        render(data as JSON)

    }

    private fetchProfile() {
        def profile = Profile.findByUsername(params.username)
        return profile
    }
}
