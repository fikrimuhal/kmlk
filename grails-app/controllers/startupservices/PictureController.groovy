package startupservices

import com.mongodb.DBCollection
import com.mongodb.WriteConcern
import org.bson.types.ObjectId
import org.springframework.web.multipart.commons.CommonsMultipartFile

class PictureController {
    def pictureService
    def authenticationService
    def profileService

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
}
