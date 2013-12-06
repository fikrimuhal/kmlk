package startupservices

import com.mongodb.DBRef
import grails.converters.JSON
import org.bson.types.ObjectId

class CompanyController {
    def authenticationService
    def companyService
    def domainService
    def profileService

    /**
     * todo cache able
     * @return
     */
    def profile() {
        cache("public_3600")

        boolean isCrawler = params.containsKey('_escaped_fragment_')

        def company = companyService.findByPageName(params.id)

        if (!company) return (redirect(uri: '/'))

/*****************************************skill************************************************/
        def skills = company.skills?.findAll { it.visible }?.sort { it.order }
        //sirket yetkilisinin izin verdigi skiller
        //skilleri 2 ayri DIV icinde gosteriyoruz
        def skills1, skills2
        if (skills) {

            if (skills.size() < 5) {
                skills1 = skills
                skills2 = null
            } else {
                int midIdx = Math.ceil(skills.size() / 2)
                skills1 = skills.subList(0, midIdx)

                skills2 = skills.subList(midIdx, skills.size())
            }
        }
/*****************************************skill************************************************/

/**************************************timeline************************************************/
        def timeline = company.timeline.findAll { it.visible }
        timeline.each {
            it.type = getTimelineType(it.typeKey)
        }
/**************************************timeline************************************************/

/**************************************employees************************************************/
        def employeeIds = []
        company.employees.each { employeeIds << ObjectId.massageToObjectId(it.toString()) }

        def employees = profileService.getProfilesByIds(employeeIds)

/**************************************employees************************************************/




        [/*model*/
                company: company,
                isCrawler: isCrawler,
                skills1: skills1, skills2: skills2,
                timeline: timeline,
                employees: employees
        ]
    }

//REST - API

    def userCompanyList() {

        ObjectId loggedInUser = ObjectId.massageToObjectId(authenticationService.authenticatedUserId)
        if (!loggedInUser) {
            render status: 401
            return
        }

        def result = companyService.listByOwner(loggedInUser)

        render result as JSON
    }

    def addEmployee() {}

    def removeEmployee() {}

    def listRequests() {
        ObjectId companyId = ObjectId.massageToObjectId(authenticationService.authenticatedUserId)
    }


    def domainSettings() {
        //todo get de show
        //todo post da save/update
        //todo AA
        log.debug(params.companyId)
        ObjectId companyId = ObjectId.massageToObjectId(params.companyId)
        def company = companyService.getCompany(companyId)
        def domainId = company.domainToPage
        def result = domainService.get(domainId)

        render result as JSON
    }

    def products() {
        //todo AA

        switch (request.method) {
            case 'POST':
                companyService.saveProduct(request.JSON, ObjectId.massageToObjectId(params.companyId))
                break

            case 'DELETE':
                log.debug(request.JSON)
                companyService.deleteProduct(ObjectId.massageToObjectId(params.productId), ObjectId.massageToObjectId(params.companyId))
                break

            case 'GET':
                break

        }
        def result = [:]
        render result as JSON

    }

    def updateLocation() {
        def result = [status: companyService.updateLocation(request.JSON, ObjectId.massageToObjectId(params.companyId))]
        render result as JSON
    }

    def skillUpdate() {
        ObjectId companyId = ObjectId.massageToObjectId(params.companyId)
        log.debug(request.JSON)
        log.debug(params)  //operation

        switch (request.JSON.op) {
            case 'RECALCULATE':
                log.debug('recalculate')
                companyService.calculateCompanySkills(companyId)
                break

            case 'ORDER':
                log.debug('order change')
                int newValue = request.JSON.order as int
                ObjectId skillId = ObjectId.massageToObjectId(request.JSON.skillId)
                companyService.updateSkillField(companyId, 'ORDER', skillId, newValue)
                break

            case 'VISIBILITY':
                log.debug('change visibility')
                boolean newValue = request.JSON.visible as boolean
                ObjectId skillId = ObjectId.massageToObjectId(request.JSON.skillId)
                companyService.updateSkillField(companyId, 'VISIBILITY', skillId, newValue)

                break

        }

        def result = [:]//[status: companyService.updateLocation(null, companyId)]
        render result as JSON
    }


    def timeline() {
        //todo AA

        ObjectId companyId = ObjectId.massageToObjectId(params.companyId)
        log.debug(companyId)
        log.debug(request.JSON)
        log.debug(params.entityId)
        switch (request.method) {
            case 'POST':
                companyService.saveTimeline(request.JSON, companyId)
                break

            case 'DELETE':
                ObjectId entityId = ObjectId.massageToObjectId(params.entityId)
                companyService.deleteTimeline(entityId, companyId)
                break

            case 'GET':
                break

        }
        def result = [:]
        render result as JSON

    }

    def employeeRequest() {
        def result

        log.debug("Employee request: ${request.method}")
        switch (request.method) {
            case 'POST':
                //verify
                log.debug('verify')
                log.debug(request.JSON.requestId)
                result = [status: 'success']
                break

            case 'PUT':
                //verify
                log.debug('new employment request');
                ObjectId toId = ObjectId.massageToObjectId(request.JSON.toId)
                ObjectId fromId = ObjectId.massageToObjectId(request.JSON.fromId)
                boolean requestedByCompany = request.JSON.requestedByCompany as boolean

                //todo employeeRequest kaydi olustur
                //todo kullaniciya notification yolla, eger daha once kayit yok ise

                companyService.newEmploymentRequests(fromId,toId,requestedByCompany)

                result = [status: 'success']
                break

            case 'DELETE':

                ObjectId requestId = ObjectId.massageToObjectId(params.requestId)
                companyService.deleteEmploymentRequests(requestId)
                result = [status: 'success']
                break

            case 'GET':
                ObjectId companyId = ObjectId.massageToObjectId(params.companyId)

                result = companyService.getEmploymentRequests(companyId)
                break

            default:
                result = [status: 'error']

        }
        render result as JSON
    }


    def TYPES = [
            project: [key: 'project', friendly: 'Proje', color: 'bg-warning', icon: 'fa-bookmark-o'],
            news: [key: 'news', friendly: 'Haber', color: '', icon: 'fa-calendar'],
            office: [key: 'office', friendly: 'Ofis değişikliği', color: 'bg-warning', icon: 'fa-building-o'],
            finance: [key: 'finance', friendly: 'Sermaye', color: 'bg-info', icon: 'fa-dollar'],
            inception: [key: 'inception', friendly: 'Kuruluş', color: '', icon: 'fa-home'],
            other: [key: 'other', friendly: 'Diğer', color: '', icon: 'fa-square-o']
    ]

    private getTimelineType(String type) {

        return TYPES[type] ?: [:]
    }

}










































