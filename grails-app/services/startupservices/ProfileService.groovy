package startupservices

import com.mongodb.DBCollection
import com.mongodb.WriteConcern
import kimlik.account.Accounts
import kimlik.account.SocialAccount
import kimlik.account.SocialMeta
import kimlik.account.history.HistoryEntity
import org.bson.types.ObjectId

class ProfileService {
    def skillService

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
            //END --- CREATE NEW GLOBAL PROFILE
        } else {
            log.debug "friend zaten sisteme daha onceden eklenmis ${friend._id}, ${friend.first_name}"
            //currentProfile in arkadasimi bilmiyorum ama
        }

        //daha onceden updateAccounts calismis olmasi lazim. (currentProfile'in)
        def _QUERY = [_id: profileId]

        def friendId = (friend?.id)?:friend?._id
        if (friendId) {
            Profile.collection.update(_QUERY, [$addToSet: ['friends': friendId]], false, false, WriteConcern.NONE)
        }
        //artik arkadaslar, ama tek tarafli

        //dddd
    }

}
