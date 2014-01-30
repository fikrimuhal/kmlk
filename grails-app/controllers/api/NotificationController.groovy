package api

import grails.converters.JSON
import org.bson.types.ObjectId

class NotificationController {
    def notificationService

    def index() {}



    def deleteNotifications() {
        cache("private_nostore")

        notificationService.deleteNotifications(request.JSON.ids.collect({ObjectId.massageToObjectId(it)}))

        def result = [status: 'ok']
        render result as JSON
    }

    def markAsRead() {
        cache("private_nostore")
        //todo AA needed
        notificationService.markAsRead(request.JSON.ids.collect({ObjectId.massageToObjectId(it)}))
        def result = [status: 'ok']
        render result as JSON
    }

    /**
     * DBRefs [c1,c2,p1]
     * @return
     */
    def getAuthorizedInbox() {
        cache("private_nostore")

        def result = [status: 'ok']
        render result as JSON
    }

}
