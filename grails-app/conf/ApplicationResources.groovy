import org.codehaus.groovy.grails.web.context.ServletContextHolder

modules = {
    application {
        resource url: 'js/application.js'
    }


    fresh {
        defaultBundle 'fresh'
        dependsOn(['angularjs', 'angularUiRoute', 'httpAuthInterceptor', 'lodash', 'angularStorageProvider'])
        resource url: 'js/app.js'
        resource url: 'js/controllers.js'
        resource url: 'js/services.js'
        resource url: 'js/filters.js'
        resource url: 'js/directives.js'
    }

    freshServices {
        defaultBundle 'fresh'
        dependsOn(['fresh', 'lodash'])
        getFilesForPath('/js/services').each {
            resource url: it
        }
    }
    freshControllers {
        defaultBundle 'fresh'
        dependsOn(['fresh', 'lodash'])

        getFilesForPath('/js/controllers').each {
            resource url: it
        }
    }

    angularjs {
        resource url: 'js/lib/angular/angular.min.js'
        resource url: 'js/lib/angular/angular-resource.min.js'
        resource url: 'js/lib/angular/angular-cookies.min.js'

    }

    angularUiRoute {
        dependsOn('angularjs')
        resource url: 'js/lib/angular-ui/angular-ui-router.min.js'
    }

    httpAuthInterceptor {
        defaultBundle 'fresh'
        //https://github.com/witoldsz/angular-http-auth/blob/master/src/http-auth-interceptor.js
        dependsOn('angularjs')
        resource url: 'js/lib/http-auth-interceptor/http-auth-interceptor.js'
    }

    lodash {
        resource url: 'js/lib/lodash/lodash.min.js'
    }

    angularStorageProvider {
        defaultBundle 'fresh'
        dependsOn('angularjs')
        resource url: 'js/lib/storageprovider/storageprovider.js'
    }
}


def dev = grails.util.GrailsUtil.isDevelopmentEnv()

/**
 * add files reqursivly as resource
 *
 * <code>
 *     getFilesForPath('/js/fresh/services').each {*       resource url: it
 *}* <code>
 *
 * @param path
 * @return
 */
def getFilesForPath(def path) {

    def webFileCachePaths = []

    def servletContext = ServletContextHolder.getServletContext()

    //context isn't present when testing in integration mode. -jg
    if (!servletContext) return webFileCachePaths

    def realPath = servletContext.getRealPath('/')

    def appDir = new File("$realPath/$path")

    appDir.eachFileRecurse { File file ->
        if (file.isDirectory() || file.isHidden()) return
        webFileCachePaths << file.path.replace(realPath, '')
    }

    webFileCachePaths
}