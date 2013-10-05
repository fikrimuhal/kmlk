grails.servlet.version = "3.0" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.work.dir = "target/work"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.fork = [
        // configure settings for compilation JVM, note that if you alter the Groovy version forked compilation is required
        //  compile: [maxMemory: 256, minMemory: 64, debug: false, maxPerm: 256, daemon:true],

        // configure settings for the test-app JVM, uses the daemon by default
        test: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, daemon:true],
        // configure settings for the run-app JVM
        run: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve:false],
        // configure settings for the run-war JVM
        war: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve:false],
        // configure settings for the Console UI JVM
        console: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256]
]

grails.project.dependency.resolver = "maven" // or ivy
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        mavenLocal()
        grailsCentral()
        mavenCentral()
        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
        mavenRepo "http://twitter4j.org/maven2"

    }

    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes e.g.

        // runtime 'mysql:mysql-connector-java:5.1.22'
        compile('org.codehaus.groovy.modules.http-builder:http-builder:0.5.2') {
            excludes "commons-logging", "xml-apis", "groovy"
        }

       compile 'oauth.signpost:signpost-core:1.2.1.2'
       compile 'oauth.signpost:signpost-commonshttp4:1.2.1.2'
        compile "net.sf.ehcache:ehcache-core:2.4.6"

        // Workaround to resolve dependency issue with aws-java-sdk and http-builder (dependent on httpcore:4.0)
        build 'org.apache.httpcomponents:httpcore:4.2'
        build 'org.apache.httpcomponents:httpclient:4.2'
        runtime 'org.apache.httpcomponents:httpcore:4.2'
        runtime 'org.apache.httpcomponents:httpclient:4.2'



    }

    plugins {
        // plugins for the build system only
        build ":tomcat:7.0.42"

        // plugins for the compile step
        compile ":scaffolding:2.0.0"
        compile ':cache:1.1.1'

        // plugins needed at runtime but not for compilation
//        runtime ":hibernate:3.6.10.1" // or ":hibernate4:4.1.11.1"
//        runtime ":database-migration:1.3.5"
        runtime ":jquery:1.10.2"
        runtime ":resources:1.2"
        // Uncomment these (or add new ones) to enable additional resources capabilities
        //runtime ":zipped-resources:1.0.1"
        //runtime ":cached-resources:1.1"
        //runtime ":yui-minify-resources:0.1.5"

        runtime ':oauth:2.0.1'

        compile ":mongodb:1.3.0"
        compile ":quartz2:2.1.6.2"

//        compile ":mail:1.0.1"

        runtime ":cached-resources:1.0"
        compile ":cache-headers:1.1.5"

     compile ":aws-sdk:1.6.0"


//        compile ":grails-melody:1.47" // /monitoring todo: AA ekle filter olabilir simdilik
    }
}
