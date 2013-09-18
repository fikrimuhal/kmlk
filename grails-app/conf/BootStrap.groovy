import grails.converters.JSON
import org.bson.types.ObjectId
import startupservices.PersonalSkill
import startupservices.Skill

class BootStrap {

    def init = { servletContext ->
        configure()

        //todo mock change me
        if (!Skill.count) {
            [
                    new Skill(name: 'Java'),
                    new Skill(name: 'Web Tasarim'),
                    new Skill(name: 'CSS'),
                    new Skill(name: 'HTML'),
                    new Skill(name: 'javascript'),
                    new Skill(name: 'Groovy'),
                    new Skill(name: 'Grails'),
                    new Skill(name: 'Object oriented Programming'),
                    new Skill(name: 'Functional Programming'),
                    new Skill(name: 'Web Services'),
                    new Skill(name: 'MongoDB'),
                    new Skill(name: 'SQL'),
                    new Skill(name: 'NoSql')
            ].each {
                it.nameLower = it.name.toLowerCase()
                it.save()
            }

        }
    }

    def destroy = {
    }

    private configure() {
    }
}


