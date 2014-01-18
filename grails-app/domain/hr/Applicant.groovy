package hr

import kimlik.company.Company
import org.bson.types.ObjectId
import startupservices.Profile

class Applicant {
    ObjectId id

    Profile profile

    Company company

    Date applyDate

    String userNote


    static constraints = {
    }
}
