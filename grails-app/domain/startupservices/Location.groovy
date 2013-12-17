package startupservices


class Location {
    static embedded = ['latLng']
    String country = 'Turkey'//: 'Türkiye',
    String city//: 'İstanbul',
    String district//: 'Cekmekoy',
    String quarter//: 'Mimar sinan',
    String avenue//: 'Cavusbasi',
    String street//: 'ethem',
    String formatted_address//: '', //calculated
    String display_address//: '', //fulladdress (publik olarak gosterilirken bu kullanilacak)


    LatLng latLng = new LatLng()

    Integer privacyLevel = 300

    static constraints = {
        country nullable: true
        city nullable: true
        privacyLevel nullable: true
        district nullable: true
        quarter nullable: true
        avenue nullable: true
        street nullable: true
        formatted_address nullable: true
        display_address nullable: true
    }


}
