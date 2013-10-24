package startupservices

class AuthenticationFilters {
    def persistentLoginService
    def authenticationService

    def filters = {
        all(controller: 'html', action: '*', invert: true) {
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
}
