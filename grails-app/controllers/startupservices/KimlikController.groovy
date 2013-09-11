package startupservices

import kimlik.account.Accounts
import kimlik.account.Address
import kimlik.account.ContactInfo
import kimlik.account.Facebook
import kimlik.account.MapCoordinates
import kimlik.account.history.GeneralisedHistory
import kimlik.account.history.HistoryEntity

class KimlikController {

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
                                        latitude: 41.233434321,
                                        longitude: 21.23131232,
                                        zoomLevel: 6
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
                birthDate: new Date(year: 1985,month: 9, date: 16)
        )
        return p
    }
}
