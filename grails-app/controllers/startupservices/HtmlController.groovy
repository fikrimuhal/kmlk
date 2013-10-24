package startupservices

class HtmlController {

    def index(String main, String path) {
        render view: "/$main/html/$path"
    }
}
