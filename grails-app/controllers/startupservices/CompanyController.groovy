package startupservices

import grails.converters.JSON
import org.bson.types.ObjectId

class CompanyController {
    def authenticationService
    def companyService

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

        def company = companyService.findByPageName(params.id)

        if (!company) return (redirect(uri: '/'))

        log.debug company
        def mockCompany = [
                name: [
                        oneWord: 'Fikrimuhal',
                        significantPart: 'Fikrimuhal Teknoloji', // first letter capital
                        legalType: 'LTD. STİ.',
                        pageName: 'fikrimuhal',
                        fullLegal: 'Fikrimuhal Teknoloji Ar. Ge. LTD. STİ',
                ],
                founded: '1/4/2013',
                industry: 'Yazılım',
                totalInvesment: [
                        value: 150000,
                        currency: 'TL'
                ],
                tags: ['Internet', 'Startuplar', 'İnsan kaynakları', 'Sosyal networkler', 'Networkler SAS'],
                employees: [
                        numberOfTotal: 3,
                        numberOfTechnical: 2,
                        numberOfManagment: 2
                ]

        ]
        [company: mockCompany]
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
}
