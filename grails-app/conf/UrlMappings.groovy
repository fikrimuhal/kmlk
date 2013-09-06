class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?" {
            constraints {
                // apply constraints here
            }
        }

        "/kimlik/$user?/skills"(view: "/kimlik/skills")
        "/kimlik/$user?"(view: "/kimlik/kimlik")



        "/"(view: "/landing")

        "/landing"(view: "/landing")
        "/login"(view: "/login")
        "/register"(view: "/register")

        "/emailConfirm"(view: "/emailConfirm") //email ile yollanan confirm link
        "/passForgot"(view: "/passForgot")     //parolami unuttum sayfasi
        "/passForgot"(view: "/passForgot")

        "/contact"(view: "/contact")
        "/about"(view: "/about")
        "/pricing"(view: "/pricing")
        "/help"(view: "/help")

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

        "500"(view: '/error')
        "404"(view: '/404')
    }
}
