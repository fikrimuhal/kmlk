package startupservices

import com.amazonaws.services.ec2.model.Instance
import com.amazonaws.services.ec2.model.Reservation
import com.amazonaws.services.s3.model.Bucket
import org.bson.types.ObjectId
import org.springframework.web.multipart.commons.CommonsMultipartFile

class TestController {
    def persistentLoginService
    def authenticationService
    def amazonWebService
    def pictureService

    def index() {
        render 'ok index'
    }

    def a() {
        def profile = Profile.findByUsername('sumnulu')
//        authenticationService.setAuthenticatedUserId(profile.id)
//
//        persistentLoginService.registerCurrentDevice()
        def result = authenticationService.authenticate()
        println result

        println authenticationService.getAuthenticatedUserId()
        println authenticationService.authenticatedUser

        render 'ok'
    }

    def aws() {
        List buckets = amazonWebService.s3.listBuckets()
        buckets.each { Bucket bucket ->
            println "bucketName: ${bucket.name}, creationDate: ${bucket.creationDate}"
        }
        render ' aws ok'
    }

    def fileUpload() {


    }

    def upload() {
        def file = request.getFile('file')
        assert file instanceof CommonsMultipartFile

        if (!file.empty) {
            render 'file var'
        } else {
            render 'file yok'
        }

    }
}
