package startupservices

import grails.converters.JSON
import org.bson.types.ObjectId

class AdminController {
    def profileService
    def companyService
    def authenticationService

    def allProfiles(int currentPage, int itemsPerPage, String filterBy) {
        cache("private_nostore")

        if (isAdmin()) {
            def result = profileService.list(filterBy: filterBy, page: currentPage, itemPerPage: itemsPerPage)
            render(result as JSON)

        } else {
            render status: 401

        }
    }

    def allCompanies(int currentPage, int itemsPerPage, String filterBy) {
        cache("private_nostore")

        if (isAdmin()) {
            def result = companyService.list(filterBy: filterBy, page: currentPage, itemPerPage: itemsPerPage)
            render(result as JSON)

        } else {
            render status: 401

        }
    }


    private isAdmin() {
        boolean userIsIlgazSumnulu = authenticationService.authenticatedUser?.accounts?.facebook?.remoteId == "100003812445224"
        return userIsIlgazSumnulu
    }
}
