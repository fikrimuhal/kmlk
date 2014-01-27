package startupservices

import com.mongodb.DBCollection
import com.mongodb.DBCursor
import com.mongodb.WriteConcern
import kimlik.ProfileUtils
import kimlik.account.Accounts
import kimlik.account.SocialAccount
import kimlik.account.SocialMeta
import kimlik.account.history.HistoryEntity
import kimlik.company.Company
import org.bson.types.ObjectId

import static kimlik.ProfileUtils.postProcessProfile

class ProfileService {
    def skillService
    def pictureService

    def addWorkHistory(ObjectId profileId, HistoryEntity historyEntity) {
        log.debug("Work eklenecek profileId:${profileId}, work:${historyEntity.entity}")

        def p = Profile.get(profileId)

        if (p.workHistory.updateOrAdd(historyEntity)) p.save()
    }

    def addEducationHistory(ObjectId profileId, HistoryEntity historyEntity) {
        log.debug("Education eklenecek profileId:${profileId}, education:${historyEntity.socialMeta?.dump()}")

        def p = Profile.get(profileId)

        if (p.educationHistory.updateOrAdd(historyEntity)) p.save()

    }

    def rateSelfSkill(ObjectId profileId, String skillName, int value) {

        DBCollection col = Profile.collection
        def percent
        switch (value) {
            case 1:
                percent = 5
                break
            case 2:
                percent = 25
                break
            case 3:
                percent = 50
                break
            case 4:
                percent = 70
                break
            case 5:
                percent = 90
                break
            default:
                percent = 0
        }

        col.update([_id: profileId, 'skills.name': skillName], [$set: ['skills.$.self_score': value]], false, false, WriteConcern.NONE)

        //todo percentler burada hesaplanmayacak   , ornek olsun diye koydum
        col.update([_id: profileId, 'skills.name': skillName], [$set: ['skills.$.percent': percent]], false, false, WriteConcern.NONE)

    }


    def addSkill(ObjectId profileId, String skillName) {
        log.debug("skill eklenecek profileId:${profileId}, skillName:${skillName}")

        def skill = skillService.createOrUse(skillName, true)


        DBCollection col = Profile.collection
        def _QUERY = [_id: profileId]
        def _QUERY_SKILL = [_id: profileId, 'skills': ['$elemMatch': [skill: skill.id]]]

        def profileHasSkill = col.findOne(_QUERY_SKILL, [_id: 1])
        if (!profileHasSkill) {
//            log.debug 'kullanicida bu skill yok'

            def pSkill = [
                    skill: skill.id,
                    name: skill.name
            ]
            col.update(_QUERY, [$addToSet: ['skills': pSkill]], false, false, WriteConcern.SAFE)

        } else {
            // zaten kullanicida bu skill var birsey yapma

//            log.debug 'skill kullanicida zaten var bisey yapmicam'
        }
        return skill
    }

    def removeSkill(ObjectId profileId, String skillName) {

        def _QUERY = [_id: profileId]
        DBCollection col = Profile.collection
        col.update(_QUERY, [$pull: ['skills': [name: skillName]]], false, false, WriteConcern.SAFE)


    }

    //TODO  buraya bir bakmak lazim....
    def addFriend(ObjectId profileId, def friendData, String accountType) {
        log.debug("\n\n friend eklenecek profileId:${profileId}, friendData:${friendData}, accountType:${accountType}")

        // check if we know the user
        def QUERY = [:]
        QUERY.put("accounts." + accountType + ".remoteId", friendData.id)
        // log.info('SORGU::::: ' + QUERY?.dump())
        def friend = Profile.collection.findOne(QUERY)
        println friend


        if (!friend) {
            // log.debug('YENI ARKADAS OLUSTURULUYOR::: TYPE ' + accountType)
            //            friend daha onceden kayit olmamis bu kisiyi ilk defa goruyoruz
            //CREATE NEW GLOBAL PROFILE
            friend = new Profile(
                    registered: false,
                    first_name: friendData.first_name,
                    last_name: friendData.last_name,
                    middle_name: friendData.middle_name,
            )

            if (accountType == 'linkedin') {

                friend.accounts = new Accounts(
                        linkedin: new SocialAccount(
                                remoteId: friendData.id,
                                first_name: friendData.first_name,
                                last_name: friendData.last_name,
                                picture_url: friendData.picture_url,
                                middle_name: friendData.middle_name,
                        )
                )
            } else if (accountType == 'facebook') {
                friend.accounts = new Accounts(
                        facebook: new SocialAccount(
                                remoteId: friendData.id,
                                first_name: friendData.first_name,
                                last_name: friendData.last_name,
                                middle_name: friendData.middle_name,
                        )
                )
            } else if (accountType == 'google') {

            } else if (accountType == 'twitter') {

            }
            friend = friend.save(flush: true, failOnError: true)

            //save linkedin picture
            if (accountType == 'linkedin' && friendData.picture_url) {
                pictureService.upload2Aws(new URL((String) friendData.picture_url), 'linkedin', friend.id, true)
            }

            //END --- CREATE NEW GLOBAL PROFILE
        } else {
            log.debug "friend zaten sisteme daha onceden eklenmis ${friend._id}, ${friend.first_name}"
            //currentProfile in arkadasimi bilmiyorum ama
        }

        //daha onceden updateAccounts calismis olmasi lazim. (currentProfile'in)
        def _QUERY = [_id: profileId]

        def friendId = (friend?.id) ?: friend?._id
        if (friendId) {
            Profile.collection.update(_QUERY, [$addToSet: ['friends': friendId]], false, false, WriteConcern.NONE)
        }
        //artik arkadaslar, ama tek tarafli

        //dddd
    }

