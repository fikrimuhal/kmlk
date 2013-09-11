package kimlik.account

/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 9/11/13
 * Time: 5:43 PM
 * To change this template use File | Settings | File Templates.
 */
class MapCoordinates {
    Double longitude
    Double latitude
    int zoomLevel

    static constraints = {
        longitude nullable: true
        latitude nullable: true
        zoomLevel nullable: true
    }
}
