import com.mongodb.DBRef
import grails.converters.JSON
import kimlik.company.Company
import kimlik.company.CompanyName
import org.bson.types.ObjectId
import startupservices.DomainToPage
import startupservices.Profile
import startupservices.Skill

class BootStrap {

    def init = { servletContext ->
        configure()

        //todo mock change me
        if (!Skill.count) {
            [
                    new Skill(name: 'Java'),
                    new Skill(name: 'Web Tasarim'),
                    new Skill(name: 'CSS'),
                    new Skill(name: 'HTML'),
                    new Skill(name: 'javascript'),
                    new Skill(name: 'Groovy'),
                    new Skill(name: 'Grails'),
                    new Skill(name: 'Object oriented Programming'),
                    new Skill(name: 'Functional Programming'),
                    new Skill(name: 'Web Services'),
                    new Skill(name: 'MongoDB'),
                    new Skill(name: 'SQL'),
                    new Skill(name: 'NoSql')
            ].each {
                it.nameLower = it.name.toLowerCase()
                it.save()
            }

        }
        if (!Company.count) {
            def sumnulu = Profile.findById(new ObjectId("5253388e0fb8a098ad784d84"))
            println 'Bootstrap new demo companies'
            new Company(
                    owner: sumnulu,

                    name: new CompanyName(
                            oneWord: 'Fikrimuhal',
                            significantPart: 'Fikrimuhal Teknoloji',
                            legalType: 'Ltd. Şti.',
                            pageName: 'fikrimuhal',
                            fullLegal: 'Fikrimuhal Teknoloji Ar. Ge. LTD. STİ'
                    ),
                    page_name: 'fikrimuhal',
                    short_name: 'Fikrimuhal',
                    full_name: 'Fikrimuhal Teknoloji Ar. Ge. LTD. ŞTİ.',
                    industry: 'Yazılım',
                    tags: ['Internet', ' Startuplar', ' İnsankaynakları', ' Sosyal networkler', ' SAS'],
                    email: 'info@fikrimuhal.com',
                    tel: '543646363565634',
                    www: 'http://www.fikrimuhal.com',
                    about: 'Fikrimuhal Teknoloji hakkinda uzuuun uzuun ama cok uzun olmayan bio about as yazisi.',
                    employees: [sumnulu],
                    products: [],
                    timeline: []
            ).save(flush: true, failOnError: true)

            new Company(
                    owner: sumnulu,
                    name: new CompanyName(
                            oneWord: 'Acikdemokrasi',
                            significantPart: 'Acikdemokrasi ',
                            legalType: 'A.Ş.',
                            pageName: 'acikdemokrasi',
                            fullLegal: 'Açık demokrasi A.Ş.'
                    ),
                    page_name: 'acikdemokrasi',
                    short_name: 'Açıkdemokrasi',
                    full_name: 'Açık demokrasi A.Ş.',
                    industry: 'STK',
                    tags: ['STK', 'Sivil toplum kurulusu', 'internet'],
                    email: 'info@acikdemokrasi.org',
                    tel: '54364636300034',
                    www: 'http://www.acikdemokrasi.org',
                    about: 'Acik demokrasi hakkinda uzuuun uzuun ama cok uzun olmayan bio about as yazisi.',
                    employees: [sumnulu],
                    products: [],
                    timeline: []
            ).save(flush: true, failOnError: true)
        }


        if (!DomainToPage.count) {

            new DomainToPage(
                    pageName: 'fikrimuhal',
                    isCompany: true,
                    domains: ['kimliklocal.fikrimuhal.com', 'fikrimuhal.com'],
                    enabled: true
            ).save()
        }
        //
//        def fikrimuhal = Company.findByPage_name('fikrimuhal')
//        fikrimuhal.domainToPage = DomainToPage.findByPageNameAndIsCompany('fikrimuhal',true)
//        fikrimuhal.save()
//        assert false
    }

    def destroy = {
    }

    private void configure() {
        registerJsonHandlers()
    }

    private void registerJsonHandlers() {
        JSON.registerObjectMarshaller(ObjectId) {
            it.toString()
        }

        JSON.registerObjectMarshaller(DBRef) {
            [ref: it.ref, id: it.id]
        }

    }
}


