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
        boolean isCrawler = params.containsKey('_escaped_fragment_')

        def company = companyService.findByPageName(params.id)

        if (!company) return (redirect(uri: '/'))


        [company: company, isCrawler: isCrawler]
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
}
