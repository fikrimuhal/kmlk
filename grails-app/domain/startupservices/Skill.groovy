package startupservices

import org.bson.types.ObjectId

/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 9/12/13
 * Time: 2:15 AM
 * To change this template use File | Settings | File Templates.
 */
class Skill {
    ObjectId id
    String name
    int numberOfUsersHas = 0
    Set<String> skillSets = new HashSet<String>()

    static mapping = {
        name(index: true)
    }
}
