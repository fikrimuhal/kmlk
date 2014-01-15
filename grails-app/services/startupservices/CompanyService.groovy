package startupservices

import com.mongodb.DBCollection
import com.mongodb.DBCursor
import com.mongodb.DBObject
import com.mongodb.DBRef
import com.mongodb.WriteConcern
import kimlik.company.Company
import kimlik.company.CompanyName
import kimlik.company.EmployeeRequest
import notification.Notification
import org.bson.types.ObjectId

import java.util.regex.Pattern

class CompanyService {
    def notificationService

    //only alphanumeric chars. white space will not match
    final Pattern onlyAlphaNumericPattern = Pattern.compile("[\\p{Alnum},.']*");

    @Deprecated
    def list() {
        Company.list()
    }


    def list(def params) {
        params.page = params.page ?: 1
        params.itemPerPage = params.itemPerPage ?: 20

        DBCollection col = Company.collection
        def _QUERY = [:]

        int skip = (params.page - 1) * params.itemPerPage
        int limit = params.itemPerPage


        def data = []

        DBCursor cursor = col.find(_QUERY)

        cursor.sort([_id:1]).skip(skip).limit(limit).each {
            data << addDeprecatedFields(it) + mockExtraData
        }

        return [
                totalItems: cursor.count(),
                currentPage: params.page,
                itemsPerPage: params.itemPerPage,
                filterBy: params.filterBy,
                data: data
        ]

    }


    /**
     * @deprecated
     */
    def addDeprecatedFields = {
        it.page_name = it.name.pageName
        it.short_name = it.name.oneWord
        it.full_name = it.name.fullLegal
        return it
    }

    def listByOwner(ObjectId owner) {
        def result = []
        DBCollection col = Company.collection
        def _QUERY = [owner: owner]
        col.find(_QUERY).each {
            result << addDeprecatedFields(it) + mockExtraData
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

        return addDeprecatedFields(result)
    }


    def findByPageName(def pageName) {
        if (!pageName) return null

        DBCollection col = Company.collection
        def _QUERY = ['name.pageName': pageName]
        def result = col.findOne(_QUERY)
        result << mockExtraData

        return addDeprecatedFields(result)
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


    def saveTimeline(def entity, ObjectId companyId) {
        log.debug(entity)
        def documentMap = [
                _id: ObjectId.massageToObjectId(entity._id) ?: new ObjectId(),
                content: entity.content ?: '',
                sDate: entity.sDate ?: '',
                eDate: entity.eDate ?: '',
                visible: entity.visible as boolean,
                typeKey: entity.typeKey,
                title: entity.title ?: '',
        ]
        log.info(documentMap)
        DBCollection col = Company.collection

        def _QUERY = [_id: companyId]
        if (entity._id) _QUERY.'timeline._id' = ObjectId.massageToObjectId(entity._id)

        def _OPS = [:]

        if (!entity._id) _OPS.'$addToSet' = ['timeline': documentMap]
        else _OPS.'$set' = ['timeline.$': documentMap]

        log.debug col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)

    }

    def deleteTimeline(ObjectId entityId, companyId) {
        log.debug entityId
        log.debug companyId
        DBCollection col = Company.collection


        def _QUERY = [
                _id: companyId,
                'timeline._id': entityId
        ]

        def _OPS = [:]

        _OPS.'$pull' = ['timeline': ['_id': entityId]]
        log.debug col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)
    }

    def getEmploymentRequests(ObjectId companyId) {

        DBCollection col = EmployeeRequest.collection

        def _QUERY = [company: companyId]

        return col.find(_QUERY).toArray()

    }

