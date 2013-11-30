package kimlik.company

import org.bson.types.ObjectId
import startupservices.DomainToPage
import startupservices.Location
import startupservices.Picture
import startupservices.Profile

class Company {
    static embedded = ['location', 'officePictures', 'products', 'name', 'skills', 'timeline']

    ObjectId id

    CompanyName name = new CompanyName()
    /*

            founded: '1/4/2013',
            totalInvesment: [
                    value: 150000,
                    currency: 'TL'
            ],
            employeeStats: [
                    numberOfTotal: 3,
                    numberOfTechnical: 2,
                    numberOfManagement: 2
            ]
     */

    @Deprecated
    String page_name
    @Deprecated
    String short_name
    @Deprecated
    String full_name

    String about

    String industry
    List<String> tags

    String email
    String tel
    String www

    Location location = new Location()

    Profile owner

    List<Profile> employees

    Picture logo
    Picture coverPicture

    DomainToPage domainToPage

    List<Picture> officePictures
    List<Product> products
    List<CompanySkill> skills = new ArrayList<CompanySkill>()
    List<TimelineEntity> timeline

    static constraints = {
    }

    static hasMany = [
            employees: Profile ,
            skills: CompanySkill
    ]
}
