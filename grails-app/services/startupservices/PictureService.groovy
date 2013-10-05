package startupservices

import com.amazonaws.services.s3.model.CannedAccessControlList
import com.amazonaws.services.s3.model.ObjectMetadata
import com.amazonaws.services.s3.model.PutObjectRequest
import com.amazonaws.services.s3.transfer.Upload
import org.bson.types.ObjectId
import org.springframework.web.multipart.commons.CommonsMultipartFile


class PictureService {
    final String BUCKET_NAME = 'kimlik'
    final String PATH_BASE = 'photos'
    final String URL_BASE = "http://s3.amazonaws.com"
    def amazonWebService

    def delete() {
        amazonWebService.s3.deleteObject(BUCKET_NAME, 'somePath/someKey.jpg')
    }

    /**
     * icinde stream olan multipartFile aliyor
     * dosya adi ve size i lazim
     *
     * @param originalFileName
     */
    def upload2Aws(CommonsMultipartFile file) {
        def originalFileName = file.originalFilename
        def size = file.size
        def stream = file.inputStream
        def contentType = file.contentType


        ObjectMetadata meta = new ObjectMetadata()
        meta.setContentLength(size)
        meta.setContentType(contentType)
        meta.setCacheControl('public, max-age=31104000')

        def extension = originalFileName.tokenize('.').last()
        //todo sadece jpg gif filan kontrolu
        def id = new ObjectId() // database idisi
        def fileName = "${id}.$extension"
        String path = "$PATH_BASE/$fileName"

        //todo listener ekle
        //todo upload bitince database e yaz
        //todo stream kullan
        def por = new PutObjectRequest(BUCKET_NAME, path, stream, meta).withCannedAcl(CannedAccessControlList.PublicRead)
        Upload upload = amazonWebService.transferManager.upload(por)



        while (!upload.done) {
            println "Transfer: $upload.description"
            println "  - State: $upload.state"
            println "  - Progress: $upload.progress.bytesTransferred"
            // Do work while we wait for our upload to complete…
            Thread.sleep(500)
        }
    }

    def store() {
        upload2Aws('')

    }

    def generateUrl(def picture) {

    }
}
