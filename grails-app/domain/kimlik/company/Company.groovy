package kimlik.company

import kimlik.account.Address
import org.bson.types.ObjectId
import startupservices.DomainToPage
import startupservices.Picture
import startupservices.Profile

class Company {
    static embedded = ['address','officePictures']

    ObjectId id
    String page_name

    String short_name
    String full_name

    String about

    String industry
    List<String> tags

    String email
    String tel
    String www

    Address address = new Address()

    Profile owner

    List<Profile> employees

    Picture logo
    Picture coverPicture

    DomainToPage domainToPage

    List<Picture> officePictures

    static constraints = {
    }

    static hasMany = [
            employees: Profile
    ]
}
