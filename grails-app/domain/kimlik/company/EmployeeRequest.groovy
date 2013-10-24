package kimlik.company

import kimlik.account.Address
import org.bson.types.ObjectId
import startupservices.Profile
/**
 * Şirktin calisani olmak icin onay requesti. sirket yada user yollaya bilir
 */
class EmployeeRequest {

    ObjectId id

    Profile profile
    Company company

    Date date

    /**
     * True ise sirket request i yolladi
     * False ise kullanici request yolladi
     */
    Boolean requestedByCompany

    static constraints = {
    }

}
