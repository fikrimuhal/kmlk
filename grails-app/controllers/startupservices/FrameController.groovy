package startupservices

class FrameController {
    def domainService
    def grailsApplication


    def index() {
        cache("private_1day")
//        println '############################## Frame ###################################'

        String requestedDomain = request.getHeader('Host').toLowerCase()
        def page = domainService.domain2Page(requestedDomain)

        if (!page) {
            render status: 523, text: domainNotFoundTemplate
        } else {
            String url = getProfileUrl(page)
            def ga_domain = page.domains[0] ?: page.domains[1]
            return [url: url, googleAnalytics: page.googleAnalytics, ga_domain:ga_domain]
        }
    }

    private getProfileUrl(def page) {
        def base = grailsApplication.config.grails.serverURL.toLowerCase()
        if (page.isCompany) {
            return base + "/company/profile/" + page.pageName
        } else if (page.isProfile) {
            return base + "/kimlik/profile/" + page.pageName
        }
    }


    final String domainNotFoundTemplate = '''
                    <h1>HATA <small>code:523</small></h1>
                    <p>
                        <a href="http://Kimlik.io">Kimlik.io</a> sunucularında böyle bir domain bulunamadı. <br/>
                        Eğer bu domain'i sahibiyseniz yönlendirme ayarlarını doğru yaptığınızdan emin olun.
                    </p>
                  '''
}
