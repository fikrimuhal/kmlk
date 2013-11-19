package startupservices

import grails.converters.JSON
import org.bson.types.ObjectId

class CompanyController {
    def authenticationService
    def companyService
    def domainService

    /**
     * todo cache able
     * @return
     */
    def index() {/* Client side render*/ }

    /**
     * todo cache able
     * @return
     */
    def profile() {
        cache("public_3600")

        boolean isCrawler = params.containsKey('_escaped_fragment_')

        def company = companyService.findByPageName(params.id)

        if (!company) return (redirect(uri: '/'))

        def skills = company.skills?.findAll { it.visible } //sirket yetkilisinin izin verdigi skiller
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
        [company: company, isCrawler: isCrawler, skills1: skills1, skills2: skills2]
    }

//REST - API

    def userCompanyList() {

        ObjectId loggedInUser = ObjectId.massageToObjectId(authenticationService.authenticatedUserId)
        assert loggedInUser

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
                companyService.calculateCompanySkills(ObjectId.massageToObjectId(params.companyId))
                break

            case 'ORDER':
                log.debug('order change')
                break

            case 'VISIBILITY':
                log.debug('change visibility')
                break

        }

        def result = [:]//[status: companyService.updateLocation(null, companyId)]
        render result as JSON
    }


}








































