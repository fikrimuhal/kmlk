package api

import grails.converters.JSON
import org.bson.types.ObjectId

class NotificationController {
    def notificationService

    def index() {}

    def getInbox() {
        ObjectId inboxId = ObjectId.massageToObjectId(request.JSON.inboxId)
        def result = notificationService.getInbox(inboxId)
        render result as JSON

    }


    def deleteReadNotifications() {
        def result = [status: 'ok']
        render result as JSON
    }

    def deleteNotifications() {
        println request.JSON.notificationIds
        def result = [status: 'ok']
        render result as JSON
    }

    def markAs() {
        println request.JSON.notificationId
        println request.JSON.read

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