    def addProfilePicture(Picture picture, ObjectId profileId, boolean isDefault) {

        def pictureMap = [
                _id: picture.id,
                path: picture.path,
                bucket: picture.bucket,
                url: picture.url,
//                owner: picture.owner.id,
                broken: picture.broken,
                source: picture.source
        ]
        DBCollection col = Profile.collection

        def _QUERY = [_id: profileId]
        def _OPS = [:]
        if (isDefault) {
            _OPS.'$set' = ['profilePicture.url': picture.url]
        }
        _OPS.'$addToSet' = ['profilePicture.pictures': pictureMap]
        col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)

    }

    def deleteProfilePicture(ObjectId pictureId, profileId) {

        DBCollection col = Profile.collection


        def _QUERY = [
                _id: profileId,
                'profilePicture.pictures._id': pictureId
        ]

        def _OPS = [:]

        _OPS.'$pull' = ['profilePicture.pictures': ['_id': pictureId]]
        col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)

    }


    def makeDefaultProfilePicture(String url, ObjectId profileId) {
        if (validateProfilePictureUrl(url, profileId)) {

            DBCollection col = Profile.collection

            def _QUERY = [_id: profileId]
            def _OPS = [:]
            _OPS.'$set' = ['profilePicture.url': url]
            col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)
        }

    }

    def validateProfilePictureUrl(String url, ObjectId profileId) {
        String lcUrl = url.toLowerCase()
        if (lcUrl.startsWith('http://graph.facebook.com/') || lcUrl.startsWith('http://graph.facebook.com/')) {
            //database de facebook fotograflari saklanmiyor
            return true
        }

        DBCollection col = Profile.collection

        def _QUERY = [_id: profileId,
                'profilePicture.pictures.url': url
        ]

        return 0 < col.count(_QUERY)
    }


    def getProfilesByIds(def ids) {
        DBCollection col = Profile.collection
        def _QUERY = [_id: ['$in': ids]]

        def result = []
        col.find(_QUERY).each {
            result << postProcessProfile(it)
        }

        return result
    }

    def getProfilesById(ObjectId id) {
        return getProfilesByIds([id]).first()
    }

    def list(def params) {
        params.page = params.page ?: 1
        params.itemPerPage = params.itemPerPage ?: 20

        DBCollection col = Profile.collection
        def _QUERY = [:]

        switch (params.filterBy) {
            case 'REGISTERED':
                _QUERY.registered = true
                break
            case 'UNREGISTERED':
                _QUERY.registered = false
                break
        // default ALL
        }

        int skip = (params.page - 1) * params.itemPerPage
        int limit = params.itemPerPage


        def data = []

        DBCursor cursor = col.find(_QUERY)

        cursor.sort([_id: 1]).skip(skip).limit(limit).each {
            data << postProcessProfile(it)
        }

        return [
                totalItems: cursor.count(),
                currentPage: params.page,
                itemsPerPage: params.itemPerPage,
                filterBy: params.filterBy,
                data: data
        ]

    }


    def updateLocation(def location, ObjectId profileId) {
        log.debug(location)

        def documentMap = [
                privacyLevel: location.privacyLevel as int ?: 0,
                country: location.country ?: '',
                city: location.city ?: '',
                district: location.district ?: '',
                quarter: location.quarter ?: '',
                avenue: location.avenue ?: '',
                street: location.street ?: '',
                display_address: location.display_address ?: '',
                latLng: [
                        lat: location.latLng?.lat ?: 0,
                        lng: location.latLng?.lng ?: 0,
                        zoomLevel: location.latLng?.zoomLevel ?: 0
                ]
        ]
        DBCollection col = Profile.collection

        def _QUERY = [_id: profileId]

        def _OPS = [:]

        _OPS.'$set' = ['contactInfo.address': documentMap]

        return col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)

    }

    def updateFields(ObjectId profileId, LinkedHashMap fieldMap) {
        DBCollection col = Profile.collection

        def _QUERY = [_id: profileId]

        def _OPS = [:]

        _OPS.'$set' = fieldMap

        return col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)
    }
}
