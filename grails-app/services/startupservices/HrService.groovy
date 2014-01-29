package startupservices

import com.mongodb.DBCollection
import com.mongodb.DBObject
import hr.Applicant
import org.bson.types.ObjectId

class HrService {

    def listApplicantsForCompany(ObjectId companyId) {
        DBCollection col = Applicant.collection
        def _QUERY = [company: companyId]
        return col.find(_QUERY).toArray()
    }

    def applyForCompany(ObjectId companyId, ObjectId profileId, String note) {
        DBCollection col = Applicant.collection
//        def _QUERY = [domains: domain]
//        def document = [company: companyId,
//                profile: profileId,
//                applyDate: new Date(),
//                userNote: note]

//        def result = col.save(document)

        def _QUERY = [company: companyId, profile: profileId]
        def _OPS = [:]

        _OPS.'$set' = [company: companyId, profile: profileId, applyDate: new Date(), userNote: note]
        //noinspection GroovyAssignabilityCheck
        return col.update(_QUERY, _OPS, true, false)

    }


    def mock = [
            [id: '52684f4def861e456dac75b1',
                    company: 2222222233,
                    fullName: 'Ilgaz Şumnulu'],
            [id: '52684f4def861e456dac75b2',
                    company: 2222222233,
                    fullName: 'Ahmet mehmet'],
            [id: '52684f4def861e456dac75b3',
                    company: 2222222233,
                    fullName: 'Abuzer kadayif'],
            [id: '52684f4def861e456dac75b4',
                    company: 2222222233,
                    fullName: 'Mark otaa'],
            [id: '52684f4def861e456dac75b5',
                    company: 2222222233,
                    fullName: 'Abdullah Guneydas'],
            [id: '52684f4def861e456dac75b6',
                    company: 2222222233,
                    fullName: 'Yeter dursun Kadayif'],
            [id: '52684f4def861e456dac75b7',
                    company: 2222222233,
                    fullName: 'Coskun kilic'],
            [id: '52684f4def861e456dac75b8',
                    company: 2222222233,
                    fullName: 'Bende varum'],
            [id: '52684f4def861e456dac75b9',
                    company: 2222222233,
                    fullName: 'Mac hintosh'],
            [id: '52634f4def861e456dac75b9',
                    company: 2222222233,
                    fullName: 'Kedi kopek']
    ]
}
