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
            founded: '1/4/2013',
            totalInvesment: [
                    value: 150000,
                    currency: 'TL'
            ],
            employeeStats: [
                    numberOfTotal: 3,
                    numberOfTechnical: 2,
                    numberOfManagment: 2
            ],
            skills: [

                    [name: 'Java',
                            percent: 65,
                            skill:new ObjectId(),
                            cssClass: 'bg-primary'],
                    [name: 'HTML',
                            percent: 80,
                            skill:new ObjectId(),
                            cssClass: 'bg-success'],
                    [name: 'jQuery',
                            percent: 35,
                            skill:new ObjectId(),
                            cssClass: 'bg-info'],
                    [name: 'PHP',
                            percent: 85,
                            skill:new ObjectId(),
                            cssClass: 'bg-warning'],
                    [name: 'WP',
                            percent: 95,
                            skill:new ObjectId(),
                            cssClass: 'bg-danger'],
                    [name: 'SEO',
                            percent: 45,
                            skill:new ObjectId(),
                            cssClass: 'bg-primary'],
                    [name: 'Proje Yönetimi',
                            percent: 85,
                            skill:new ObjectId(),
                            cssClass: 'bg-default'],
                    [name: 'Groovy',
                            percent: 75,
                            skill:new ObjectId(),
                            cssClass: 'bg-success'],
                    [name: 'Grails',
                            percent: 85,
                            skill:new ObjectId(),
                            cssClass: 'bg-success'],
                    [name: 'UX Design',
                            percent: 35,
                            skill:new ObjectId(),
                            cssClass: 'bg-success'],
                    [name: 'Amazon Web Services',
                            percent: 75,
                            skill:new ObjectId(),
                            cssClass: 'bg-info'],
                    [name: 'Startup Management',
                            percent: 65,
                            skill:new ObjectId(),
                            cssClass: 'bg-warning'],
                    [name: 'Git',
                            percent: 63,
                            skill:new ObjectId(),
                            cssClass: 'bg-primary'],
                    [name: 'AngularJs',
                            percent: 91,
                            skill:new ObjectId(),
                            cssClass: 'bg-danger'],

            ].each {

                def rand = new java.util.Random()
                it.contributors = []
                (rand.nextInt(5)+1).times{o -> it.contributors << new ObjectId()}
                it.order = rand.nextInt(100)
                it.visibility = rand.nextBoolean()
            }
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


    def updateLocation(def location, ObjectId companyId) {
        log.debug(location)

        def documentMap = [
                country: location.country,
                city: location.city,
                district: location.district,
                quarter: location.quarter,
                avenue: location.avenue,
                street: location.street,
                display_address: location.display_address,
                latLng: [
                        lat: location.latLng?.lat,
                        lng: location.latLng?.lng,
                        zoomLevel: location.latLng?.zoomLevel
                ]
        ]
        DBCollection col = Company.collection

        def _QUERY = [_id: companyId]

        def _OPS = [:]

        _OPS.'$set' = ['location': documentMap]

        return col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)

    }

}
