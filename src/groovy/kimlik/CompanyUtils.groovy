package kimlik
/**
 * Created by sumnulu on 21/01/14.
 */
class CompanyUtils {
    static postProcessCompany(Map company) {
        if (company == null) return null

        mockExtraData company
        addDeprecatedFields company
        fixNullFields company

        return company
    }

    static def mockExtraData(Map company) {
        company << [
                founded: '1/4/2013',
                totalInvesment: [
                        value: 150000,
                        currency: 'TL'
                ],
                employeeStats: [
                        numberOfTotal: 3,
                        numberOfTechnical: 2,
                        numberOfManagment: 2
                ]
        ]
        return company
    }

    static def addDeprecatedFields(Map company) {
        company.pageUrl = "http://kimlik.io/company/profile/${company.name.pageName}".toString()
        company.page_name = company.name.pageName
        company.short_name = company.name.oneWord
        company.full_name = company.name.fullLegal
        return company
    }

    static def fixNullFields(Map company) {
        if (!company.location) company.location = [:]
        if (!company.location.latLng) company.location.latLng = [:]

        return company
    }


}
