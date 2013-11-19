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
            ]
//            ,
//            skills: [
//
//                    [name: 'Java',
//                            percent: 65,
//                            skill: new ObjectId(),
//                            cssClass: 'bg-primary'],
//                    [name: 'HTML',
//                            percent: 80,
//                            skill: new ObjectId(),
//                            cssClass: 'bg-success'],
//                    [name: 'jQuery',
//                            percent: 35,
//                            skill: new ObjectId(),
//                            cssClass: 'bg-info'],
//                    [name: 'PHP',
//                            percent: 85,
//                            skill: new ObjectId(),
//                            cssClass: 'bg-warning'],
//                    [name: 'WP',
//                            percent: 95,
//                            skill: new ObjectId(),
//                            cssClass: 'bg-danger'],
//                    [name: 'SEO',
//                            percent: 45,
//                            skill: new ObjectId(),
//                            cssClass: 'bg-primary'],
//                    [name: 'Proje Yönetimi',
//                            percent: 85,
//                            skill: new ObjectId(),
//                            cssClass: 'bg-default'],
//                    [name: 'Groovy',
//                            percent: 75,
//                            skill: new ObjectId(),
//                            cssClass: 'bg-success'],
//                    [name: 'Grails',
//                            percent: 85,
//                            skill: new ObjectId(),
//                            cssClass: 'bg-success'],
//                    [name: 'UX Design',
//                            percent: 35,
//                            skill: new ObjectId(),
//                            cssClass: 'bg-success'],
//                    [name: 'Amazon Web Services',
//                            percent: 75,
//                            skill: new ObjectId(),
//                            cssClass: 'bg-info'],
//                    [name: 'Startup Management',
//                            percent: 65,
//                            skill: new ObjectId(),
//                            cssClass: 'bg-warning'],
//                    [name: 'Git',
//                            percent: 63,
//                            skill: new ObjectId(),
//                            cssClass: 'bg-primary'],
//                    [name: 'AngularJs',
//                            percent: 91,
//                            skill: new ObjectId(),
//                            cssClass: 'bg-danger'],
//
//            ].each {
//
//                def rand = new java.util.Random()
//                def ids = [
//                        new ObjectId('5253388f0fb8a098ad784d85'),
//                        new ObjectId('5253388f0fb8a098ad784d86'),
//                        new ObjectId('5253388f0fb8a098ad784d87'),
//                        new ObjectId('5253388f0fb8a098ad784d88'),
//                        new ObjectId('5253388f0fb8a098ad784d89'),
//                        new ObjectId('5253388f0fb8a098ad784d8a'),
//                        new ObjectId('5253388f0fb8a098ad784d8b'),
//                        new ObjectId('525338900fb8a098ad784d8c'),
//                        new ObjectId('525338900fb8a098ad784d8d'),
//                        new ObjectId('525338900fb8a098ad784d8e'),
//                        new ObjectId('525338900fb8a098ad784d8f'),
//                        new ObjectId('525338900fb8a098ad784d90'),
//                        new ObjectId('525338900fb8a098ad784d91'),
//                        new ObjectId('525338900fb8a098ad784d92'),
//                        new ObjectId('525338900fb8a098ad784d93'),
//                        new ObjectId('525338900fb8a098ad784d94'),
//                        new ObjectId('525338900fb8a098ad784d95'),
//                        new ObjectId('525338900fb8a098ad784d96'),
//                        new ObjectId('525338900fb8a098ad784d97'),
//                        new ObjectId('525338900fb8a098ad784d98'),
//                        new ObjectId("525338900fb8a098ad784d99"),
//                        new ObjectId("525338900fb8a098ad784d9a"),
//                        new ObjectId("525338900fb8a098ad784d9b"),
//                        new ObjectId("525338900fb8a098ad784d9c"),
//                        new ObjectId("525338900fb8a098ad784d9d"),
//                        new ObjectId("525338900fb8a098ad784d9e"),
//                        new ObjectId("525338900fb8a098ad784d9f"),
//                        new ObjectId("525338900fb8a098ad784da0"),
//                        new ObjectId("525338900fb8a098ad784da1"),
//                        new ObjectId("525338900fb8a098ad784da2"),
//                        new ObjectId("525338900fb8a098ad784da3"),
//                        new ObjectId("525338900fb8a098ad784da4"),
//                        new ObjectId("525338900fb8a098ad784da5"),
//                        new ObjectId("525338900fb8a098ad784da6"),
//                        new ObjectId("525338900fb8a098ad784da7"),
//                        new ObjectId("525338900fb8a098ad784da8"),
//                        new ObjectId("525338900fb8a098ad784da9"),
//                        new ObjectId("525338900fb8a098ad784daa"),
//                        new ObjectId("525338900fb8a098ad784dab"),
//                        new ObjectId("525338900fb8a098ad784dac"),
//
//
//                ]
//                it.contributors = []
//                (rand.nextInt(5)).times { o -> it.contributors << ids[rand.nextInt(40)] }
//                it.order = rand.nextInt(100)
//                it.visibility = rand.nextBoolean()
//            }
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

    //todo : dogru duzgun fuctional yaz sunu!
    def calculateCompanySkills(ObjectId companyId) {
        log.debug('service calculate company skillss called id: ' + companyId)
        DBCollection col = Company.collection
        DBCollection pcol = Profile.collection


        def company = col.findOne([_id: companyId])
        assert company

        def oldSkills = company.skills
        def newSkillsMap = [:]

        def employees = pcol.find([_id: ['$in': company.employees]], [skills: 1]).toArray()

//        log.debug("found $employees")

        //map by skill
        employees.each { p ->
            p.skills.each { s ->
                s._profile = p._id
                if (!newSkillsMap[s.skill]) newSkillsMap[s.skill] = []
                newSkillsMap[s.skill] << s
            }
        }

        def newSkillList = []
        //reduce
        def max = { a, b -> [a, b.percent].max() }
        def getVisibility = { it && it.visible != null ? it.visible : true }
        def getOrder = { it && it.order != null ? it.order : 50 }
        newSkillsMap.each { k, v ->
            //assert k instanceof ObjectId
            newSkillList << [
                    skill: k,
                    percent: v.inject(0, max),
                    contributors: v*._profile,
                    visible: getVisibility(oldSkills.findResult { it.skill == k ? it : null }), //default value is true
                    order: getOrder(oldSkills.findResult { it.skill == k ? it : null }), //default value is true
                    name: v[0].name
            ]

        }
        // log.debug(newSkillList)


        def _OPS = [:]

        _OPS.'$set' = ['skills': newSkillList]

        return col.update([_id: companyId], _OPS, false, false, WriteConcern.SAFE)
        //company.employees i al
        //her eleman icin:
        //skill lerini cek
        //companySkill e ekle

        //companySkills i geridondur yada butun companyi
    }


    def updateSkillField(ObjectId companyId, def op, ObjectId skillId, def newValue) {
        assert ['VISIBILITY', 'ORDER'].any { it == op }
        assert skillId
        assert newValue != null


        DBCollection col = Company.collection

        def _QUERY = [_id: companyId, 'skills.skill': skillId]

        def _OPS = [:]
        switch (op) {
            case 'VISIBILITY':
                _OPS.'$set' = ['skills.$.visible': newValue]
                break
            case 'ORDER':
                _OPS.'$set' = ['skills.$.order': newValue]
                break
            default:
                throw new UnsupportedOperationException(op)
        }

        return col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)

    }

}
