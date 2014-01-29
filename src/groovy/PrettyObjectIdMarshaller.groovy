import grails.converters.JSON
import org.bson.types.ObjectId

/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 9/18/13
 * Time: 12:37 AM
 * To change this template use File | Settings | File Templates.
 */
class PrettyObjectIdMarshaller {
    @javax.annotation.PostConstruct
    void registerMarshaller() {
        JSON.registerObjectMarshaller(ObjectId) { return it.toStringMongod() }

    }
}
