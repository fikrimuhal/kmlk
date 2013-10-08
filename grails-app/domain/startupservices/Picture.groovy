package startupservices

import org.bson.types.ObjectId

class Picture {

    ObjectId id

    String path // without domain name or bucket name    (significant part) includes filename and ext.

    String bucket

    String url // domain + bucket /+ path

    Profile owner

    boolean broken // file does not exists in aws

    String source // facebook, linkedin, twitter, upload

    static constraints = {
        owner nullable: true
    }
}
