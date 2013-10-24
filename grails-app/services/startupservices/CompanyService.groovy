package startupservices

import com.mongodb.DBCollection
import kimlik.company.Company
import org.bson.types.ObjectId

class CompanyService {

    def list() {
        Company.list()
    }

    def listByOwner(ObjectId owner) {
        def result = []
        DBCollection col = Company.collection
        def _QUERY = [owner: owner]
        col.find(_QUERY).each { result << it }
        return result
    }

    /**
     * TODO Index eklemeyi unutma
     * @param employee
     * @return
     */
    def listByEmployee(ObjectId employee) {
        def result = []
        DBCollection col = Company.collection
        def _QUERY = [employees:  employee]
        col.find(_QUERY).each { result << it }
        return result
    }


    def getCompany(ObjectId id) {
        DBCollection col = Company.collection
        def _QUERY = [_id:  id]
        return col.findOne(_QUERY)
    }


    private fikrimuhal = [
            _id: new ObjectId(),
            short_name: 'Fikrimuhal',
            page_name: 'fikrimuhal',
            full_name: 'Fikrimuhal Teknoloji Ar. Ge. LTD. ŞTİ.',
            employees: [
                    new ObjectId(),
                    new ObjectId(),
                    new ObjectId(),
                    new ObjectId(),
                    new ObjectId()
            ],
            location: [
                    country: 'Turkey',
                    city: 'İstanbul',
                    district: 'Çekmeköy',
                    address: 'zind ismerkezi no:5/5',
                    zip: 06530,
                    latitude: 1.321323,
                    longitude: 12.321432432,
                    zooomLevel: 12,
            ],
            bio: 'company bio blahh',
            skills: [
                    new ObjectId(),
                    new ObjectId(),
                    new ObjectId(),
                    new ObjectId(),
                    new ObjectId()
            ],
            industry: 'Yazılım',
            tags: ['Internet', ' Startuplar', ' İnsankaynakları', ' Sosyal networkler', ' SAS'],
            email: 'info@fikrimuhal.com',
            tel: '543646363565634',
            www: 'http://www.dddd.com',
            linkedin: [
                    _id: 12331232,
                    profileUrl: 'http://dsadsads.com'
            ],
            facebook: [
                    _id: 324324324,
                    profileUrl: 'http://dsadsads.com'
            ],
            twitter: [
                    _id: 324324324,
                    profileUrl: 'http://dsadsads.com'
            ],
            foursquare: [
                    _id: 324324324,
                    profileUrl: 'http://dsadsads.com'
            ],
            perks: []


    ]

}
