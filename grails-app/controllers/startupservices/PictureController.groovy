package startupservices

import com.mongodb.DBCollection
import com.mongodb.WriteConcern
import grails.converters.JSON
import org.bson.types.ObjectId
import org.springframework.web.multipart.commons.CommonsMultipartFile

class PictureController {
    def pictureService
    def authenticationService
    def profileService
    def companyService

    def index() {}

    def upload() {

        assert params.redirectTo


        def file = request.getFile('file')
        assert file instanceof CommonsMultipartFile


        if (!authenticationService.loggedIn) {
            assert false
        }

        //owner
        ObjectId profileId = authenticationService.authenticatedUserId


        if (!file.empty) {
            println 'file var'
            def picture = pictureService.upload2Aws(file, 'upload', profileId)
            profileService.addProfilePicture(picture, profileId, true)


        } else {
            println 'file yok'
        }

        redirect url: params.redirectTo
    }

    /**
     * company suanda
     * @return
     */
    def ajaxUpload() {
        def result
        log.debug 'params: ' + params
        log.debug 'params.files: ' + params.files?.dump()
        log.debug 'method: ' + request.method
        log.debug 'getjson: ' + request.getJSON()
        log.debug 'getparts: ' + request.parts
        def file = params.files
        assert file instanceof CommonsMultipartFile

        ObjectId profileId = authenticationService.authenticatedUserId
        ObjectId companyId = ObjectId.massageToObjectId(params.companyId)//todo kullanicin permission i var mi bak
        assert profileId
        assert companyId

        if (!file.empty) {
            println 'file var'
            def picture = pictureService.upload2Aws(file, 'upload', profileId)
            companyService.addOfficePhoto(picture, companyId)



            result = ["files": [
                    [
                            "name": file.originalFilename,
                            "size": file.size,
                            "url": picture.url,
                            _id : picture.id,
                            "thumbnailUrl": picture.url,
                            "deleteUrl": "/test/upload2",
                            "deleteType": "DELETE"
                    ]
            ]]

        } else {
            println 'file yok'


            result = ["files": [
                    [
                            "name": file.originalFilename,
                            "size": file.size,
                            "error": "Bir hata oluştu; yükleme başarısız"
                    ]
            ]]
        }


        render result as JSON
    }

    /**
     * Profile suanda
     * @return
     */
    def ajaxUploadProfile() {
        def result
        log.debug 'params: ' + params
        log.debug 'params.files: ' + params.files?.dump()
        log.debug 'method: ' + request.method
        log.debug 'getjson: ' + request.getJSON()
        log.debug 'getparts: ' + request.parts
        def file = params.files
        assert file instanceof CommonsMultipartFile

        ObjectId profileId = authenticationService.authenticatedUserId
        assert profileId

        if (!file.empty) {
            println 'file var'
            def picture = pictureService.upload2Aws(file, 'upload', profileId)
            profileService.addProfilePicture(picture, profileId, true)



            result = ["files": [
                    [
                            "name": file.originalFilename,
                            "size": file.size,
                            "url": picture.url,
                            _id : picture.id,
                            "thumbnailUrl": picture.url,
                            "deleteUrl": "/test/upload2",
                            "deleteType": "DELETE"
                    ]
            ]]

        } else {
            println 'file yok'


            result = ["files": [
                    [
                            "name": file.originalFilename,
                            "size": file.size,
                            "error": "Bir hata oluştu; yükleme başarısız"
                    ]
            ]]
        }


        render result as JSON
    }

    /**
     * company ofice picture silmek icin sadece suanda
     */
    def ajaxDelete() {
        def result = [
                result: 'ok',
                pictureId: params.pictureId
        ]
        log.debug 'params: ' + params

        ObjectId pictureId = ObjectId.massageToObjectId(params.pictureId)
        ObjectId companyId = ObjectId.massageToObjectId(params.companyId)//todo kullanicin permission i var mi bak
        ObjectId profileId = authenticationService.authenticatedUserId

        assert pictureId
        assert companyId
        assert profileId

        result.data = companyService.deleteOfficePhoto(pictureId, companyId)
        pictureService.delete(pictureId)
        render result as JSON

    }

    /**
     * profile picture silmek icin sadece suanda
     */
    def ajaxDeleteProfile() {
        def result = [
                result: 'ok',
                pictureId: params.pictureId
        ]
        log.debug 'params: ' + params

        ObjectId pictureId = ObjectId.massageToObjectId(params.pictureId)
        ObjectId profileId = authenticationService.authenticatedUserId

        assert pictureId
        assert profileId

        result.data = profileService.deleteProfilePicture(pictureId, profileId)
        pictureService.delete(pictureId)
        render result as JSON

    }
    /**
     * profile picture silmek icin sadece suanda
     */
    def makeDefaultProfilePicture() {
        def result = [
                result: 'ok'
        ]
        log.debug 'params: ' + params

        String url = request.JSON.url

        ObjectId profileId = authenticationService.authenticatedUserId

        assert url
        assert profileId

        result.data = profileService.makeDefaultProfilePicture(url, profileId)

        render result as JSON

    }
}
