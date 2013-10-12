package api

import grails.converters.JSON
import org.bson.types.ObjectId

class PositionController {
//    def authenticationService

    def index() {
        render ' ok'
    }

    def inbox() {
        def profileId = 'dsadasds'//authenticationService.authenticatedUserId

        def result = [
                [
                        _id: new ObjectId(),
                        company: fikrimuhal,
                        requester: profileId,
                        position: [
                                requiredSkills: [
                                        [
                                                skill: new ObjectId(),
                                                importance: 0.5,
                                                minimumReq: 0.1
                                        ],
                                        new ObjectId(),           //todo
                                        new ObjectId(),
                                        new ObjectId(),
                                        new ObjectId()
                                ],
                                title: 'Senior Java developer',
                                about: 'ghd slajdslkjaskldjkjSenior Java developerSenior Java developerdjs',
                                sallary: 2500
                        ]
                ] ,
                [
                        _id: new ObjectId(),
                        company: fikrimuhal,
                        requester: profileId,
                        position: [
                                requiredSkills: [
                                        [
                                                skill: new ObjectId(),
                                                importance: 0.5,
                                                minimumReq: 0.1
                                        ],
                                        new ObjectId(),           //todo
                                        new ObjectId(),
                                        new ObjectId(),
                                        new ObjectId()
                                ],
                                title: 'Just an another position',
                                about: 'ghd slajdslkjaskldjkjdjs',
                                sallary: 3500
                        ]
                ],
                [
                        _id: new ObjectId(),
                        company: fikrimuhal,
                        requester: profileId,
                        position: [
                                requiredSkills: [
                                        [
                                                skill: new ObjectId(),
                                                importance: 0.5,
                                                minimumReq: 0.1
                                        ],
                                        new ObjectId(),           //todo
                                        new ObjectId(),
                                        new ObjectId(),
                                        new ObjectId()
                                ],
                                title: 'Another position title',
                                about: 'ghd position about holeyyyyyy',
                                sallary: 3500
                        ]
                ]
        ]

        render result as JSON
    }


    private fikrimuhal = [
            _id: new ObjectId(),
            short_name: 'Fikrimuhal',
            full_name: 'Fikrimuhal Teknoloji Ar. Ge. LTD. ŞTİ.',
            employees: [
                    new ObjectId(),
                    new ObjectId(),
                    new ObjectId(),
                    new ObjectId(),
                    new ObjectId()
            ],
            location: [
                    country: 'Turkey',
                    city: 'İstanbul',
                    district: 'Çekmeköy',
                    address: 'zind ismerkezi no:5/5',
                    zip: 06530,
                    latitude: 1.321323,
                    longitude: 12.321432432,
                    zooomLevel: 12,
            ],
            bio: 'company bio blahh',
            skills: [
                    new ObjectId(),
                    new ObjectId(),
                    new ObjectId(),
                    new ObjectId(),
                    new ObjectId()
            ],
            industry: 'Yazılım',
            tags: ['Internet', ' Startuplar', ' İnsankaynakları', ' Sosyal networkler', ' SAS'],
            email: 'info@fikrimuhal.com',
            tel: '543646363565634',
            www: 'http://www.dddd.com',
            linkedin: [
                    _id: 12331232,
                    profileUrl: 'http://dsadsads.com'
            ],
            facebook: [
                    _id: 324324324,
                    profileUrl: 'http://dsadsads.com'
            ],
            twitter: [
                    _id: 324324324,
                    profileUrl: 'http://dsadsads.com'
            ],
            foursquare: [
                    _id: 324324324,
                    profileUrl: 'http://dsadsads.com'
            ],
            perks: []


    ]


}
