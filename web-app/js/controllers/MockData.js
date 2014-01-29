/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 7/12/13
 * Time: 8:46 PM
 * To change this template use File | Settings | File Templates.
 */

//TEST
//mongo test datasi icin geci olarak var bu
function NumberLong(a) {
    return a;
}
function ISODate(a) {
    return a;
}

function getMockForumList() {
    return [
        {
            id: 1,
            picture: {url: 'http://www.healinglandscapes.org/blog/wp-content/uploads/2013/06/gezi-1.jpg'},
            title: 'Gezi Parkı, Park olarak kalmalıdır.',
            description: 'Taksim Gezi Parkına Topçu Kışlası adı altında ya da başka herhangi bir yapılaşma olmayacağını, projenin iptal edildiğine dair resmi bir açıklamanın yapılmasını, Atatürk Kültür Merkezinin yıkılmasına ilişkin girişimlerin durdurulması.'
        },
        {
            id: 2,
            picture: {url: 'http://t24.com.tr/media/stories/2012/09/page_39milletvekili-dokunulmazligi-dayatilmamalidir39_942600896.jpg'},
            title: 'Milletvekili dokunulmazlığı kaldırılması',
            description: 'Bireyleri ve dolayısıyla toplumun belli bir kesimini temsil eden parlamenter sistemde, milletvekillerinin sade vatandaş statüsünden farklı konumda bulunmaması gerekmektedir.'
        },
        {
            id: 3,
            picture: {url: 'http://www.yenimakale.com/resim/partiler.jpg'},
            title: 'Partilerin finans yapılarının şeffaflaştırılması',
            description: 'Partilerin neyi nereden aldığı kaç liraya aldığı ve neden aldığı daha da önemlisi bu paranın nereden geldiğinin açık ve net şekilde ortaya konmasını ve çok ciddi şekilde kontrol edilmesini istiyorum. alt başlık olarak partilere...'
        },
        {
            id: 4,
            picture: {url: 'https://fbcdn-sphotos-c-a.akamaihd.net/hphotos-ak-frc1/1002287_680684838613156_516061538_n.png'},
            title: 'Kuvvetler ayrılığı ilkesi',
            description: 'her kim hükümet olursa olsun devleti partileştiremesin, yani ben başa geldim tüm yargıyı, kamuyu kendi yandaşlarımla doldurayım, tüm kararlar benim isteğime göre çıksın diyemesin hiç bir parti. başbakanın işi başbakanlık olsun, ihalelere karışamasın karıştığı taktirde hemen yargı devreye girebilsin istiyorum, halkı bölmeye yönelik hareket...'
        },
        {
            id: 5,
            picture: {url: 'http://www.healinglandscapes.org/blog/wp-content/uploads/2013/06/gezi-1.jpg'},
            title: 'Gezi Parkı, Park olarak kalmalıdır.',
            description: 'Taksim Gezi Parkına Topçu Kışlası adı altında ya da başka herhangi bir yapılaşma olmayacağını, projenin iptal edildiğine dair resmi bir açıklamanın yapılmasını, Atatürk Kültür Merkezinin yıkılmasına ilişkin girişimlerin durdurulması.'
        }
    ];
}


