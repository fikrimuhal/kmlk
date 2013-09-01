class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"/landing"(view:"/landing")
		"/login"(view:"/login")
		"/register"(view:"/register")
		"/contact"(view:"/contact")

		"/dashboard"(view:"/index")
		"/profile"(view:"/s/profile")

		"/company"(view:"/s/company")
		"/company/people"(view:"/s/companyPeople")
		"/company/people/ilgaz"(view:"/s/companyPerson")
        "/people"(view:"/s/people")
        "/projects"(view:"/s/projects")
        "/project/makalepazari"(view:"/s/project")


        "/hr"(view:"/s/hr")
        "/muasebe"(view:"/s/muasebe")
        "/avukat"(view:"/s/avukat")
        "/matbaa"(view:"/s/matbaa")
        "/finans"(view:"/s/finans")
        "/yazilimGelistirme"(view:"/s/yazilimGelistirme")
        "/markaYonetimi"(view:"/s/markaYonetimi")
        "/markaTescil"(view:"/s/markaTescil")
        "/satinalma"(view:"/s/satinalma")
        "/tercume"(view:"/s/tercume")
        "/yemek"(view:"/s/yemek")
        "/egitim"(view:"/s/egitim")
        "/etkinlik"(view:"/s/etkinlik")
        "/projeFinans"(view:"/s/projeFinans")

		"500"(view:'/error')
		"404"(view:'/404')
	}
}
