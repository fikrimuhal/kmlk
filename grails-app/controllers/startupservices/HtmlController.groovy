package startupservices

class HtmlController {

    def index(String main, String path) {
//        cache("static_html_template")
        cache("static_html_template")

        render view: "/$main/html/$path"
    }

    def mainAppLayout(){
//        cache("static_html_template")
        cache("static_html_template")
    }
}