function getMockComments() {
    return {
        total: 99,
        data: [
            { "_id": NumberLong(17), "comment": "Seçim barajının düşürülmesi veya seçim yönetiminin değiştirilmesi olabilir.diğer ülkelerdeki seçim türlerini bilmiyorum.", "commentDate": ISODate("1970-01-01T00:00:00Z"), "eventItem": NumberLong(9), "user": NumberLong(139), "version": NumberLong(1), "voteCount": 1, "voteType": "No" }
            ,
            { "_id": NumberLong(28), "comment": "barajın kaldırılması gerektiğini düşünüyorum", "commentDate": ISODate("2013-06-19T10:12:05.690Z"), "eventItem": NumberLong(9), "user": NumberLong(187), "version": NumberLong(2), "voteCount": 2, "voteType": "Yes" }
            ,
            { "_id": NumberLong(29), "comment": "Farklı kesimleri temsil eden insanlar meclise girmelidir. Ancak o şekilde insanlar daha adil olarak temsil edilebilir. Bu da seçim barajının kaldırılması ile olabilir.", "commentDate": ISODate("2013-06-19T10:12:05.690Z"), "eventItem": NumberLong(9), "user": NumberLong(186), "version": NumberLong(0), "voteCount": 0, "voteType": "Yes" }
            ,
            { "_id": NumberLong(34), "comment": "Seçim sisteminin kendi, seçileni muktedir kılmaktadır. Seçim barajı eşit ve doğrudan temsil adına en fazla %5 olmalıdır. ", "commentDate": ISODate("2013-06-19T16:06:28.428Z"), "eventItem": NumberLong(9), "user": NumberLong(197), "version": NumberLong(2), "voteCount": 2, "voteType": "No" }
            ,
            { "_id": NumberLong(40), "comment": "Oy vermek istemediğim bir partiye oy vermek durumunda kalıyorum. Baraj mükün olduğunca düşürülmeli hatta kaldırılmalı.", "commentDate": ISODate("2013-06-19T16:06:28.428Z"), "eventItem": NumberLong(9), "user": NumberLong(201), "version": NumberLong(3), "voteCount": 3, "voteType": "Abs" }
            ,
            { "_id": NumberLong(56), "comment": "Seçim barajına Açık Hareket bir çözüm olabilir. Öncesinde de belirttiğim gibi, vekiller seçmeni ile katılım sağlayabilir. Fikirlerini özgürce açıklayabilir ve bunu savunabilirler. ", "commentDate": ISODate("2013-06-19T16:06:28.428Z"), "eventItem": NumberLong(9), "user": NumberLong(22), "version": NumberLong(0), "voteCount": 0, "voteType": "Yes" }
            ,
            { "_id": NumberLong(60), "comment": "Seçim barajı seçime katılan parti sayısına göre adaptif olmalı. mesela 27 partinin+bağımsızların katıldığı 2011 seçimlerinde her partinin eşit hakkı olması için baraj 3,7 olabilecekken, 15 parti + bağımsızların katıldığı bir seçimde barajın %6 olmasında da bir sakınca yok.  ", "commentDate": ISODate("2013-06-21T04:46:43.931Z"), "eventItem": NumberLong(9), "user": NumberLong(240), "version": NumberLong(1), "voteCount": 1, "voteType": "Yes" }
            ,
            { "_id": NumberLong(64), "comment": "baraj tamamen kaldırılmalı, düşürmek adaleti sağlamaz. hiç olmadı barajın altında kalan partilere oy verenlere, seçimden sonra barajın üstündeki istedikleri partiye oyunu aktarma şansı verilmeli, ki bu da adil değil idare eder bir çözüm.", "commentDate": ISODate("2013-06-21T04:46:43.931Z"), "eventItem": NumberLong(9), "user": NumberLong(266), "version": NumberLong(0), "voteCount": 0, "voteType": "Yes" }
            ,
            { "_id": NumberLong(70), "comment": "Sadece barajin dusurulmesi de yeterli degil... Bir secim bolgesinden birden fazla milletvekili seciliyor olmasi, kisilerin degil parti listelerinin on plana cikmasina sebep oluyor. Secim bolgeleri kuculmeli, her secim bolgesinden bir milletvekili, o bolgenin vatandaslarini dogrudan temsil edecek secilde secilmeli ve o bolgenin sesini mecliste duyurabilmelidir.", "commentDate": ISODate("2013-06-21T04:46:43.931Z"), "eventItem": NumberLong(9), "user": NumberLong(267), "version": NumberLong(0), "voteCount": 0, "voteType": "Yes" }
            ,
            { "_id": NumberLong(74), "comment": "Ben bu düşünceye temsilin yaygınlaştırılmasının demokrasi gereği olması nedeniyle katılıyorum. Yoksa Gezi Hareketi diye bir yapı kursak (parti teşkilatı değil) bu gidişle yüzde 10'un çok üzerinde, hatta doğru yapıda örgütlenme ile %25-30 oy alabileceğimizi düşünüyorum. ", "commentDate": ISODate("2013-06-22T06:52:43.759Z"), "eventItem": NumberLong(9), "user": NumberLong(281), "version": NumberLong(1), "voteCount": 0, "voteType": "Yes" }
            ,
            { "_id": NumberLong(79), "comment": "Seçim barajının ülke genelinde sağlıklı işleyebilmesi adına 2% gibi bir düzeye indirilmesi; ve buna rağmen bir kentte oyların ezici çoğunluğunu aldığı halde ülke ortalamasında barajı geçememiş bir parti/aday olması durumunda bu vekillerin geçerli sayılmasının hem temsiliyet hem de demokratik değerler bakımından gerekli olduğu kanaatindeyim.", "commentDate": ISODate("2013-06-23T08:40:43.712Z"), "eventItem": NumberLong(9), "user": NumberLong(304), "version": NumberLong(1), "voteCount": 1, "voteType": "Yes" }
            ,
            { "_id": NumberLong(88), "comment": "en az %5-6 civarına düşürülmeli.. Azınlıkların da meclis de yer etmesinin önü açılmalı", "commentDate": ISODate("2013-06-24T13:30:16.235Z"), "eventItem": NumberLong(9), "user": NumberLong(330), "version": NumberLong(6), "voteCount": -1, "voteType": "No" }
            ,
            { "_id": NumberLong(97), "comment": "%10 baraj yüksek olabilir, fakat Türk demokrasisinin en önemli sorunu baraj değildir. Üç-dört zayıf partiden oluşan koalisyon hükümetlerinden yeteri kadar çekmedik mi?  Politik sermayemizi barajı değiştirmek yerine güçlü bir muhalefet partisi yaratmaya çalışalım. ", "commentDate": ISODate("2013-06-24T20:25:32.820Z"), "eventItem": NumberLong(9), "user": NumberLong(5), "version": NumberLong(3), "voteCount": -2, "voteType": "Abs" }
            ,
            { "_id": NumberLong(132), "comment": "bunun karşısına yıllardır sunulan tek argüman, geçmiş başarısız örnekler. beraber iş yapmayı, ortak karar almayı, militanca bir fikri savunmamayı bizler yaşadığımız süreçte öğrendik. onlar da öğrensin. ya da gelsinler öğretelim.", "commentDate": ISODate("2013-06-25T11:42:10.875Z"), "eventItem": NumberLong(9), "user": NumberLong(438), "version": NumberLong(1), "voteCount": 1, "voteType": "Yes" }
            ,
            { "_id": NumberLong(140), "comment": "Türkiye'deki demokrasinin önünde yer alan en büyük engel seçimlerdeki barajdır. Çok kısa hesapla; son seçime göre seçmen sayısı 50 milyon küsür. 50 milyon seçmenin %9'unun bir partiye oy verdiğini düşünürsek 4,5 milyon kişinin mecliste temsil edilmediği ortaya çıkıyor. Bu sayıda nüfuzu olan ülkeler var, düşünün bir ülke hiçe sayılıyor. %3 lük bir barajda ise bu sayı 1,5 milyon. Aslında bu bile ürkütücü. Fakat %3 barajı bile ilk adım için kesin ve minumum olmalı. %3 ün üzerindeki baraj insanları abuk subuk şirketlerin yaptığı anket sonuçlarına göre \"oyum boşa gitmesin\" psikozuna sokacaktır. Ki bu noktada bir diğer önemli husus seçimden önce son 3 ay gibi bir sürede anketlerin yasaklanması: Daha demokratik bir ortam ve yönlendirilmemiş seçmen sağlayacaktır.", "commentDate": ISODate("2013-06-25T13:53:23.099Z"), "eventItem": NumberLong(9), "user": NumberLong(463), "version": NumberLong(0), "voteCount": 0, "voteType": "Yes" }
            ,
            { "_id": NumberLong(146), "comment": "% 3-5 gibi bir rakamın mantıklı olduğunu düşünüyorum diğer akdeniz ülkelerine bakınca. Ayrıca, Gökhan Özturhan'a katılıyorum. Partinin seçim barajini geçememesi durumunda o partilerin adayları bağımsız gibi sayılsın. Eğer bir şehirde bağımsız aday yeter sayısına ulaşabliliyorlarsa\n meclise girebilmeliler.", "commentDate": ISODate("2013-06-25T16:17:22.434Z"), "eventItem": NumberLong(9), "user": NumberLong(495), "version": NumberLong(2), "voteCount": 2, "voteType": "Yes" }
            ,
            { "_id": NumberLong(169), "comment": "Tamamen kalkabilir. En fazla %2-3 gibi bir yere cekilmesi iyi olacaktir. \"Koalisyon hukumetlerinin zararini cektik baraj o yuzden yararli\" savina da kesinlikle katilmiyorum. Herkesin beraber is yapmayi ogrenmesi lazim. Bana gore en iyi katilim; bakanlar kurulu da tum milletvekillerinin ortak karariyla koltuk sayisina orantili olarak belirlenmesiyle olur. En cogulcu demokrasi.\n\n\"Partinin seçim barajini geçememesi durumunda o partilerin adayları bağımsız gibi sayılsın. Eğer bir şehirde bağımsız aday yeter sayısına ulaşabliliyorlarsa meclise girebilmeliler.\" guzel bir oneri.", "commentDate": ISODate("2013-06-25T20:51:11.999Z"), "eventItem": NumberLong(9), "user": NumberLong(544), "version": NumberLong(3), "voteCount": 3, "voteType": "Yes" }
            ,
            { "_id": NumberLong(204), "comment": "%3 ten fazla olmamalı bu sayede daha demokratik kararlar alınabilir azınlıkların da fikirlerini söylemelerinin yolu açılmış olur", "commentDate": ISODate("2013-06-26T14:02:16.097Z"), "eventItem": NumberLong(9), "user": NumberLong(621), "version": NumberLong(1), "voteCount": 1, "voteType": "Yes" }
            ,
            { "_id": NumberLong(234), "comment": "2 aşamalı seçim ve % 3 baraj olmalı .sadece baraj değil siyasi partiler yasası,ve her türlü sivil toplum kuruluşu yöneticiliği ve parti yöneticiliği milletvekilliği belediye başkanlığı muhtarlık dahi max 2 dönem yapılabilmeli.partilerde önseçim şart olmalı.", "commentDate": ISODate("2013-06-26T19:24:03.622Z"), "eventItem": NumberLong(9), "user": NumberLong(660), "version": NumberLong(0), "voteCount": 0, "voteType": "Yes" }
            ,
            { "_id": NumberLong(236), "comment": "tamamen ayni fikirdeyim, ancak bu konuda nasil bir girisim yapilabilinir? plan nedir?", "commentDate": ISODate("2013-06-26T19:27:44.964Z"), "eventItem": NumberLong(9), "user": NumberLong(662), "version": NumberLong(0), "voteCount": 0, "voteType": "No" }
        ]
    };
}
function getMockVoters() {
    return {
        total: 340,
        data: [
            { "_id": NumberLong(1), "firstName": "Özgür", "gender": "male", "lastName": "Aydin", "middleName": "Yasin", "userId": "100002935343175", "userLocale": "en_US", "username": "ozgurfloyd", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(2), "firstName": "Ilgaz", "gender": "male", "lastName": "Şumnulu", "userId": "100003812445224", "userLocale": "en_US", "username": "sumnulu", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(3), "firstName": "Samican", "gender": "male", "lastName": "Tandoğdu", "userId": "504732688", "userLocale": "en_US", "username": "sctandogdu", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(4), "firstName": "Oltac", "gender": "male", "lastName": "Unsal", "userId": "602439413", "userLocale": "en_US", "username": "oltac", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(5), "firstName": "Serdar", "gender": "male", "lastName": "Uckun", "userId": "100000101431044", "userLocale": "en_US", "username": "serdar.uckun", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(6), "firstName": "Bilen", "gender": "male", "lastName": "Peksel", "middleName": "Oytun", "userId": "650531257", "userLocale": "en_US", "username": "oytun.peksel", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(7), "firstName": "Kaya", "gender": "male", "lastName": "Diker", "userId": "709562567", "userLocale": "tr_TR", "username": "kayadiker", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(8), "firstName": "Memet", "gender": "male", "lastName": "Inal", "userId": "596859663", "userLocale": "en_US", "username": "memet.inal", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(9), "firstName": "Can", "gender": "male", "lastName": "Yıldırım", "userId": "654218880", "userLocale": "en_US", "username": "weirdotr", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(10), "firstName": "Çapulcu Neriman", "gender": "female", "lastName": "Akcanli", "userId": "657265778", "userLocale": "en_GB", "username": "neriman.akcanli", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(11), "firstName": "Zac", "gender": "male", "lastName": "Oeztuerk", "userId": "647652332", "userLocale": "en_US", "username": "zekiinmetu", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(12), "firstName": "Alper", "gender": "male", "lastName": "Çapul", "userId": "791119275", "userLocale": "tr_TR", "username": "scalespace", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(13), "firstName": "Hayrettin", "gender": "male", "lastName": "Günç", "userId": "100002241449139", "userLocale": "en_US", "username": "hayrettingunc", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(14), "firstName": "Batuhan", "gender": "male", "lastName": "Keskin", "middleName": "Birol", "userId": "694917042", "userLocale": "en_US", "username": "batuhan.keskin", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(15), "firstName": "Ahmet", "gender": "male", "lastName": "Güzererler", "userId": "680679163", "userLocale": "tr_TR", "username": "guzererler", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(16), "firstName": "Yonca", "gender": "female", "lastName": "Akcanlı", "userId": "617257832", "userLocale": "en_US", "username": "yonca.akcanli", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(17), "firstName": "Ayşegül", "gender": "female", "lastName": "Kıratlı", "userId": "665922334", "userLocale": "en_GB", "username": "MiaHelton", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(18), "firstName": "Duygu", "gender": "female", "lastName": "Atacan", "userId": "26107675", "userLocale": "en_US", "username": "duyguatacan", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(19), "firstName": "Gürel", "gender": "male", "lastName": "Erceiş", "userId": "570676945", "userLocale": "en_US", "username": "gurel.erceis", "version": 0, "voteAnonymous": false }
            ,
            { "_id": NumberLong(20), "firstName": "M", "lastName": "Cirak", "middleName": "Alp", "userId": "600134862", "userLocale": "en_US", "username": "macirak", "version": 0, "voteAnonymous": false }
        ]
    }
}


