package api

import grails.converters.JSON
import org.bson.types.ObjectId

class NotificationController {
    def notificationService

    def index() {}



    def deleteNotifications() {
        notificationService.deleteNotifications(request.JSON.ids.collect({ObjectId.massageToObjectId(it)}))

        def result = [status: 'ok']
        render result as JSON
    }

    def markAsRead() {
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

        def result = [status: 'ok']
        render result as JSON
    }

}
