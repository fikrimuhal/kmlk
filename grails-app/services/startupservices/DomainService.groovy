package startupservices

import com.mongodb.DBCollection
import org.bson.types.ObjectId

class DomainService {
    def companyService
    def profileService

    def domain2Page(String domain) {
        DBCollection col = DomainToPage.collection
        def _QUERY = [domains: domain]
        return col.findOne(_QUERY)
    }


    def update(def obj) {
        def existing = DomainToPage.get(obj.id ?: obj._id)
        assert existing

//        existing.isCompany = obj.isCompany
//        existing.isProfile = obj.isProfile
        existing.enabled = obj.enabled
//        existing.pageName = obj.pageName
        existing.domains = obj.domains

        existing.save(failOnError: true, flush: true)
        return existing
    }

    def createForCompany(def company, def obj) {
        def existing = new DomainToPage()

        assert company?.name?.pageName
        assert company._id

        existing.isCompany = true
        existing.isProfile = false
        existing.enabled = obj.enabled

        existing.pageName = company.name.pageName
        existing.domains = obj.domains

        existing = existing.save(failOnError: true, flush: true)

        assert existing.id

        companyService.updateFields(company._id, [domainToPage: existing.id])
        return existing
    }

    def createForProfile(def profile, def obj) {
        def existing = new DomainToPage()

        assert profile?.username
        assert profile._id instanceof ObjectId

        existing.isCompany = false
        existing.isProfile = true
        existing.enabled = obj.enabled

        existing.pageName = profile.username
        existing.domains = obj.domains

        existing = existing.save(failOnError: true, flush: true)

        assert existing.id

        profileService.updateFields(profile._id, [domainToPage: existing.id])
        return existing
    }

    def get(def id) {
        DomainToPage.get(ObjectId.massageToObjectId(id))
    }
}
