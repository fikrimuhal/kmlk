package startupservices

import org.bson.types.ObjectId

/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 9/12/13
 * Time: 8:20 PM
 * To change this template use File | Settings | File Templates.
 */
class ProfileMerge {
    ObjectId id

    Profile owner

    Set<Profile> profiles = new HashSet<Profile>()

    static mapping = {
        owner(index: true)

    }
}
