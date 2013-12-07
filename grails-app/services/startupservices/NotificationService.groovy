package startupservices

import com.mongodb.DB
import com.mongodb.DBCollection
import com.mongodb.DBRef
import com.mongodb.WriteConcern
import kimlik.company.Company
import notification.Notification
import org.bson.types.ObjectId


class NotificationService {

    /**
     * needAction :true|false
     * actionURL : String
     *
     *
     * @param message
     * @param toInboxId
     * @return
     */
    private send(Notification notification, String toCollection, ObjectId toId) {
        log.info("message :&notification, inbox: $toId $toCollection")

        def data = [
                _id: new ObjectId(),
                title: notification.title,
                content: notification.content,
                data: notification.data,
                date: new Date(),
                from: notification.from,
                to: notification.to,
                isRead: false
        ]

        DBCollection col
        switch (toCollection) {
            case 'company':
                col = Company.collection; break;
            case 'profile':
                col = Profile.collection; break;

        }

        def _QUERY = [_id: toId]

        def _OPS = [:]
        _OPS.'$push' = ['notificationInbox.notifications': data]
        _OPS.'$inc' = ['notificationInbox.eTag': 1]

        println col.update(_QUERY, _OPS, false, false, WriteConcern.SAFE)

    }

    def sendToCompany(Notification notification, ObjectId toId) {
        notification.to = new DBRef(null, 'company', toId)
        send notification, 'company', toId
    }

    def sendToProfile(Notification notification, ObjectId toId) {
        notification.to = new DBRef(null, 'profile', toId)
        send notification, 'profile', toId
    }

    /**
     * TODO
     * Mongonun allah...
     * Dikkat... Bu butun collection a READ WRITE Lock koyuyor (ama hizli calisiyor (sanirim))
     * @param ids
     */
    def markAsRead(def ids) {
        println ids

        // database i alalim. not: herhangi baska bir colelction da olurdu
        DB db = Company.collection.getDB()

        println db.doEval(MARK_AS_READ_CODE, ids);

    }


    /**
     * Biraz clientdan hint alsak iyi olur aslinda, en azindan id lerin yaninda to inbox field i de olabilir
     * @param ids
     * @return
     */
    def deleteNotifications(def ids) {
        println ids
        DBCollection col

        def _QUERY = ['notificationInbox.notifications._id': ['$in': ids]]
        def _OPS = [:]
        _OPS.'$pull' = ['notificationInbox.notifications': ['_id': ['$in': ids]]]
        _OPS.'$inc' = ['notificationInbox.eTag': 1]

        [Company, Profile].each {
            col = it.collection
            println col
            println _QUERY
            println col.update(_QUERY, _OPS, false, true, WriteConcern.SAFE)
        }
    }


    final String MARK_AS_READ_CODE =
            '''function (ids) {
               for (var idx in ids) {
                   var q = {'notificationInbox.notifications._id': ids[idx]},
                       op = {$set: {'notificationInbox.notifications.$.isRead': true}};
                   db.company.update(q, op);
                   db.profile.update(q, op);
                 }
               }'''
}

