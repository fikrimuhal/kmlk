class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?" {
            constraints {
                // apply constraints here
            }
        }

        "/kimlik/$username?/$action?"(controller: 'kimlik')
        "/api/skill/$action"(controller: 'skill')

//        "/kimlik/$user?/follow"(view: "/kimlik/followPage")
//        "/kimlik/$user?/education"(view: "/kimlik/educationPage")
//        "/kimlik/$user?/employment"(view: "/kimlik/employmentPage")
//        "/kimlik/$user?/skills"(view: "/kimlik/skills")
//        "/kimlik/$user?"(view: "/kimlik/kimlik")


        "/"(controller: "register", action: 'index')
        "/help/terms"(view: "/help_terms")
        "/help/ik"(view: "/help_ik")
        "/help/register"(view: "/help")
        "/help"(view: "/help")

        "/login"(view: "/login")

        "/landing"(view: "/landing")

        "/emailConfirm"(view: "/emailConfirm") //email ile yollanan confirm link
        "/passForgot"(view: "/passForgot")     //parolami unuttum sayfasi

        "/contact"(view: "/contact")
        "/about"(view: "/about")
        "/pricing"(view: "/pricing")

        "/dashboard"(view: "/index")
        "/profile"(view: "/s/profile")

        "/company"(view: "/s/company")
        "/company/people"(view: "/s/companyPeople")
        "/company/people/ilgaz"(view: "/s/companyPerson")
        "/profile/ilgaz"(view: "/s/companyPerson")
        "/profile/ilgaz/skills"(view: "/s/profile/profileSkills")
        "/profile/ilgaz/certificates"(view: "/s/profile/profileCertificates")

        "/people"(view: "/s/people")
        "/projects"(view: "/s/projects")
        "/project/makalepazari"(view: "/s/project")


        "/hr"(view: "/s/hr")
        "/muasebe"(view: "/s/muasebe")
        "/avukat"(view: "/s/avukat")
        "/matbaa"(view: "/s/matbaa")
        "/finans"(view: "/s/finans")
        "/yazilimGelistirme"(view: "/s/yazilimGelistirme")
        "/markaYonetimi"(view: "/s/markaYonetimi")
        "/markaTescil"(view: "/s/markaTescil")
        "/satinalma"(view: "/s/satinalma")
        "/tercume"(view: "/s/tercume")
        "/yemek"(view: "/s/yemek")
        "/egitim"(view: "/s/egitim")
        "/etkinlik"(view: "/s/etkinlik")
        "/projeFinans"(view: "/s/projeFinans")

        // "500"(view: '/error')
        "404"(view: '/404')
    }
}
