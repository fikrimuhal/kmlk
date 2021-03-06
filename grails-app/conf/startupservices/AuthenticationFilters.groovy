package startupservices

class AuthenticationFilters {
    def persistentLoginService
    def authenticationService
    def domainService
    def grailsApplication

    def filters = {
//        google(controller: '*', action: '*') {
//            before = {
//                boolean isCrawler = webRequest.params._escaped_fragment_ != null
//                if (isCrawler && !request._alreadyForwarded) {
//                    request._alreadyForwarded = true
//                    forward controller: 'test', action: 'hashTest'
//
//                }
//            }
//        }

        /**
         * kimliklocal.fikrimuhal.com + ?_escaped_fragment_=
         * kimliklocal.fikrimuhal.com
         * fikrimuhal.com
         * www.fikrimuhal.com
         * ilgazsumnulu.com
         * todo external domain e gore cozumlenmeli database den bakilacak
         * bunu yeni bir controller a forwardlayacagiz yada databaseden burada bakicaz
         */
        cnameDomainForwarder(controller: '*', action: '*') {
            before = {
                if (request._alreadyForwarded) return

                String requestedHost = request.getHeader('Host').toLowerCase()

                if (requestedHost.endsWith(domain)) return

                //this is external request ( maybe requested inside iframe)

                boolean isCrawler = webRequest.params.containsKey('_escaped_fragment_')
                if (isCrawler) {
                    //hello google crawler!
                    //suanda frame render etmek yerine sayfayi render edecegiz
                    log.debug('=======HELLOOO GOOGLE CRAWLER=======')



                    def _page = domain2Page(requestedHost)

                    if (_page) {
                        // ok we got something :) person or company
                        request._alreadyForwarded = true
                        webRequest.params.id = _page.pageName

                        if (_page.isCompany) {
                            //this is a company page
                            forward controller: 'company', action: 'profile', params: webRequest.params

                        } else if (_page.isProfile) {
                            //this is a person page
                            forward controller: 'kimlik', action: 'profile', params: webRequest.params

                            //todo forward controller: 'personTODO', action: 'profile', params: webRequest.params

                        }
                    } else {
                        //boyle bir domain tanimiyoruz!
                        //todo redirect to upgrade page
                    }

                } else {
                    // hello human!
//                    log.debug(' hello human!')
//
                    request._alreadyForwarded = true
                    forward controller: 'frame', action: 'index'


                }
            }
        }


        authentication(controller: 'html', action: '*', invert: true) {
            before = {
                if (!authenticationService.loggedIn) {
                    def r = authenticationService.authenticate()
                }
            }
            after = { Map model ->
                if (authenticationService.loggedIn && !persistentLoginService.deviceRegistered) {
                    persistentLoginService.registerCurrentDevice()
                }
            }
            afterView = { Exception e ->

            }
        }
    }

    private getDomain() {
        grailsApplication.config.grails.serverURL.toLowerCase() - 'http://'

    }

    private domain2Page(domain) {
        return domainService.domain2Page(domain)


    }

}
