package kimlik.account

/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 9/11/13
 * Time: 5:36 PM
 * To change this template use File | Settings | File Templates.
 * @Deprecated
 */
@Deprecated
class Address {
    static embedded = ['mapCoordinates']

    String country
    String city
    String other // country ve city disindaki bolum

    MapCoordinates googleMapsCoordinates = new MapCoordinates()

    static constraints = {
        country nullable: true
        city nullable: true
        other nullable: true

        googleMapsCoordinates nullable: true
    }

    String getFullAddress(){

        def r = ''
        if (other)
            r =  other
        if (city)
            r += ', ' + city
        if (country)
            r += ', ' + country
        return r

    }
}
