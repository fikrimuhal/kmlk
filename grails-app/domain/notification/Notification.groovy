package notification

import com.mongodb.DBRef
import org.bson.types.ObjectId

class Notification {
    ObjectId id
    String title
    String content
    Map data
    Date date
    DBRef from
    DBRef to
    Boolean isRead


    static constraints = {
    }
}
