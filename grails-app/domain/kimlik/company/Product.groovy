package kimlik.company

import org.bson.types.ObjectId

class Product {

    ObjectId id // buna gerek yok

    String title
    String about
    String url
    boolean isPublic

    static constraints = {
    }
}
