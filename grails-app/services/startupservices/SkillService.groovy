package startupservices

import com.mongodb.WriteConcern
import org.bson.types.ObjectId

class SkillService {

    def serviceMethod() {
        println Profile.collection.update([_id: new ObjectId('52372aedef86daf9772131e4')], [$addToSet: ['skills': [name:System.currentTimeMillis()]]], false, false, WriteConcern.SAFE)

    }

    def list() {
        Skill.list()
    }

    def createOrUse(String name, boolean incrementUsage) {
        def skill = Skill.findByNameLower(name.toLowerCase())

        if (!skill) {
            log.debug 'yeni skill olustur'
            skill = new Skill(
                    name: name,
                    nameLower: name.toLowerCase(), //index ve search icin lazim
                    numberOfUsersHas: 1
            ).save()
        } else if (incrementUsage) {
            log.debug 'skill zaten var (baskasi olusturmus)'
            skill.numberOfUsersHas++
            skill = skill.save()
        }
        return skill
    }
}
