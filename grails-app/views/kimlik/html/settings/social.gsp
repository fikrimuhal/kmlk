
<div class="row">
    <div class="col-sm-6">

        <oauth:connect provider="linkedin" id="linkedin-connect-link"  target="_self"
                       class="btn btn-twitter btn-block %{--${(profile?.accounts?.hasLinkedin()) ? 'disabled' : ''}--}%">
            <i class="fa fa-linkedin pull-left"></i><span>Linkedin hesabını ekle</span>
        </oauth:connect>
        %{--<oauth:connect provider="twitter" id="twitter-connect-link"--}%
                       %{--class="btn btn-icon-stacked btn-block btn-google --}%%{--${(profile?.accounts?.hasTwitter()) ? 'disabled' : ''}--}%%{--">--}%
            %{--<i class="fa fa-twitter pull-left"></i><span>Twitter hesabını ekle</span>--}%
        %{--</oauth:connect>--}%
        %{--<oauth:connect provider="google" id="google-connect-link"--}%
                       %{--class="btn btn-gplus btn-block    --}%%{--${(profile?.accounts?.hasGoogle()) ? 'disabled' : ''}--}%%{--">--}%
            %{--<i class="fa fa-google-plus pull-left"></i><span>Google hesabını ekle</span>--}%
        %{--</oauth:connect>--}%
        <oauth:connect provider="facebook" id="facebook-connect-link" target="_self"
                       class="btn btn-facebook btn-block m-b-small %{--${(profile?.accounts?.hasFacebook()) ? 'disabled' : ''}--}%">
            <i class="fa fa-facebook pull-left"></i><span>Facebook hesabını ekle</span>
        </oauth:connect>
    </div>




</div>

