import org.codehaus.groovy.grails.web.context.ServletContextHolder

modules = {


    first {
        dependsOn('jquery')
        resource url: '/first/js/bootstrap.js'
        resource url: '/first/js/app.js'

        resource url: '/first/css/bootstrap.css'
        resource url: '/first/css/font-awesome.min.css'
        resource url: '/first/css/font.css' //cache false mu olmasi lazim bunun ??
        resource url: '/first/css/plugin.css'
        resource url: '/first/css/style.css'


    }

    first_deprecated {
        dependsOn('first')
        resource url: '/first/js/app.plugin.js'
        resource url: '/first/js/app.data.js'
    }

    sparkline {
        dependsOn('jquery')
        resource url: '/first/js/charts/sparkline/jquery.sparkline.min.js'
    }
    easypiechart {
        dependsOn('jquery')
         resource url: '/first/js/charts/easypiechart/jquery.easy-pie-chart.js'
    }

    googleMaps {
        resource  url:'http://maps.google.com/maps/api/js?sensor=true', attrs: [cache: 'false',type: "js"]
        resource  url:'/first/js/maps/gmaps.js'
    }


    bootstrap3 {
        dependsOn('jquery')

        resource url: 'http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css'
        resource url: 'http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js'
    }

    company {
        dependsOn(['lodash', 'angularjs'])

        resource url: 'js/app.js'
        resource url: 'js/controllers.js'
        resource url: 'js/services.js'
        resource url: 'js/filters.js'
        resource url: 'js/directives.js'
    }


    kimlik {
        dependsOn(['theme', 'lodash', 'angularjs'])


        resource url: 'js/app.js'
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
        resource url: 'http://code.angularjs.org/snapshot/angular.min.js', disposition: 'head'
        resource url: 'http://code.angularjs.org/snapshot/angular-animate.min.js', disposition: 'head'
        resource url: 'http://code.angularjs.org/snapshot/angular-resource.min.js', disposition: 'head'
        resource url: 'http://code.angularjs.org/snapshot/angular-sanitize.min.js', disposition: 'head'
        resource url: 'http://code.angularjs.org/snapshot/angular-touch.min.js', disposition: 'head'
        resource url: 'http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.6.0.js', disposition: 'head'

        resource url: 'http://code.angularjs.org/snapshot/angular-route.min.js', disposition: 'head'
        resource url: 'js/lib/angular-route-segment/angular-route-segment.min.js'


    }

    /**
     * @Deprecated
     */
    theme {
        dependsOn('jquery')
        resource url: 'http://code.jquery.com/jquery-migrate-1.2.1.min.js'

        //  <!-- Bootstrap -->
        resource url: '/bootstrap/css/bootstrap.min.css'
        //    <!-- Bootstrap Extended -->
        resource url: '/bootstrap/extend/jasny-bootstrap/css/jasny-bootstrap.min.css'
        resource url: '/bootstrap/extend/jasny-bootstrap/css/jasny-bootstrap-responsive.min.css'
        //    <!-- JQueryUI v1.9.2 -->

        resource url: '/kimlik/scripts/jquery-ui-1.9.2.custom/css/smoothness/jquery-ui-1.9.2.custom.min.css'
        resource url: '/kimlik/css/glyphicons.css'
        resource url: '/bootstrap/extend/bootstrap-select/bootstrap-select.css'
        resource url: '/bootstrap/extend/bootstrap-toggle-buttons/static/stylesheets/bootstrap-toggle-buttons.css'
        resource url: '/kimlik/scripts/pixelmatrix-uniform/css/uniform.default.css'
        resource url: '/kimlik/scripts/modernizr.custom.76094.js', disposition: 'head'
        resource url: '/kimlik/scripts/jquery-miniColors/jquery.miniColors.css'
        resource url: '/kimlik/scripts/jquery-lightbox/js/jquery.lightbox-0.5.js'
        resource url: '/kimlik/scripts/prettyphoto/js/jquery.prettyPhoto.js'
        resource url: '/kimlik/scripts/jquery-lightbox/css/jquery.lightbox-0.5.css'
        resource url: '/kimlik/scripts/prettyphoto/css/prettyPhoto.css'
        resource url: '/kimlik/css/style.min.css?1363976729'
        resource url: '/kimlik/scripts/prettyphoto/css/prettyPhoto.css'

        resource url: '/kimlik/scripts/jquery-ui-1.9.2.custom/js/jquery-ui-1.9.2.custom.min.js'
        resource url: '/kimlik/scripts/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'
        resource url: '/kimlik/scripts/jquery-miniColors/jquery.miniColors.js'
//        resource url: '/kimlik/scripts/jquery.cookie.js'
//        resource url: '/kimlik/scripts/jquery.ba-resize.js'
        resource url: '/kimlik/scripts/pixelmatrix-uniform/jquery.uniform.min.js'
        resource url: '/bootstrap/js/bootstrap.min.js'
        resource url: '/bootstrap/extend/bootstrap-select/bootstrap-select.js'
        resource url: '/bootstrap/extend/bootstrap-toggle-buttons/static/js/jquery.toggle.buttons.js'
        resource url: '/bootstrap/extend/jasny-bootstrap/js/bootstrap-fileupload.js'
//        resource url: '/kimlik/scripts/jquery-animate-css-rotate-scale/jquery-css-transform/jquery-css-transform.js'
//        resource url: '/kimlik/scripts/jquery-animate-css-rotate-scale/jquery-animate-css-rotate-scale.js'
//        resource url: '/kimlik/scripts/jquery.quicksand.js'
        resource url: '/kimlik/scripts/jquery.easing.1.3.js'
        resource url: '/kimlik/scripts/load.js'
        resource url: '/kimlik/scripts/jquery.masonry.min.js'
    }

    ////////////////////
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