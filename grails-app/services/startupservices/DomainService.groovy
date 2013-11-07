package startupservices

import com.mongodb.DBCollection
import org.bson.types.ObjectId

class DomainService {

    def domain2Page(String domain) {
        DBCollection col = DomainToPage.collection
        def _QUERY = [domains: domain]
        return col.findOne(_QUERY)
    }


    def update(def obj) {
        def existing = DomainToPage.get(obj.id || obj._id)
        assert existing

        existing.isCompany = obj.isCompany
        existing.isProfile = obj.isProfile
        existing.enabled = obj.enabled
        existing.pageName = obj.pageName
        existing.domains = obj.domains

        existing.save(failOnError: true, flush: true)
    }

    def get(def id){
        DomainToPage.get(ObjectId.massageToObjectId(id))
    }
}
