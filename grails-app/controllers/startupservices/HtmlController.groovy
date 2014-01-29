package startupservices

class HtmlController {

    def index(String main, String path) {
        cache("public_3600")

        render view: "/$main/html/$path"
    }

    def mainAppLayout(){
        cache("public_3600")
    }
}
