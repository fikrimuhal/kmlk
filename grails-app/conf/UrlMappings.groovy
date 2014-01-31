class UrlMappings {

    static mappings = {
        "/html/$main/$path**.html"(controller: 'html', action: 'index')

        "/$controller/$action?/$id?" {
            constraints {
                // apply constraints here
            }
        }

        "/api/$controller/$action?/$id?" {}
        //"/kimlik/$username?/$action?"(controller: 'kimlik')

        "/kimlik/**"(controller: 'html', action: 'mainAppLayout')
        "/company/**"(controller: 'html', action: 'mainAppLayout')
        "/admin/**"(controller: 'html', action: 'mainAppLayout')
        "/admin"(controller: 'html', action: 'mainAppLayout')

        "/api/skill/$action"(controller: 'skill')

        "/"(controller: "register", action: 'index')


        "500"(view: '/500')
        "404"(view: '/404')
    }
}
