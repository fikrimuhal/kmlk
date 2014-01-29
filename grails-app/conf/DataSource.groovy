grails {
    mongo {
        host = "localhost"
        port = 27017
        databaseName = "kimlik_dev"
    }
}

// environment specific settings
environments {
    production {
        println("Using production database!!!!!!")
        grails {
            mongo {
//                host = "zeus.fikrimuhal.com"
                host = "localhost"
                port = 27017
                databaseName = "kimlik"
            }
        }
    }

    test {
    }

    development {
        grails {
            mongo {
//                host = "zeus.fikrimuhal.com"
                host = "localhost"
                port = 27017
                databaseName = "kimlik"
            }
        }
    }

    staging {
        println("Using STAGING database!!!!!!")
        grails {
            mongo {
                host = "localhost"
                port = 27017
                databaseName = "kimlik_stage"
            }
        }
    }

}
