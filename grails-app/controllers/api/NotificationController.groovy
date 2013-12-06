package api

import grails.converters.JSON
import org.bson.types.ObjectId

class NotificationController {
    def notificationService

    def index() {}

    def getInbox(){
        ObjectId inboxId = ObjectId.massageToObjectId(request.JSON.inboxId)
        def result = notificationService.getInbox(inboxId)
        render result as JSON

    }

}
