package startupservices

import org.springframework.web.multipart.commons.CommonsMultipartFile

class PictureController {
    def pictureService

    def index() {}

    def upload() {

        assert params.redirectTo
        def file = request.getFile('file')
        assert file instanceof CommonsMultipartFile


        if (!file.empty) {
            println 'file var'
            pictureService.upload2Aws(file)
        } else {
            println 'file yok'
        }

        redirect url: params.redirectTo
    }
}
