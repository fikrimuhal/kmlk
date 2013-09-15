package startupservices

import com.mongodb.DBCollection
import com.mongodb.WriteConcern
import grails.converters.JSON
import org.bson.types.ObjectId

class SkillController {

    def getAll() {
        def data = []
        def skills = Skill.list()
        skills.each {
            data << [
                    id: it.id,
                    name: it.name,
                    numberOfUsersHas: it.numberOfUsersHas
            ]
        }
        render data as JSON
    }

    /**
     * @required session.loggedinProfileId != null
     * @return
     */
    def addSkill() {
        assert session.loggedinProfileId
        def currentUsersId = ObjectId.massageToObjectId(session.loggedinProfileId)

        String skillName = params.skillName
        def skill = Skill.findByNameLower(skillName.toLowerCase())

        if (!skill) {
            //yeni skill olustur
            skill = new Skill(
                    name: skillName,
                    nameLower: skillName.toLowerCase(), //index ve search icin lazim
                    numberOfUsersHas: 1
            )
        } else {
            //skill zaten var (baskasi olusturmus)
            skill.numberOfUsersHas++  //todo: minor bug kullanicida zaten var ise yinede artitiriliyor
        }
        //skill i update et yada kaydet
        skill.save()


        DBCollection col = Profile.collection
        def _QUERY = [_id: currentUsersId]
        def _QUERY_SKILL = [_id: currentUsersId, 'skills': ['$elemMatch': [skill: skill.id]]]

        def profileHasSkill = col.findOne(_QUERY_SKILL)
        if (!profileHasSkill) {
            //kullanicida bu skill yok
            def pSkill = [
                    skill: skill.id,
                    name: skill.name
            ]
            println col.update(_QUERY, [$addToSet: ['skills': pSkill]], false, false, WriteConcern.SAFE)

        } else {
            // zaten kullanicida bu skill var birsey yapma

            println 'skill kullanicida zaten var bisey yapmicam'
        }
        def data = [result: 'success']
        render data as JSON
    }

    def removeSkill() {
        assert session.loggedinProfileId
        def currentUsersId = ObjectId.massageToObjectId(session.loggedinProfileId)

        String skillName = params.skillName

        def _QUERY = [_id: currentUsersId]
        DBCollection col = Profile.collection
        println col.update(_QUERY, [$pull: ['skills': [name: skillName]]], false, false, WriteConcern.SAFE)


        def data = [result: 'success']
        render data as JSON
    }


}
