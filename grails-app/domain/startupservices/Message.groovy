package startupservices

class Message {
    Profile to
    Boolean read
    Boolean notificationSent
    String content
    Profile from  //can be null for anon users
    String email
    String name
    Date sentDate
    static constraints = {
    }
}
