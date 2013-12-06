package startupservices

import org.bson.types.ObjectId


class NotificationService {

    def serviceMethod() {

    }
    /**
     * needAction :true|false
     * actionURL : String
     *
     *
     * @param message
     * @param toInboxId
     * @return
     */
    def send(String message, ObjectId toInboxId) {
        log.info("message : $message, inbox: $toInboxId")
        m << [_id: 2, title: message, message: message, date: '22 June 03', isRead: false]

    }

    def getInbox(ObjectId id) {
         return m
    }


    def m = [
            [_id: 1, title: 'Bootstrap 3.0 a geçtik süper!', message: 'Bootstrap 3.0 a geçtik süper!', date: '23 June 13', isRead: true],
            [_id: 2, title: 'Bootstrap 2.0 a geçtik süper!', message: 'Aaaa bbbbBootstrap 2.0 a geçtik süper!', date: '22 June 03', isRead: false],
            [_id: 3, title: 'Bootstrap 1.0 a geçtik süper!', message: 'Bootstrap 1.0 a geçtik süper!', date: '21 June 03', isRead: false]
    ]
}
