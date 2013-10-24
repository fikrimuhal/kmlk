package startupservices

import grails.converters.JSON
import org.bson.types.ObjectId

class CompanyController {
    def authenticationService
    def companyService

    def index() {}

    def userCompanyList() {
        ObjectId loggedInUser = ObjectId.massageToObjectId(authenticationService.authenticatedUserId)
        assert loggedInUser

        def result = companyService.listByOwner(loggedInUser)

        render result as JSON
    }

    def addEmployee(){}
    def removeEmployee(){}
    def listRequests(){
        ObjectId companyId = ObjectId.massageToObjectId(authenticationService.authenticatedUserId)

    }
}
