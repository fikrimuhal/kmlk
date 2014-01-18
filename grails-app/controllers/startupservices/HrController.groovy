package startupservices

import com.mongodb.DBCollection
import grails.converters.JSON
import hr.Applicant
import org.bson.types.ObjectId

class HrController {
    def hrService
    def authenticationService

    def listApplicantsForCompany() {
        println params.companyId
        ObjectId companyId = ObjectId.massageToObjectId(params.companyId)

        def result = hrService.listApplicantsForCompany(companyId)

        render result as JSON
    }

    def apply() {
        ObjectId companyId = ObjectId.massageToObjectId(request.JSON.companyId)
        ObjectId loggedInUserId = authenticationService.authenticatedUserId
        String userNote = request.JSON.userNote

        hrService.applyForCompany(companyId, loggedInUserId, userNote)

        def result = [:]
        render result as JSON
    }
}
