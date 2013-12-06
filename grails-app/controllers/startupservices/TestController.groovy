package startupservices

import com.amazonaws.services.ec2.model.Instance
import com.amazonaws.services.ec2.model.Reservation
import com.amazonaws.services.s3.model.Bucket
import grails.converters.JSON
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
        println authenticationService.authenticatedUserWithGorm

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


    def hashTest() {
        render 'OK :) <br/>'
        render "_escaped_fragment_ = ${params._escaped_fragment_}"
    }

    def upload2() {
        log.debug 'params: ' + params
        log.debug 'params.files: ' + params.files?.dump()
        log.debug 'method: ' + request.method
        log.debug 'getjson: ' + request.getJSON()
        log.debug 'getparts: ' + request.parts
        def file =  params.files
        assert file instanceof CommonsMultipartFile
        file.contentType


        def result = ["files": [
                [
                        "name": "picture1.jpg",
                        "size": 111222333,
                        "url": "http://s3.amazonaws.com/kimlik/photos/525bee2aef869502d11cc461.jpg",
                        "thumbnailUrl": "http://s3.amazonaws.com/kimlik/photos/525bee2aef869502d11cc461.jpg",
                        "deleteUrl": "/test/upload2",
                        "deleteType": "DELETE"
                ]
        ]]
        render result as JSON
    }
}
