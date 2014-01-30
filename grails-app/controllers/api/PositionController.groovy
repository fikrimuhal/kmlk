package api

import grails.converters.JSON
import org.bson.types.ObjectId

class PositionController {
//    def authenticationService
    def companyService

    def index() {
        render ' ok'
    }

    /**
     * @Deprecated
     * @return
     */
    def inbox() {
        cache("private_nostore")
        def profileId = 'dsadasds'//authenticationService.authenticatedUserId

        def result = [
                [
                        _id: new ObjectId(),
                        company: companyService.getCompany(/*TODO*/new ObjectId('5284d3dfef86d6dccf7161a0')),
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
                ],
                [
                        _id: new ObjectId(),
                        company: companyService.getCompany(/*TODO*/new ObjectId('5284d3dfef86d6dccf71619f')),
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
                        company: companyService.getCompany(/*TODO*/new ObjectId('5284d3dfef86d6dccf71619f')),
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


}
