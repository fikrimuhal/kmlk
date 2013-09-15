package startupservices

import grails.converters.JSON
import groovyx.net.http.RESTClient
import kimlik.account.Accounts
import kimlik.account.Address
import kimlik.account.ContactInfo
import kimlik.account.Facebook
import kimlik.account.MapCoordinates
import kimlik.account.history.GeneralisedHistory
import kimlik.account.history.HistoryEntity
import org.bson.types.ObjectId
import org.scribe.model.Token
import uk.co.desirableobjects.oauth.scribe.OauthService
import org.scribe.model.Response


class RegisterController {
    final String FACEBOOK_GRAPH_URL = 'https://graph.facebook.com/'
    def random = new Random()
    def index() {
    }

    def failure() {
        render 'fail'
    }

    //social callback
    def success() {
        def data = fetchFacebookData()

        def facebookId = data.id
        def result = Profile.collection.findOne(['accounts.facebook.remoteId': facebookId])

        if (result) {
            session.loggedinProfileId = result._id
            log.debug(session.loggedinProfileId)
            redirect(controller: 'kimlik', params: [username: result.username], fragment: '')
        } else {
            session.facebookRaw = data

        }


    }

    def ajaxCreate() {
        Boolean userNameExists = Profile.countByUsername(params.username) != 0
        if (userNameExists) {
            render(code: 404)
        }
        def fbData = session.facebookRaw
        assert fbData
        assert fbData.id
        println fbData.id


        //===============================
        def profile = new Profile(
                username: params.username,
                first_name: fbData.first_name,
                last_name: fbData.last_name,
                middle_name: fbData.middle_name,
                registered: true,
                accounts: new Accounts(
                        facebook: new Facebook(
                                remoteId: fbData.id,
                                first_name: fbData.first_name,
                                last_name: fbData.last_name,
                                middle_name: fbData.middle_name,
                        )
                ),
                contactInfo: new ContactInfo(
                        primaryEmail: 'sumnulu@gmail.com',
                        publicEmail: 'sumnulu@gmail.com',
                        authenticatedEmails: ['sumnulu@gmail.com'],
                        unAuthenticatedEmails: ['ilgaz@fikrimuhal.com'],

                        publicTel: '333 55 44',

                        address: new Address(
                                country: 'Turkey',
                                city: 'Istanbul',
                                other: 'Elysium garden k4, cekmekoy',
                                googleMapsCoordinates: new MapCoordinates(
                                        latitude: 41.0136,
                                        longitude: 28.9550,
                                        zoomLevel: 1000
                                )
                        ),
                        webSite: 'www.kimlik.io'
                ),
                educationHistory: new GeneralisedHistory(
                        history: [
                                new HistoryEntity(startDate: new Date(), endDate: new Date(), entity: 'Bilkent Univeristy', position: 'Fizik', note: 'Bilken blah blah blah aciklamalar'),
                                new HistoryEntity(startDate: new Date(), endDate: new Date(), entity: 'Ted Ankara Koloji', position: '', note: 'Ted Abkaafasjhg asjhgdjdsdsahdgas j blah blah blah aciklamalar')
                        ]),
                workHistory: new GeneralisedHistory(
                        history: [
                                new HistoryEntity(startDate: new Date(1122313223), endDate: new Date(), entity: 'Fikrimuhal Teknoloji', position: 'CTO', note: 'Fikrimuhal Teknoloji danismanlik ltd sti muhendislik blah blah blah aciklamalar'),
                                new HistoryEntity(startDate: new Date(year: 2003, month: 1, date: 2), endDate: new Date(), entity: 'FAMOUSCOMPANY, INC.', position: 'GENERAL MARKETING DIRECTOR', note: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt diam ac lectus tristique scelerisque. Quisque vitae libero sit amet turpis faucibus auctor eget vitae tortor. Aenean metus erat, ultricies non mattis quis, molestie ac massa. Sed sollicitudin erat ac dui viverra a posuere eros adipiscing. Phasellus nisi lectus, imperdiet sed hendrerit ac, dictum quis sem. Phasellus vel nisi non massa elementum porta. Aliquam erat volutpat.'),
                                new HistoryEntity(startDate: new Date(), endDate: new Date(), entity: 'Ted Ankara Koloji', position: '', note: 'Ted Abkaafasjhg asjhgdjdsdsahdgas j blah blah blah aciklamalar')
                        ]),
                aboutText: ' About tetxtim dir budur..Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque auctor blandit eros vel scelerisque. Donec mi eros, eleifend et ornare tempus, bibendum a metus. Proin nec nisi et augue sodales gravida. Sed fermentum molestie tortor sit amet pulvinar.',
                birthDate: new Date(year: 1985, month: 9, date: 16),
                skills: [],
                friends: []
        )

        //===============================



        profile = profile.save(failOnError: true)  // hata olursa exeption at
        session.loggedinProfileId = profile.id
        createFriends(profile)

        session.facebookRaw = null  //facebook datasiyle isimiz bitti

        def data = [
                username: params.username
        ]
        render(data as JSON)
    }

    private createFriends(Profile currentProfile) {
        def friendRaw = session.facebookRaw?.friends?.data
        assert friendRaw
        def friends = []
        friendRaw.each { fbData ->
            def profile = new Profile(
                    registered: false,
                    accounts: new Accounts(
                            facebook: new Facebook(
                                    remoteId: fbData.id,
                                    first_name: fbData.first_name,
                                    last_name: fbData.last_name,
                                    middle_name: fbData.middle_name,
                            )
                    ),
                    first_name: fbData.first_name,
                    last_name: fbData.last_name,
                    middle_name: fbData.middle_name,
            )//.save(failOnError: true);
            friends << profile
        }
        currentProfile.friends = friends
        currentProfile.save(failOnError: true)

    }

    def ajaxCheckUsername() {
        Boolean userNameExists = Profile.countByUsername(params.username) != 0
        def data = [
                available: !userNameExists,
                username: params.username
        ]
        render(data as JSON)
    }


    private fetchFacebookData() {
//        def consumerKey = grailsApplication.config.oauth.providers.facebook.key
//        def consumerSecret = grailsApplication.config.oauth.providers.facebook.secret
        def facebook = new RESTClient(FACEBOOK_GRAPH_URL)
        def r = facebook.get(path: "100003812445224", params: [access_token: token.token, fields: 'email,first_name,last_name,languages,username,name,middle_name,hometown,location,education,devices,age_range,picture.type(large),friends.fields(first_name,last_name,username,middle_name)'], requestContentType: 'application/json')
        r.status == 200
        return r.data
    }

    OauthService oauthService // or new OauthService() would work if you're not in a spring-managed class.
    Token getToken() {

        String sessionKey = oauthService.findSessionKeyForAccessToken('facebook')
        return session[sessionKey]

    }
    /*

[
first_name:Ilgaz, last_name:Şumnulu, languages:[[id:106059522759137, name:English], [id:111995922149866,
name:Turkish]], username:sumnulu, name:Ilgaz Şumnulu, hometown:[id:106012156106461, name:Istanbul, Turkey],
location:[id:106012156106461, name:Istanbul, Turkey], education:[[school:[id:50487143222, name:TED Ankara Koleji],
year:[id:194603703904595, name:2003], type:High School], [school:[id:213879365316179, name:Bilkent Üniversitesi],
type:College]], devices:[[os:Android]], age_range:[min:21], id:100003812445224, friends:[data:[[name:Arda Yigithan
Orhan, id:4811236], [name:Nilay Karamollaoğlu, id:8118513], [name:Ant Ekşiler, id:9305732], [name:Akif Yağız
Saraçlar, id:15725531], [name:Ayca Ozkn, id:500497458], [name:Iris Aydin, id:501080824], [name:Bilgun Yildirim,
id:503965392], [name:Samican Çapuldoğdu, id:504732688], [name:Babür Tokmanoğlu, id:507205767], [name:Can Akaltun,
id:510018724], [name:Ali Kemal Uncu, id:511799120], [name:Tuna Vargı, id:513697145], [name:Firat Akc, id:516193900],
[name:Sercan Göksu, id:517974434], [name:Burak Dündar, id:518185222], [name:Tahir Kaplan, id:518400645],
[name:Zeynep Öz, id:518505441], [name:Duran Fatih Gngr, id:519471820], [name:Seda Ceyhan, id:520622648], [name:Sarp
Kerman, id:528435853], [name:Doğan Genç, id:528903609], [name:Ufuk Filoğlu, id:548777438], [name:Lale Akoner,
id:551587264], [name:Aysgl Ça, id:556062811], [name:Ceren Özgür, id:557226368], [name:Taylan Koca, id:557740773],
[name:Cem Çakırlar, id:558443261], [name:Selin Çıray, id:568287412], [name:Gürel Erceiş, id:570676945], [name:Memo
Kosemen, id:570921348], [name:Özgecan Avaz, id:574568781], [name:Mehmet Ergin, id:576849688], [name:Tunca Alikaya,
id:578180183], [name:Aylin Alacatlı, id:578345427], [name:Engin Şentürk, id:578405455], [name:Deniz Ashan
Madencioğlu, id:584003153], [name:Pınar Tunçay, id:588714271], [name:Selin Uludoğan, id:591814766], [name:Levent Y.
İnce, id:596870045], [name:Cihan Poçan, id:597107463], [name:Meriçcan Usta, id:599262879], [name:A. Gurel Kangal,
id:599665444], [name:Emir Tağmat, id:600903934], [name:Okan Duman, id:605422264], [name:Mitä Gyros, id:607600270],
[name:Bahadır Yılmaz, id:608217742], [name:Sinan Gündoğdu, id:618857660], [name:Funda Uzngl, id:630443081],
[name:Emrh Ilby, id:632400307], [name:Ceren Özgün, id:634460965], [name:Eda Akkok, id:643107272], [name:Yiğit
Şumnulu, id:643788668], [name:Buğra Uluyurt, id:663891059], [name:Sedef Demirkol, id:664652729], [name:Bahadır
Gökbayrak, id:664768288], [name:Nihan Koç, id:667172769], [name:Ozan Deniz Özel, id:674274799], [name:Serkan Sökmen,
id:675952813], [name:Barış Çakmak, id:680107602], [name:Ceren Ezgi Özlü, id:681611310], [name:Buğra Uzun,
id:682112667], [name:Toprak Coşkun Deniz, id:683213063], [name:Orkun Balcı, id:684918949], [name:Özgün Ocak,
id:686078567], [name:Toygar Kerman, id:687982404], [name:Fırat Tansu, id:696246065], [name:Arda Ecevit,
id:702071291], [name:Anıl Dursun, id:707411082], [name:Emrecan Sevdin, id:707986489], [name:Şükrü Hasdemir,
id:708608579], [name:Duygu Baki, id:714120712], [name:Umut Arısoy, id:718245143], [name:Saltuk Uluyurt,
id:722501932], [name:Onur Karakus, id:725191808], [name:Duygu Can, id:725436463], [name:Ufuk Benli, id:741898317],
[name:Itır Özinanır, id:774730116], [name:Alp Kaçar, id:777412997], [name:Cihan Okay, id:779779810], [name:Abdullah
Güneydaş, id:785953499], [name:Engin Bodur, id:797080071], [name:Eniz Gülek, id:807284309], [name:Kemal Can
Zararsız, id:1224669575], [name:Sera Çakıroğlu, id:1457545032], [name:Emir Emiroğlu, id:100000613238677],
[name:Volkan Çağlar, id:100000625053484], [name:Ege Nasuhoglu, id:100000661687152], [name:Tolga Gürol,
id:100001021421709], [name:Burak Tezateşer, id:100001108788624], [name:Oğul Öncel, id:100001704630270], [name:Muhsin
Erhan, id:100002060307944], [name:Saeed Mosallat, id:100002268061641], [name:Ozan Dogu Tuna, id:100002890017766],
[name:Çağrı İşeri, id:100005084436626]],
paging:[next:https://graph.facebook.com/100003812445224/friends?access_token=CAAEL6dJTc7MBACOMZBTYOqZAdHaexI9FTZCEleksHS2ZBZC6eTwISKnGzrReM21MMyLTEqNZAnTiSkQkuVmZBFlqdiVFQyaJurzfNagZC6nK5kxQr99mC8JHAoX6kTG0XYMXKBt32Wsel51ZBuMPunusWduMTuYtqukAwasR6TZBzsG6nRUcGBf7r0
&limit=5000&offset=5000&__after_id=100005084436626]],
picture:[data:[url:https://fbcdn-profile-a.akamaihd.net/hprofile-ak-prn2/1118955_100003812445224_2127240128_n.jpg,
is_silhouette:false]]
     */

}
