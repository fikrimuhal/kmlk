package kimlik.account.history

import kimlik.account.SocialMeta
import org.bson.types.ObjectId

/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 9/11/13
 * Time: 6:17 PM
 * To change this template use File | Settings | File Templates.
 */
class HistoryEntity {
    static embedded = ['socialMeta']
    ObjectId id
    Date startDate
    Date endDate

    String entity
    String position
    String note

    SocialMeta socialMeta  = new SocialMeta()

    static constraints = {
        startDate nullable: true
        endDate nullable: true
        socialMeta nullable: true
    }

    boolean weakEquals(o) {
        if (this.is(o)) return true
        if (!(o instanceof HistoryEntity)) return false

        HistoryEntity that = (HistoryEntity) o

        if (entity != that.entity) return false
        if (position != that.position) return false

        return true
    }

}
