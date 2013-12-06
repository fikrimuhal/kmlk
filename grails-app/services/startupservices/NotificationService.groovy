package startupservices

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
        send notification, 'company', toId
    }

    def sendToProfile(Notification notification, ObjectId toId) {
        send notification, 'profile', toId
    }

    def getInbox(ObjectId id) {
        return m2
    }


    def m1 = [
            [_id: 1, title: 'Bootstrap 3.0 a geçtik süper!', message: 'Bootstrap 3.0 a geçtik süper!', date: '23 June 13', isRead: true],
            [_id: 2, title: 'Bootstrap 2.0 a geçtik süper!', message: 'Aaaa bbbbBootstrap 2.0 a geçtik süper!', date: '22 June 03', isRead: false],
    ]

    def m2 = [
            _id: new ObjectId(),
            notifications: [
                    [_id: 2, title: 'Bootstrap 2.0 a geçtik süper!', message: 'Aaaa bbbbBootstrap 2.0 a geçtik süper!', date: '22 June 03', isRead: false]
            ],
            owner: new DBRef(null, 'company', new ObjectId("5284d3dfef86d6dccf71619f")),

    ]
}
