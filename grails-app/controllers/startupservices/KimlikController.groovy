package startupservices

import grails.converters.JSON
import kimlik.account.Accounts
import kimlik.account.Address
import kimlik.account.ContactInfo
import kimlik.account.Facebook
import kimlik.account.MapCoordinates
import kimlik.account.history.GeneralisedHistory
import kimlik.account.history.HistoryEntity
import org.bson.types.ObjectId

class KimlikController {

    def ajaxFriends() {

        def currentUsersId = ObjectId.massageToObjectId(session.loggedinProfileId)

        def data = shallowUser(Profile.get(currentUsersId).friends)
        render(data as JSON)
//        render 'ok'
    }


    def ajaxSkills() {
        def data = []
        fetchProfile().skills.each {
            data << [
                    name: it.name,
                    self_score: random.nextInt(4),
                    profiles: [
                            better: it.betterThanMe*.id*.toStringMongod(),//sadece id dondursun client tarafinda cachelenecek
                            same: it.sameAsMe*.id*.toStringMongod(),
                            worst: it.worstThanMe*.id*.toStringMongod()
                    ]
            ]
        }
        render(data as JSON)
    }

    def ajaxRateSelf() {
        assert session.loggedinProfileId
        assert params.skillName
        assert params.value  //1,2,3,4

        def result = [result: 'success']
        render result as JSON
    }

    def ajaxRateFriend() {
        assert session.loggedinProfileId
        assert params.friendId
        assert params.skillName
        assert params.value

        def result = [result: 'success']
        render result as JSON
    }



    def index() {
        [profile: fetchProfile()]

    }

    def follow() {
        [profile: fetchProfile()]
    }

    def education() {
        [profile: fetchProfile()]
    }

    def employment() {
        [profile: fetchProfile()]
    }

    def skills() {
        [profile: fetchProfile()]
    }

    private fetchProfile() {
        //        def profile = Profile.findByUsername(params.username)
        def profile = mockProfile()
        if (!profile) {
            redirect(url: '/')
        }

        return profile
    }

    private Collection<Profile> shallowUser(Collection<Profile> profiles) {
        def data = []
        profiles.each {
            data << [
                    id: it.id?.toStringMongod(),
                    name: it.name,
                    pictureUrl: "http://graph.facebook.com/${it.accounts.facebook.remoteId}/picture"
            ]
        }
        return data
    }

    private Profile mockProfile() {
        def p = new Profile(
                first_name: 'Ilgaz',
                last_name: 'Şumnulu',
                middle_name: 'T.',
                registered: true,
                username: 'sumnulu',
                accounts: new Accounts(
                        facebook: new Facebook(
                                remoteId: '111111111'
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
                skills: [
                        new PersonalSkill(percent: random.nextDouble() * 100, name: 'Java'),
                        new PersonalSkill(percent: random.nextDouble() * 100, name: 'Web Tasarim'),
                        new PersonalSkill(percent: random.nextDouble() * 100, name: 'CSS'),
                        new PersonalSkill(percent: random.nextDouble() * 100, name: 'HTML'),
                        new PersonalSkill(percent: random.nextDouble() * 100, name: 'javascript'),
                        new PersonalSkill(percent: random.nextDouble() * 100, name: 'Groovy'),
                        new PersonalSkill(percent: random.nextDouble() * 100, name: 'Grails'),
                        new PersonalSkill(percent: random.nextDouble() * 100, name: 'Object oriented Programming'),
                        new PersonalSkill(percent: random.nextDouble() * 100, name: 'Functional Programming'),
                        new PersonalSkill(percent: random.nextDouble() * 100, name: 'Web Services'),
                        new PersonalSkill(percent: random.nextDouble() * 100, name: 'MongoDB'),
                        new PersonalSkill(percent: random.nextDouble() * 100, name: 'SQL'),
                        new PersonalSkill(percent: random.nextDouble() * 100, name: 'NoSql'),
                ].sort { -it.percent },
                friends: [
                        new Profile(first_name: 'Ardaa', middle_name: 'Yigithan', last_name: 'Orhan', accounts: new Accounts(facebook: new Facebook(remoteId: '4811236'))),
                        new Profile(first_name: 'Nilay', last_name: 'Karamollaoğlu', accounts: new Accounts(facebook: new Facebook(remoteId: '8118513'))),
                        new Profile(first_name: 'Ant', last_name: 'Ekşiler', accounts: new Accounts(facebook: new Facebook(remoteId: '9305732'))),
                        new Profile(first_name: 'Ayca', last_name: 'Ozkn', accounts: new Accounts(facebook: new Facebook(remoteId: '500497458'))),
                        new Profile(first_name: 'Iris', last_name: 'Aydin', accounts: new Accounts(facebook: new Facebook(remoteId: '501080824'))),
                        new Profile(first_name: 'Bilgun', last_name: 'Yildirim', accounts: new Accounts(facebook: new Facebook(remoteId: '503965392'))),
                        new Profile(first_name: 'Samican', last_name: 'Çapuldoğdu', accounts: new Accounts(facebook: new Facebook(remoteId: '504732688')))
                ]
        )
        p.friends.each { it.setId(new ObjectId()) }
        p.setId(new ObjectId())
        def php = new PersonalSkill(percent: random.nextDouble() * 100, name: 'PHP', sameAsMe: [
                Profile.list()[11],
                Profile.list()[12],
                Profile.list()[13],
                Profile.list()[14],
                Profile.list()[15],
                Profile.list()[16]
        ], worstThanMe: [
                Profile.list()[21],
                Profile.list()[22],
                Profile.list()[23],
                Profile.list()[24],
                Profile.list()[25],
                Profile.list()[26]
        ], betterThanMe: [
                Profile.list()[31],
                Profile.list()[32],
                Profile.list()[33],
                Profile.list()[34],
                Profile.list()[35],
                Profile.list()[36]
        ])

        p.skills << php

        return p
    }

    def random = new Random()

}
