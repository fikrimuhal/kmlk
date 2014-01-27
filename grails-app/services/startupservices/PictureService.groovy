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

    def delete(ObjectId pictureId) {
        def picture = getPictureById(pictureId)
        assert picture
        amazonWebService.s3.deleteObject(BUCKET_NAME, picture.path)
        picture.delete()
    }

    /**
     * icinde stream olan multipartFile aliyor
     * dosya adi ve size i lazim
     *
     * @param originalFileName
     */
    def upload2Aws(def file, String source, ObjectId owner, boolean doNotWaitUpload = false) {
        def size, stream, contentType, extension
        if (file instanceof CommonsMultipartFile) {
            println 'type file'
            size = file.size
            stream = file.inputStream
            contentType = file.contentType
            extension = file.originalFilename.tokenize('.').last()

        } else if (file instanceof URL) {

            println 'type url'
            def connection = file.openConnection()

            size = connection.contentLength
            stream = connection.inputStream
            contentType = connection.contentType
            extension = file.file.tokenize('.').last()


        } else {
            throw new UnsupportedOperationException('Only URL or CommonsMultipartFile supported...')
        }


        ObjectMetadata meta = new ObjectMetadata()
        meta.setContentLength(size)
        meta.setContentType(contentType)
        meta.setCacheControl('public, max-age=31104000')

        //todo sadece jpg gif filan kontrolu

        def id = new ObjectId() // database idisi

        def fileName = "${id}.$extension"
        String path = "$PATH_BASE/$fileName"

        //todo listener ekle
        //todo upload bitince database e yaz
        def por = new PutObjectRequest(BUCKET_NAME, path, stream, meta).withCannedAcl(CannedAccessControlList.PublicRead)

        assert amazonWebService

        Upload upload = amazonWebService.transferManager.upload(por)


        if (!doNotWaitUpload) {
            while (!upload.done) {
                println "Transfer: $upload.description"
                println "  - State: $upload.state"
                println "  - Progress: $upload.progress.bytesTransferred"
                // Do work while we wait for our upload to complete…
                Thread.sleep(500)
            }
        }
        //ok now we create db entity

        return saveToDb(id, path, source, owner)

    }

    def store() {
        upload2Aws('')

    }

    def generateUrl(def picture) {

    }

    def saveToDb(ObjectId id, String path, String source, ObjectId ownerId) {
        log.debug('Saving to database picture')
        Picture picture = new Picture(
                id: id,
                path: path,
                bucket: BUCKET_NAME,
                url: "${URL_BASE}/$BUCKET_NAME/$path".toString(),
                owner: Profile.get(ownerId),
                broken: false,
                source: source

        ).save(flush: true, failOnError: true)
        println ' resmi kaydettik'
        return picture
    }

    def getPictureById(ObjectId pictureId) {
        Picture.get(pictureId)
    }

}
