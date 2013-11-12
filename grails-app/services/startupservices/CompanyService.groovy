package startupservices

import com.mongodb.DBCollection
import com.mongodb.WriteConcern
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
        col.find(_QUERY).each {
            result << it + mockExtraData
        }
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
        def _QUERY = [employees: employee]
        col.find(_QUERY).each { result << it }
        return result
    }


    def getCompany(ObjectId id) {
        DBCollection col = Company.collection
        def _QUERY = [_id: id]
        def result = col.findOne(_QUERY)
        result << mockExtraData

        return result
    }


    def findByPageName(def pageName) {
        if (!pageName) return null

        DBCollection col = Company.collection
        def _QUERY = [page_name: pageName]
        def result = col.findOne(_QUERY)
        result << mockExtraData

        return result
    }


    def addOfficePhoto(Picture picture, ObjectId companyId) {

        def pictureMap = [
                _id: picture.id,
                path: picture.path,
                bucket: picture.bucket,
                url: picture.url,
//                owner: picture.owner.id,
                broken: picture.broken,
                source: picture.source
        ]
        DBCollection col = Company.collection

        def _QUERY = [_id: companyId]
        def _OPS = [:]

        _OPS.'$addToSet' = ['officePictures': pictureMap]
        col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)

    }

    def deleteOfficePhoto(ObjectId pictureId, companyId) {

        DBCollection col = Company.collection


        def _QUERY = [
                _id: companyId,
                'officePictures._id': pictureId
        ]

        def _OPS = [:]

        _OPS.'$pull' = ['officePictures': ['_id': pictureId]]
        col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)

    }


    private mockExtraData = [
            name: [
                    oneWord: 'Fikrimuhal',
                    significantPart: 'Fikrimuhal Teknoloji', // first letter capital
                    legalType: 'LTD. STİ.',
                    pageName: 'fikrimuhal',
                    fullLegal: 'Fikrimuhal Teknoloji Ar. Ge. LTD. STİ',
            ],
            founded: '1/4/2013',
            totalInvesment: [
                    value: 150000,
                    currency: 'TL'
            ],
            employeeStats: [
                    numberOfTotal: 3,
                    numberOfTechnical: 2,
                    numberOfManagment: 2
            ]/*,
            products: [
                    [
                            title: 'Kimlik IO',
                            about: '',
                            url: '',
                            _id: new ObjectId('527c1171ef86ec0cec62b096')

                    ],
                    [
                            title: 'Sental',
                            about: 'Sental sosyal medya cözümleme',
                            url: 'http://www.sental.com',
                            _id: new ObjectId('527c1171ef86ec0cec62b097')

                    ]
            ]*/
    ]

    def saveProduct(def product, ObjectId companyId) {
        log.debug(product)
        def documentMap = [
                _id: ObjectId.massageToObjectId(product._id) ?: new ObjectId(),
                about: product.about,
                title: product.title,
                isPublic: product.isPublic,
                url: product.url,
        ]
        DBCollection col = Company.collection

        def _QUERY = [_id: companyId]
        if (product._id) _QUERY.'products._id' = ObjectId.massageToObjectId(product._id)

        def _OPS = [:]

        if (!product._id) _OPS.'$addToSet' = ['products': documentMap]
        else _OPS.'$set' = ['products.$': documentMap]

        log.debug col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)

    }

    def deleteProduct(ObjectId productId, companyId) {
         log.debug productId
         log.debug companyId
        DBCollection col = Company.collection


        def _QUERY = [
                _id: companyId,
                'products._id': productId
        ]

        def _OPS = [:]

        _OPS.'$pull' = ['products': ['_id': productId]]
        log.debug col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)
    }
}
