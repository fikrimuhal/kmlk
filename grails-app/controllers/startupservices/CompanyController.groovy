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

        //skilleri 2 ayri DIV icinde gosteriyoruz
        def skills1, skills2
        if (skills.size() < 5) {
            skills1 = skills
            skills2 = null
        } else {
            int midIdx =  Math.ceil(skills.size() / 2)
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


    def skills = [

            [name: 'Java',
                    percent: 65,
                    numberOfPeopleHave: 2,
                    cssClass: 'bg-primary'],
            [name: 'HTML',
                    percent: 80,
                    numberOfPeopleHave: 2,
                    cssClass: 'bg-success'],
            [name: 'jQuery',
                    percent: 35,
                    numberOfPeopleHave: 2,
                    cssClass: 'bg-info'],
            [name: 'PHP',
                    percent: 85,
                    numberOfPeopleHave: 2,
                    cssClass: 'bg-warning'],
            [name: 'WP',
                    percent: 95,
                    numberOfPeopleHave: 2,
                    cssClass: 'bg-danger'],
            [name: 'SEO',
                    percent: 45,
                    numberOfPeopleHave: 2,
                    cssClass: 'bg-primary'],
            [name: 'Proje Yönetimi',
                    percent: 85,
                    numberOfPeopleHave: 2,
                    cssClass: 'bg-default'],
            [name: 'Groovy',
                    percent: 75,
                    numberOfPeopleHave: 2,
                    cssClass: 'bg-success'],
            [name: 'Grails',
                    percent: 85,
                    numberOfPeopleHave: 2,
                    cssClass: 'bg-success'],
            [name: 'UX Design',
                    percent: 35,
                    numberOfPeopleHave: 2,
                    cssClass: 'bg-success'],
            [name: 'Amazon Web Services',
                    percent: 75,
                    numberOfPeopleHave: 2,
                    cssClass: 'bg-info'],
            [name: 'Startup Managment',
                    percent: 65,
                    numberOfPeopleHave: 2,
                    cssClass: 'bg-warning'],
            [name: 'Git',
                    percent: 63,
                    numberOfPeopleHave: 2,
                    cssClass: 'bg-primary'],
            [name: 'AngularJs',
                    percent: 91,
                    numberOfPeopleHave: 2,
                    cssClass: 'bg-danger'],
    ]
}
