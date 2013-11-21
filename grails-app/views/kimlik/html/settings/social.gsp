social
<div class="row">
    <div class="col-sm-6">

        <oauth:connect provider="linkedin" id="linkedin-connect-link"
                       class="btn btn-icon-stacked btn-block btn-google %{--${(profile?.accounts?.hasLinkedin()) ? 'disabled' : ''}--}%">
            <i></i><span>Linkedin hesabını ekle</span>
        </oauth:connect>
        <oauth:connect provider="twitter" id="twitter-connect-link"
                       class="btn btn-icon-stacked btn-block btn-google %{--${(profile?.accounts?.hasTwitter()) ? 'disabled' : ''}--}%">
            <i></i><span>Twitter hesabını ekle</span>
        </oauth:connect>
        <oauth:connect provider="google" id="google-connect-link"
                       class="btn btn-icon-stacked btn-block btn-google glyphicons google_plus %{--${(profile?.accounts?.hasGoogle()) ? 'disabled' : ''}--}%">
            <i></i><span>Google hesabını ekle</span>
        </oauth:connect>
        <oauth:connect provider="facebook" id="facebook-connect-link"
                       class="btn btn-icon-stacked btn-block btn-facebook glyphicons facebook %{--${(profile?.accounts?.hasFacebook()) ? 'disabled' : ''}--}%">
            <i></i><span>Facebook hesabını ekle</span>
        </oauth:connect>
    </div>




</div>

