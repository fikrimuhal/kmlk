package kimlik.company

import startupservices.Profile
import startupservices.Skill

class CompanySkill {
    Skill skill
    int order
    boolean visible

    List<Profile> contributors //calculated
    double percent             //calculated

    static constraints = {
    }
}
