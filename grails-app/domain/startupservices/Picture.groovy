package startupservices

import org.bson.types.ObjectId

class Picture {
    def pictureService

    ObjectId id

    String path // without domain name or bucketname    (significant part) includes filename and ext.

    String bucket

    String url // domain + bucket /+ path

    Profile owner

    boolean broken // file does not exists in aws

    String source // facebook, linkedin, twitter, upload

    static constraints = {
    }
}
