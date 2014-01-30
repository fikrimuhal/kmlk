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
        cache("public_5")

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
        cache("private_nostore")

        ObjectId loggedInUser = ObjectId.massageToObjectId(authenticationService.authenticatedUserId)
        if (!loggedInUser) {
            render status: 401
            return
        }

        def result = companyService.listByOwner(loggedInUser)

        render result as JSON
    }


    def listRequests() {
        ObjectId companyId = ObjectId.massageToObjectId(authenticationService.authenticatedUserId)
    }


    def domainSettings() {
        cache("private_nostore")

        //todo get de show
        //todo post da save/update
        //todo AA
        def result
        ObjectId companyId = ObjectId.massageToObjectId(params.companyId)
        def company = companyService.getCompany(companyId)
        def domainId = company.domainToPage

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
                    result = domainService.createForCompany(company, request.JSON)

                }
                break


            case 'GET':



                result = domainService.get(domainId) ?: new DomainToPage()

                break

        }


        render result as JSON
    }

    def products() {
        cache("private_nostore")

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
        cache("private_nostore")

        def result = [status: companyService.updateLocation(request.JSON, ObjectId.massageToObjectId(params.companyId))]
        render result as JSON
    }

    def skillUpdate() {
        cache("private_nostore")

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
        cache("private_nostore")

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
        cache("private_nostore")

        def result
        if (!authenticationService.loggedIn) {
            render status: 401
            return
        }

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
                assert toId, 'No to ID'
                assert fromId, 'No from id'
                //todo employeeRequest kaydi olustur
                //todo kullaniciya notification yolla, eger daha once kayit yok ise

                companyService.newEmploymentRequests(fromId, toId, requestedByCompany)

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

    def employeeDelete() {
        cache("private_nostore")

        def result
        if (!authenticationService.loggedIn) {
            render status: 401
            return
        }
        log.debug("Employee : ${request.method}")
        log.debug("Employee : ${request.JSON.companyId}")
        switch (request.method) {

            case 'POST':

                ObjectId companyId = ObjectId.massageToObjectId(request.JSON.companyId)
                ObjectId employeeId = ObjectId.massageToObjectId(request.JSON.employeeId)
                assert companyId
                assert employeeId
                companyService.deleteEmployee(companyId, employeeId, authenticationService.authenticatedUserId)
                result = [status: 'success']
                break

            default:
                result = [status: 'error']

        }
        render result as JSON
    }


    def saveBasicInfo() {
        cache("private_nostore")

        if (!authenticationService.loggedIn) {
            render status: 401
            return
        }

        ObjectId companyId = ObjectId.massageToObjectId(params.companyId)

        def data = [:]

        data.'name.fullLegal' = request.JSON.name.fullLegal
        data.'name.legalType' = request.JSON.name.legalType
//        data.'name.oneWord' = 'Fikrimuhal'
//        data.'name.pageName' = request.JSON.name.pageName
        data.'name.significantPart' = request.JSON.name.significantPart
        data.'tags' = request.JSON.tags

        data.email = request.JSON.email
        data.www = request.JSON.www
        data.tel = request.JSON.tel
        data.founded = request.JSON.founded

        companyService.updateFields(companyId, data)

        def result = [result: 'success']
        render result as JSON
    }


    def isPageNameAvailable() {

        Boolean pageNameValid = companyService.isPageNameValid(params.pageName)
        log.debug(params.pageName)

        def data = [
                available: pageNameValid,
                username: params.username
        ]
        if(pageNameValid){
            cache("private_nostore")
        } else{
            /**
             * bu cachlene bilinir; buyuk ihtimalle hep invalid olarak kalacak cunku
             */
            cache("public_1day")
        }
        render(data as JSON)
    }


    def createNewCompany() {
        cache("private_nostore")

        if (!authenticationService.loggedIn) {
            render status: 401
            return
        }

        if (!companyService.isPageNameValid(request.JSON.name.pageName as String)) {
            render status: 404 //todo uygun status code lutfen
            return
        }
        log.debug(request.JSON)
        println '__+===____'
        def data = [:]
        data.'name.fullLegal' = request.JSON.name.fullLegal
        data.'name.legalType' = request.JSON.name.legalType
//        data.'name.oneWord' = request.JSON.name.pageName
        data.'name.pageName' = request.JSON.name.pageName.toLowerCase()
        data.'name.significantPart' = request.JSON.name.significantPart
        data.owner = authenticationService.authenticatedUserId

        companyService.createNewCompany(data)

        def result = [result: 'success', pageName: data.'name.pageName']
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










































