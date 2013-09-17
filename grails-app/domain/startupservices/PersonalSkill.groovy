package startupservices

/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 9/12/13
 * Time: 2:13 AM
 * To change this template use File | Settings | File Templates.
 */
class PersonalSkill {
    Skill skill
    String name
    Double percent // calculated score from other data
    Double self_score //1,2,3,4

    Set<Profile> betterThanMe = new HashSet<Profile>()
    Set<Profile> sameAsMe = new HashSet<Profile>()
    Set<Profile> worstThanMe = new HashSet<Profile>()

    static hasMany = [
            betterThanMe : Profile,
            sameAsMe : Profile,
            worstThanMe : Profile,
    ]

    static constraints = {
        skill nullable: true
        name nullable: true
        percent nullable: true
        self_score nullable: true
        betterThanMe nullable: true
        sameAsMe nullable: true
        worstThanMe nullable: true
    }
}
