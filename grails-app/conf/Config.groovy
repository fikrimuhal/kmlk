// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [
        all: '*/*',
        atom: 'application/atom+xml',
        css: 'text/css',
        csv: 'text/csv',
        form: 'application/x-www-form-urlencoded',
        html: ['text/html', 'application/xhtml+xml'],
        js: 'text/javascript',
        json: ['application/json', 'text/json'],
        multipartForm: 'multipart/form-data',
        rss: 'application/rss+xml',
        text: 'text/plain',
        hal: ['application/hal+json', 'application/hal+xml'],
        xml: ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// Legacy setting for codec used to encode data with ${}
grails.views.default.codec = "html"

// The default scope for controllers. May be prototype, session or singleton.
// If unspecified, controllers are prototype scoped.
grails.controllers.defaultScope = 'singleton'

// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside ${}
                scriptlet = 'html' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        filteringCodecForContentType {
            //'text/html' = 'html'
        }
    }
}

grails.converters.encoding = "UTF-8"
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart = false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

grails.resources.debug = false
grails.cache.clearAtStartup = true

grails.gorm.default.constraints = {
    '*'(nullable: true)
}

environments {
    development {
        grails.logging.jul.usebridge = true
        //ipfw add 10 fwd 127.0.0.1,8080 tcp from any to me 80
        grails.serverURL = "http://localhost.kimlik.io"
        grails.app.context = "/"
        grails.resources.debug = false
        cache.headers.enabled = false


    }
    production {
        grails.logging.jul.usebridge = false
        grails.serverURL = "http://kimlik.io"
        grails.app.context = "/"
        grails.resources.debug = false
        cache.headers.enabled = true

    }

    test {
        grails.logging.jul.usebridge = false
        grails.serverURL = "http://localhost.kimlik.io:8080"
        grails.app.context = "/"
        grails.resources.debug = false
        cache.headers.enabled = false


    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error 'org.codehaus.groovy.grails.web.servlet',        // controllers
            'org.codehaus.groovy.grails.web.pages',          // GSP
            'org.codehaus.groovy.grails.web.sitemesh',       // layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping',        // URL mapping
            'org.codehaus.groovy.grails.commons',            // core / classloading
            'org.codehaus.groovy.grails.plugins',            // plugins
            'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate'

    debug 'grails.app.controllers',
            'grails.app.services',
            'grails.app.domain',
            'grails.app.filters'
//            'org.apache.http.headers',
//            'org.apache.http.wire'
}

oauth {
    providers {
        twitter { //todo Bu sental yeni app kaydet
            api = org.scribe.builder.api.TwitterApi
            key = '***REMOVED***'
            secret = '***REMOVED***'
            callback = "${grails.serverURL}/oauth/twitter/callback"
            successUri = '/register/success/twitter'
            failureUri = '/register/failure/twitter'
        }
        facebook {
            api = org.scribe.builder.api.FacebookApi
            key = '***REMOVED***'
            secret = '***REMOVED***'
            callback = "${grails.serverURL}/oauth/facebook/callback"
            successUri = '/register/success/facebook'
            failureUri = '/register/failure/facebook'
            scope="email"
        }
        linkedin {//todo bu partical app yeni app kaydet
            api = org.scribe.builder.api.LinkedInApi
            key = '***REMOVED***'
            secret = '***REMOVED***'
            callback = "${grails.serverURL}/oauth/linkedin/callback"
            successUri = '/register/success/linkedin'
            failureUri = '/register/failure/linkedin'
        }
        google {//todo bu partical app yeni app kaydet
            api = org.scribe.builder.api.GoogleApi
            key = '***REMOVED***'
            secret = '***REMOVED***'
            callback = "${grails.serverURL}/oauth/google/callback"
            successUri = '/register/success/google'
            failureUri = '/register/failure/google'
        }
    }
//    debug = true

}



cache.headers.presets = [
        nocache: false,
        static_html_template: [shared: true, validFor: 60 * 60 * 24],
        public_3600: [shared: true, validFor: 3600],
        public_60: [shared: true, validFor: 60],
        public_10: [shared: true, validFor: 10],
        private_300: [shared: false, validFor: 300],
        private_5: [shared: false, validFor: 5]
]


grails.mail.host = "email-smtp.us-east-1.amazonaws.com"
grails.mail.port = "587"
grails.mail.username = "***REMOVED***"
grails.mail.password = "***REMOVED***"
grails.mail.props = ["mail.smtp.auth": "true",
        "mail.smtp.socketFactory.port": "465",
        "mail.smtp.socketFactory.class": "javax.net.ssl.SSLSocketFactory",
        "mail.smtp.socketFactory.fallback": "false"
]



tomcat.deploy.username = "bamboo"
tomcat.deploy.password = "***REMOVED***"
tomcat.deploy.url = "http://localhost:8080/manager"












// Uncomment and edit the following lines to start using Grails encoding & escaping improvements

/* remove this line 
// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside null
                scriptlet = 'none' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        filteringCodecForContentType {
            //'text/html' = 'html'
        }
    }
}
remove this line */

grails.plugin.awssdk.accessKey = '***REMOVED***'
grails.plugin.awssdk.secretKey = '***REMOVED***'
grails.plugin.awssdk.region = 'us-east-1'



