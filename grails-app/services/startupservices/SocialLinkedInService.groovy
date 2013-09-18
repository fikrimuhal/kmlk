package startupservices

import groovy.json.JsonSlurper
import kimlik.account.SocialAccount
import kimlik.account.SocialMeta
import kimlik.account.history.HistoryEntity
import org.scribe.model.Token
import uk.co.desirableobjects.oauth.scribe.OauthService

import java.text.SimpleDateFormat

class SocialLinkedInService {
    OauthService oauthService // or new OauthService() would work if you're not in a spring-managed class.
    def profileService

    def addToProfile(def profile, Token token) {
        //todo: addTo profile.accounts
        //todo: fill missing profile info with new data
        log.debug('addLinkedInToProfile to existing profile')

        def data = fetchUpStream(token)

        updateAccounts(profile, token, data)
        updateEducation(profile, data)
        updateWork(profile, data)
        updateContactInfo(profile, data)
        updateBasicInfo(profile, data)
        updateFriends(profile, data)
        updateSkills(profile, data)


    }

    private updateSkills(Profile profile, def data) {
        log.debug('updating updateSkills')
        profile.educationHistory
        data.skills.values.each {
            profileService.addSkill(profile.id, it.skill.name)
        }
    }

    private updateFriends(Profile profile, def data) {
        log.debug('updating updateFriends')
        profile
        data.connections.values.each {
            def friendsData = [
                    id: it.id,
                    first_name: it.firstName,
                    first_name: it.firstName,
                    picture_url: it.pictureUrl,
                    last_name: it.lastName
            ]
            profileService.addFriend(profile.id, friendsData, 'linkedin')
        }
    }

    private updateBasicInfo(Profile profile, def data) {
        log.debug('updating updateBasicInfo')
        profile
        println data.lastName
        println data.firstName

    }

    private updateContactInfo(Profile profile, def data) {
        log.debug('updating updateContactInfo')
        profile
        println data.emailAddress
    }

    private updateWork(Profile profile, def data) {
        log.debug('updating updateContactInfo')

        data.positions.values.each {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM");
            Date sd
            if (it.startDate?.year != null) {
                sd = formatter.parse(it.startDate?.year  + "/" + it.startDate?.month);
            }
            Date ed
            if (!it.isCurrent) {
                sd = formatter.parse(it.endDate.year + "/" + it.endDate.month);
            }

            def w = new HistoryEntity(
                    entity: it.company.name,
                    position: it.title,
                    socialMeta: new SocialMeta(source: 'linkedin', upstreamId: it.id),
                    startDate: sd,
                    endDate: ed)
            profileService.addWorkHistory(profile.id, w)
        }
    }

    private updateEducation(Profile profile, def data) {
        log.debug('updating updateEducation')
        data.educations.values.each {
            def e = new HistoryEntity(
                    entity: it.schoolName,
                    position: it.fieldOfStudy,
                    note: it.notes,
                    socialMeta: new SocialMeta(source: 'linkedin', upstreamId: it.id),

                    // startDate: new Date(month: it.startDate.month, year: it.startDate.year),
                    //endDate: (it.isCurrent) ? null: new Date(month: it.endDate.month, year: it.endDate.year)
            )
            profileService.addEducationHistory(profile.id, e)
        }
    }

    private updateAccounts(Profile profile, Token token, def data) {
        log.debug('updating updateAccounts')
        //todo EGER, SISTEME BASKA BIRISI BU KISININ BU ACCOUNT UNU EKLEMIS ISE:
        //TODO          BUTUN PROFILLERI ACCCOUNT.LINKEDIN.UPSTREAMID YE GORE ARA (REGISTERED:FALSE OLANLAR DA) (KENDIMIZI SILMEYELIM)
        //TODO              (EGER BIR KAYIT BULURSAN)
        //TODO                  BULUNAN KAYDIN SIL
        //TODO                  BULUNAN KAYDIN ID SINI BUTUN PROFIL.FRIENDS DE ARAT
        //TODO                      BULUNAN KAYITLARI YENI ASAGIDA OLUSTURDUGUN ID ILE DEGISTIR

        profile.accounts.linkedin = new SocialAccount(
                remoteId: data.id,
                first_name: data.firstName,
                last_name: data.lastName,
                token: token.token,
                token_secret: token.secret
        ).save()


    }

    private fetchUpStream(Token token) {

        def apiUrl = "http://api.linkedin.com/v1/people/~"
        def fields = [
                'email-address',  //email
                'id',
                'first-name',
                'last-name',
                'public-profile-url',
                'headline',
                'summary',
                'formatted-name',
                'formatted-phonetic-name',
                'industry',
                'num-connections',
                'specialties',
                'positions',
                'picture-url',
                'last-modified-timestamp', //full
                'languages',
                'skills',
                'certifications',
                'educations',
                'following',
                'recommendations-received',
                'date-of-birth',
                'phone-numbers',   //r_contactinfo
                'connections:(picture-url,first-name,last-name,id,skills,educations,positions,date-of-birth)',
        ]
        def requestUrl = apiUrl + ':(' + fields.join(',') + ')?format=json'
        org.scribe.model.Response result = oauthService.getLinkedInResource(token, requestUrl)
//        println result.body
        return new JsonSlurper().parseText(result.body)
    }
}