function getMockEventItems() {
    return [
        { "_id": NumberLong(2), "absVote": 1, "approvedBy": 1, "createdBy": NumberLong(4), "downVote": 0, "event": NumberLong(1), "isActive": true, "title": "Ergo Sum lafi dogrumudur yoksa yalancilarin uydurdugu sacma salak biseymidir", "upVote": 2, "version": NumberLong(12) }
        ,
        { "_id": NumberLong(3), "absVote": 3, "approvedBy": 1, "content": "Toplumsal anlaşmazlıkları göz yaşı ve biber gazı bombaları ve su sıkmakla çözmek doğru değildir, bunu yerine tüm partilerin aynı tabanda bir iletişimi gerekmektedir. Uzun vadeli bir toplumsal barış ancak vatandaşların politik planlara geniş kapsamlı ve efektif katılımlarıyla sağlanabilir. Gösteri ve ifade özgürlüğü, özgür ve demokratik bir toplumun yapıtaşlarıdır ve devlet tarafından güvence altına alınmalıdır. Alman KORSANLAR demokratik katılım ve liberal değerler konularında kendilerini uluslararası bir hareketin parçası olarak görmektedir ve bu sebeple de Türkiye’deki protestocularla dayanışma içinde olduklarını ilan etmektedirler.", "createdBy": NumberLong(1), "downVote": 2, "event": NumberLong(1), "isActive": true, "title": "İfade özgürlüğünün önündeki engeller kaldırılsın", "upVote": 276, "version": NumberLong(354) }
        ,
        { "_id": NumberLong(4), "absVote": 3, "approvedBy": 3, "content": "Polisler Gezi Parkı direnişi boyunca halka düşmanca saldırmış, insanların ölümüne sebep olmuştur. Polise saldır emrini kim vermiştir, sorumlusunun bulunmasını istiyoruz. ", "createdBy": NumberLong(3), "downVote": 1, "event": NumberLong(1), "isActive": true, "title": "Polislerin aşırı güç kullanımıyla alakalı sorumlu kişilerin bulunması", "upVote": 209, "version": NumberLong(226) }
        ,
        { "_id": NumberLong(5), "absVote": 1, "approvedBy": 2, "content": "Eğer bir problem görürseniz yada istediginiz olmasini gerektigini dusundugunuz bir ozellik var ise:\r\nYan tarafta ki turuncu \"GERI DONUS & YARDIM\" baglantisini kullana bilirsiniz. ", "createdBy": NumberLong(4), "downVote": 1, "event": NumberLong(1), "isActive": false, "title": "PROBLEMLER: Ürün ile alakalı problemler", "upVote": 6, "version": NumberLong(27) }
        ,
        { "_id": NumberLong(6), "absVote": 5, "approvedBy": 2, "content": "Taksim Gezi Parkına Topçu Kışlası adı altında ya da başka herhangi bir yapılaşma olmayacağını, projenin iptal edildiğine dair resmi bir açıklamanın yapılmasını, Atatürk Kültür Merkezinin yıkılmasına ilişkin girişimlerin durdurulması.", "createdBy": NumberLong(2), "downVote": 5, "event": NumberLong(1), "isActive": true, "title": "Gezi Parkı, Park olarak kalmalıdır. ", "upVote": 161, "version": NumberLong(182) }
        ,
        { "_id": NumberLong(7), "absVote": 5, "approvedBy": 2, "content": "Taksim Gezi Parkı’ndaki yıkıma karşı direnişten başlayarak halkın en temel demokratik hak kullanımını engelleyen, şiddetle bastırma emrini veren, bu emri uygulatan ve uygulayan, binlerce, insanın yaralanmasına, üç yurttaşımızın ölmesine neden olan sorumlular, başta İstanbul, Ankara, Hatay Valileri ve Emniyet Müdürleri olmak üzere tüm sorumluların görevden alınmasını, Gaz bombası ve benzeri materyallerin kullanılmasının yasaklanması", "createdBy": NumberLong(2), "downVote": 2, "event": NumberLong(1), "isActive": true, "title": "Sorumluların görevden alınması lazım", "upVote": 60, "version": NumberLong(74) }
        ,
        { "_id": NumberLong(8), "absVote": 5, "approvedBy": 2, "content": "Mevcut iktidarın, günümüzden geçmişe doğru halkımızı unutturmaya, ya da ikna edici ve amaçları saptırılmış ikna edici olmayan açıklamalar ile alenen örtbas etmeye çalıştığı, Reyhanlı, Uludere ve benzeri birçok olayda hayatını yitiren binlerce sivil, asker (hatta polis) olan vatandaşın haklarını yok sayarcasına tek taraflı ve kışkırtıcı açıklamalarına dair suç duyurusunda bulunulması ve yargı yoluna gidilmesi,", "createdBy": NumberLong(2), "downVote": 5, "event": NumberLong(1), "isActive": true, "title": "İktidarin kışkırtıcı açıklamalarına dair suç duyurusunda bulunulması ve yargı yoluna gidilmesi", "upVote": 110, "version": NumberLong(123) }
        ,
        { "_id": NumberLong(9), "absVote": 4, "approvedBy": 1, "content": "Türkiye'de demokrasinin gerçekten var olmamasının temel sebeblerinden bir tanesidir(diğeri de partiler kanunu'dur). Maalesef %10'luk seçim barajı yüzünden halkın tüm sesleri mecliste temsil edilememektedir. Son iki seçimde kullanılmış oyların yaklaşık  %15-%20'i, 2002 seçiminde yaklaşık %45'i, oyların verildiği partilerin %10'nun altında oy alması nedeniyle seçim barajını aşan partilere dağıtılmıştır. Unutmayalım ki bizim bugün sokaklarda olmamızın da temel sebeblerinden bir tanesi de mecliste temsil edilemiyor olmamızdır. Sağlıklı bir demokrasi için tüm seslerin sesini mecliste duyurabilmesi şarttır.", "createdBy": NumberLong(15), "downVote": 3, "event": NumberLong(1), "isActive": true, "title": "Seçim Barajının Düşürülmesi", "upVote": 312, "version": NumberLong(352) }
        ,
        { "_id": NumberLong(10), "absVote": 13, "approvedBy": 2, "content": "Güçlü bir desteği olan STK veya daha da ilerisi bir siyasi parti olarak iktidara söz geçirebilecek uluslararası bir yapıya dönüşmek için birleşmenin şart olduğunu düşünüyor musunuz?", "createdBy": NumberLong(31), "downVote": 5, "event": NumberLong(1), "isActive": true, "title": "Açık Demokrasi veya Doğrudan Demokrasi üzerine çalışan tüm gruplar beraberce çalışmalı...", "upVote": 89, "version": NumberLong(116) }
        ,
        { "_id": NumberLong(11), "absVote": 2, "approvedBy": 2, "content": "Yıllardır, gayrı kanuni yollar ile iktidar/hükümet odaklı kadrolaşmış olan devlet ve yargı organlarının bağımsızlaştırılması ve bu organların belli bir siyasi düşünceye  hizmet eder hale gelmesinin önlenmesi", "createdBy": NumberLong(54), "downVote": 1, "event": NumberLong(1), "isActive": true, "title": "Yıllardır, gayrı kanuni yollar ile iktidar/hükümet odaklı kadrolaşmış olan devlet ve yargı organlarının bağımsızlaştırılması ve bu organların belli bir siyasi düşünceye  hizmet eder hale gelmesinin önlenmesi", "upVote": 72, "version": NumberLong(77) }
        ,
        { "_id": NumberLong(12), "absVote": 3, "approvedBy": 2, "content": "Suçsuz hapis yatan gazeteci, yazar, ordu mensubu kişilerin acilen bırakılması şarttır. Hapishaneye girmiş çıkmış düsünurlerimizin çoğu şuçsuz olarak yatmıştır, yatmaktadır. Örnek: Mustafa Balbay - ne ile yargılandığı bilinmeden evinden gecenin 3'ünde alınmıştır. Bu yargı şekli gelecekte öfkeden başka birşey getirmez. ", "createdBy": NumberLong(58), "downVote": 5, "event": NumberLong(1), "isActive": true, "title": "Ergenekon ve Balyoz davaları", "upVote": 45, "version": NumberLong(64) }
        ,
        { "_id": NumberLong(13), "absVote": 19, "approvedBy": 55, "content": "Bireyleri ve dolayısıyla toplumun belli bir kesimini temsil eden parlamenter sistemde, milletvekillerinin sade vatandaş statüsünden farklı konumda bulunmaması gerekmektedir.", "createdBy": NumberLong(54), "downVote": 3, "event": NumberLong(1), "isActive": true, "title": "Milletvekili dokunulmazlığı kaldırılması", "upVote": 126, "version": NumberLong(155) }
        ,
        { "_id": NumberLong(17), "absVote": 0, "content": "Sil beni lutfen", "createdBy": 74, "downVote": 0, "event": NumberLong(1), "isActive": false, "title": "Test maddesi beni sil", "upVote": 0, "version": 0 }
        ,
        { "_id": NumberLong(18), "absVote": 0, "approvedBy": 2, "content": "test", "createdBy": NumberLong(2), "downVote": 0, "event": NumberLong(1), "isActive": false, "title": "Test 0.1.4", "upVote": 0, "version": NumberLong(10) }
        ,
        { "_id": NumberLong(27), "absVote": 0, "content": "tttt", "createdBy": NumberLong(2), "downVote": 0, "event": NumberLong(1), "isActive": false, "title": "test", "upVote": 0, "version": 0 }
        ,
        { "_id": NumberLong(14), "absVote": 0, "approvedBy": 2, "content": "her kim hükümet olursa olsun devleti partileştiremesin, yani ben başa geldim tüm yargıyı, kamuyu kendi yandaşlarımla doldurayım, tüm kararlar benim isteğime göre çıksın diyemesin hiç bir parti.\r\nbaşbakanın işi başbakanlık olsun, ihalelere karışamasın karıştığı taktirde hemen yargı devreye girebilsin istiyorum, halkı bölmeye yönelik hareket yaptığında hesap verebilmesini istiyorum. belediyelere yapılan destek ve yardımların belediye başkanının partisine göre verilememesini istiyorum, iktidar partisinin aldığı belediyeler paraya ve projeye boğulurken muhalif belediyelere üçün biri verilmesin istiyorum ben.\r\nunutma kardeşim diktatörlükle demokrasi arasındaki tek far kuvvetler ayrılığıdır. kuvvetler ayrılığı kalkarsa başbakan değil diktatör seçiyor olursunuz.", "createdBy": NumberLong(73), "downVote": 0, "event": NumberLong(1), "isActive": true, "title": "Kuvvetler ayrılığı ilkesi", "upVote": 72, "version": NumberLong(74) }
        ,
        { "_id": NumberLong(15), "absVote": 2, "approvedBy": 2, "content": "parti başkanının kapıcısı olan milletvekili istemiyorum\r\nbunun içerisinde, parti iç tüzükleri var, milletvekili adaylarının belirlenme şekli var, var da var. milletvekilleri başbakanı istedi diye el kaldırıp indiren kuklalar olmasın istiyorum. bizim seçtiğimiz adamlar kendi şehirlerinin hakları için savaşsın istiyorum, kalkıpta başkan ne diyorsa onu yapmasın ne gerekiyorsa onu yapsın yapabilsin istiyorum. milletvekili adaylarını halk seçsin istiyorum, adaylığını koyan milletvekili aday adayları arasından ön seçim ile milletvekili adayları çıksın ve bu seçimler sırasında kimin nereden ne kadar yardım aldığında sınırlama olsun istiyorum.", "createdBy": NumberLong(73), "downVote": 0, "event": NumberLong(1), "isActive": true, "title": "Parti iç tüzüklerinin milletvekilillerinin elini kolunu bağlaması engellenmelidir", "upVote": 45, "version": NumberLong(49) }
        ,
        { "_id": NumberLong(16), "absVote": 2, "approvedBy": 2, "content": "partilerin neyi nereden aldığı kaç liraya aldığı ve neden aldığı daha da önemlisi bu paranın  nereden geldiğinin açık ve net şekilde ortaya konmasını ve çok ciddi şekilde kontrol edilmesini istiyorum. alt başlık olarak partilere yapılan hazine yardımlarının derhal kesilmesini ve eğer yardım yapılacak ise bunun oy oranı ile değil partinin varlığı ve seçime girmesi ile cüzi bir miktar olarak devam edilmesini istiyorum.", "createdBy": NumberLong(73), "downVote": 0, "event": NumberLong(1), "isActive": true, "title": "Partilerin finans yapılarının şeffaf olmasını istiyorum", "upVote": 113, "version": NumberLong(119) }
        ,
        { "_id": NumberLong(19), "absVote": 4, "approvedBy": 2, "content": "Gezi Parkı Direnişi'nin kazanımlarından biri sadece seçim barajı ile ilgili değil seçim sistemiyle de ilgili olması lazım. Açıkçası bunun seçim barajının tamamen kaldırılmasından da daha olası olduğunu düşünüyorum. Özellikle seçim bölgelerinin ve temsil sisteminin ciddi bir şekilde gözden geçirilip düzenlenmesi lazım. Böylece daha etkili ve daha adil bir temsiliyet mümkün olacağı düşüncesindeyim.", "createdBy": NumberLong(108), "downVote": 0, "event": NumberLong(1), "isActive": true, "title": "Seçim Sisteminin Değişmesi", "upVote": 52, "version": NumberLong(71) }
    ]
}
function getMockTags() {
    return [
        {
            id: 1,
            style: {class: 'category-environment', iconClass: 'icon-tree-1'},
            title: 'çevre'
        },
        {
            id: 2,
            style: {class: 'category-health', iconClass: 'icon-stethoscope'},
            title: 'sağlık'
        },
        {
            id: 3,
            style: {class: 'category-education', iconClass: 'icon-college'},
            title: 'eğitim'
        },
        {
            id: 5,
            style: {class: 'category-economy', iconClass: 'icon-bitcoin'},
            title: 'ekonomi'
        },
        {
            id: 6,
            style: {class: 'category-freedom', iconClass: 'icon-heart'},
            title: 'özgürlükler'
        },
        {
            id: 7,
            style: {class: 'category-local', iconClass: 'icon-road'},
            title: 'yerel'
        },
        {
            id: 8,
            style: {class: 'category-religion', iconClass: 'icon-infinity'},
            title: 'inanç'
        },
        {
            id: 9,
            style: {class: 'category-governance', iconClass: 'icon-town-hall'},
            title: 'yönetim'
        },
        {
            id: 10,
            style: {class: 'category-minority', iconClass: 'icon-eq'},
            title: 'azınlıklar'
        },
        {
            id: 11,
            style: {class: 'category-legal', iconClass: 'icon-hammer'},
            title: 'adalet'
        },
        {
            id: 12,
            style: {class: 'category-product', iconClass: 'icon-tools'},
            title: 'acikdemokrasi'
        }
    ]

};

