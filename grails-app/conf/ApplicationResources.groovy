import org.codehaus.groovy.grails.web.context.ServletContextHolder

modules = {


    first {
        dependsOn('jquery')
        resource url: 'first/js/bootstrap.js'
        resource url: 'first/js/app.js'

        resource url: 'first/css/bootstrap.css'
        resource url: 'first/css/font-awesome.min.css'
        resource url: 'first/css/font.css' //cache false mu olmasi lazim bunun ??
        resource url: 'first/css/plugin.css'
        resource url: 'first/css/style.css'


    }

    first_deprecated {
        dependsOn('first')
        resource url: 'first/js/app.plugin.js'
        resource url: 'first/js/app.data.js'
//        resource url: 'first/js/file-input/bootstrap.file-input.js'
    }

    landing {
        dependsOn('first')
        resource url: 'first/css/landing.css'
    }

    fileUpload {
        dependsOn(['jquery', 'angularjs'])

        resource url: 'js/lib/blueimp/blueimp-gallery.min.css'
        resource url: 'js/lib/blueimp/jquery.blueimp-gallery.min.js'

        resource url: 'js/lib/fileUpload/css/jquery.fileupload.css'
        resource url: 'js/lib/fileUpload/css/jquery.fileupload-ui.css'
        resource url: 'js/lib/fileUpload/js/vendor/jquery.ui.widget.js'
        resource url: 'js/lib/blueimp/load-image.min.js'
        resource url: 'js/lib/blueimp/canvas-to-blob.min.js'
        resource url: 'js/lib/fileUpload/js/jquery.iframe-transport.js'
        resource url: 'js/lib/fileUpload/js/jquery.fileupload.js'
        resource url: 'js/lib/fileUpload/js/jquery.fileupload-process.js'
        resource url: 'js/lib/fileUpload/js/jquery.fileupload-image.js'
        resource url: 'js/lib/fileUpload/js/jquery.fileupload-audio.js'
        resource url: 'js/lib/fileUpload/js/jquery.fileupload-validate.js'
        resource url: 'js/lib/fileUpload/js/jquery.fileupload-angular.js'
    }

    fmAnalytics {
        dependsOn('angularjs')
        resource url: 'js/services/FmAnalytics.js'
    }

    prettyPhoto {
        resource url: 'first/js/prettyphoto/prettyPhoto.css'
    }

    gallery {
        dependsOn(['jquery', 'prettyPhoto'])
        resource url: 'first/js/grid/gallery.js'
    }
    grid {
        dependsOn('jquery')
        resource url: 'first/js/grid/jquery.grid-a-licious.min.js'
    }


    sparkline {
        dependsOn('jquery')
        resource url: 'first/js/charts/sparkline/jquery.sparkline.min.js'
    }
    easypiechart {
        dependsOn('jquery')
        resource url: 'first/js/charts/easypiechart/jquery.easy-pie-chart.js'
    }

    googleMaps {
        resource url: 'https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBzXlLCgeP354clUpEoZ5zaufpeDDJ5YQ4&sensor=false&language=tr&region=TR', attrs: [type: "js"]
//        resource url: 'first/js/maps/gmaps.js'
    }


    bootstrap3 {
        dependsOn('jquery')

        resource url: 'http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css'
        resource url: 'http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js'
    }

    company {
        dependsOn(['lodash', 'angularjs','fmAnalytics'])

        resource url: 'js/app.js'
        resource url: 'js/companyControllers.js'
        resource url: 'js/profileControllers.js'
        resource url: 'js/controllers.js'
        resource url: 'js/services.js'
        resource url: 'js/filters.js'
        resource url: 'js/directives.js'
    }


    kimlik {
        dependsOn(['theme', 'lodash', 'angularjs'])


        resource url: 'js/app.js'
        resource url: 'js/companyControllers.js'
        resource url: 'js/profileControllers.js'
        resource url: 'js/controllers.js'
        resource url: 'js/services.js'
        resource url: 'js/filters.js'
        resource url: 'js/directives.js'
    }

    kimlik_register {
        dependsOn(['angularjs'])
        resource url: 'js/app.js'
        resource url: 'js/controllers.js'
        resource url: 'js/services.js'
        resource url: 'js/filters.js'
        resource url: 'js/directives.js'
    }

    angularjs {
        dependsOn('jquery')
        resource url: 'js/lib/angular/angular.min.js', disposition: 'head'
        resource url: 'js/lib/angular/angular-animate.min.js', disposition: 'head'
        resource url: 'js/lib/angular/angular-resource.min.js', disposition: 'head'
        resource url: 'js/lib/angular/angular-sanitize.min.js', disposition: 'head'
        resource url: 'js/lib/angular/angular-touch.min.js', disposition: 'head'
        resource url: 'js/lib/angular-ui/ui-bootstrap-tpls-0.6.0.min.js', disposition: 'head'

        resource url: 'js/lib/angular/angular-route.min.js', disposition: 'head'
        resource url: 'js/lib/angular-route-segment/angular-route-segment.min.js'


    }


    application {
        resource url: 'js/application.js'
    }



    /**
     * @Deprecated
     */
    fresh {
        defaultBundle 'fresh'
        dependsOn(['angularjs', 'angularUiRoute', 'httpAuthInterceptor', 'lodash', 'angularStorageProvider'])
        resource url: 'js/app.js'
        resource url: 'js/controllers.js'
        resource url: 'js/services.js'
        resource url: 'js/filters.js'
        resource url: 'js/directives.js'
    }

    /**
     * @Deprecated
     */
    freshServices {
        defaultBundle 'fresh'
        dependsOn(['fresh', 'lodash'])
        getFilesForPath('/js/services').each {
            resource url: it
        }
    }

    /**
     * @Deprecated
     */
    freshControllers {
        defaultBundle 'fresh'
        dependsOn(['fresh', 'lodash'])

        getFilesForPath('/js/controllers').each {
            resource url: it
        }
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