    /**
     * Bunu company de cagira bilir login olmus company ye ayit olmayan kullanicida
     * @param fromId company
     * @param toId profile
     * @param requestedByCompany
     * @return
     */
    def newEmploymentRequests(ObjectId fromId, ObjectId toId, boolean requestedByCompany) {

        DBCollection col = EmployeeRequest.collection
        def _QUERY = [profile: toId, company: fromId]
        def _OPS = [:]

        def existingReq = col.findOne(_QUERY)
        if (existingReq) {
            //daha onceden bir request var sirket yada kullanicidan
            if (!existingReq.requestedByCompany && requestedByCompany) {
                //kullanicida zaten request de bulunmus
                //eski kayit i sil( verify etmis olduk aslinda)
                //todo profil i update et
                //todo notification lari yolla
                log.info("request verified oldu  (sirket tarafindan), siliyorum eski kaydi")
                notificationService.sendToProfile(new Notification(
                        title: 'Y sirketi sizi calisan olarak ekledi',
                        from: new DBRef(null, 'company', fromId)), toId)
                addNewEmployee(fromId, toId)
                col.remove([profile: toId, company: fromId, requestedByCompany: false], WriteConcern.SAFE)


            } else if (existingReq.requestedByCompany && !requestedByCompany) {

                //Sirket daha onceden requestte bulunmus, direk onaylayalim
                //todo notification lari yolla
                log.info("request verified oldu (kullanici tarafindan) , siliyorum eski kaydi")
                addNewEmployee(fromId, toId)
                notificationService.sendToCompany(new Notification(
                        title: 'X kisisi, Y sirketi icin calisan olarak eklendi',
                        from: new DBRef(null, 'profile', toId)), fromId)

                col.remove([profile: toId, company: fromId, requestedByCompany: true], WriteConcern.SAFE)

            } else {
                log.info("Zaten daha onceden tek tarafli olarak request yapilmis hicbir sey yapmiyorum")

            }
        } else {
            //daha onceden bir request yok
            log.info("yeni employment request")
            if (requestedByCompany) {
                //istek sirket tarafindan olusturuldu
                notificationService.sendToProfile(new Notification(
                        title: 'Sirket X, sizi calisan olarak eklemek istiyor',
                        from: new DBRef(null, 'company', fromId)), toId)

            } else {
                //istek kullanici tarafindan olusturuldu
                notificationService.sendToCompany(new Notification(
                        title: 'X kisisi, Y sirketin calisan olarak eklenmek istiyor',
                        from: new DBRef(null, 'profile', toId)), fromId)
            }
            col.insert([profile: toId, company: fromId, requestedByCompany: requestedByCompany, date: new Date()], WriteConcern.SAFE)
        }


    }

    def deleteEmploymentRequests(ObjectId requestId) {
        DBCollection col = EmployeeRequest.collection
        //todo burada kullanicinin companyleri arasida mi diye kontrol et $in operatoru gibi

        col.remove([_id: requestId], WriteConcern.SAFE)
        log.info("employment request sirket istegi uzwerine silindi")


    }


    def addNewEmployee(ObjectId companyId, ObjectId profileId) {
        DBCollection col = Company.collection
        //todo burada kullanicinin companyleri arasida mi diye kontrol et $in operatoru gibi
        log.debug('Sirkete yeni calisan eklendi!')

        def _OPS = ['$addToSet': ['employees': profileId]]


        log.debug col.update([_id: companyId], _OPS, false, false, WriteConcern.SAFE)

    }

    def updateFields(ObjectId companyId, LinkedHashMap fieldMap) {

        DBCollection col = Company.collection

        def _QUERY = [_id: companyId]

        def _OPS = [:]

        _OPS.'$set' = fieldMap

        return col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)
    }

    boolean isPageNameValid(String pageName) {
        def normalizedName = pageName.toLowerCase()

        boolean valid = normalizedName.matches(onlyAlphaNumericPattern);
        if (valid) {
            DBCollection col = Company.collection
            def _QUERY = ['name.pageName': normalizedName]
            return col.count(_QUERY) == 0

        } else {
            return false
        }
    }

    def createNewCompany(def data) {
        DBCollection col = Company.collection
        def document = [
                owner: data.owner,
                name: [
                        oneWord: data.'name.pageName'.capitalize(),
                        significantPart: data.'name.significantPart',
                        legalType: data.'name.legalType',
                        pageName: data.'name.pageName',
                        fullLegal: data.'name.fullLegal'
                ],
                industry: '',
                tags: [],
                email: '',
                tel: '',
                www: '',
                about: '',
                employees: [data.owner],
                products: [],
                timeline: [],

        ]


        def result = col.save(document, WriteConcern.SAFE)
        println result
        return result
    }
}

/*











                                    [KASITLI OLARAK BOS BIRAKILDI]













*/
