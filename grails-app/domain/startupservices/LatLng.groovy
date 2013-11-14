package startupservices

class LatLng {
    Double lat
    Double lng
    int zoomLevel
    static constraints = {
        lat nullable: true
        lng nullable: true
        zoomLevel nullable: true
    }
}
