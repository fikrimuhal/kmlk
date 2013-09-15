<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="kimlik"/>
</head>

<body>
<div class="separator line"></div>

<g:render template="/kimlik/followMe"></g:render>
<div class="separator line"></div>

<div class="row-fluid row-merge">

    <!-- Column -->
    <div class="span6">
        <div class="innerR">

            <oauth:connect provider="linkedin" id="linkedin-connect-link"
                           class="btn btn-icon-stacked btn-block btn-google ${(profile?.accounts?.twitter?.remoteId) ? 'disabled' : ''}">
                <i></i><span>Linkedin hesabını ekle</span>
            </oauth:connect>
            <oauth:connect provider="twitter" id="twitter-connect-link"
                           class="btn btn-icon-stacked btn-block btn-google ${(profile?.accounts?.google?.remoteId) ? 'disabled' : ''}">
                <i></i><span>Twitter hesabını ekle</span>
            </oauth:connect>
            <oauth:connect provider="google" id="google-connect-link"
                           class="btn btn-icon-stacked btn-block btn-google glyphicons google_plus ${(profile?.accounts?.linkedin?.remoteId) ? 'disabled' : ''}">
                <i></i><span>Google hesabını ekle</span>
            </oauth:connect>
            <oauth:connect provider="facebook" id="facebook-connect-link"
                           class="btn btn-icon-stacked btn-block btn-facebook glyphicons facebook ${(profile?.accounts?.facebook?.remoteId) ? 'disabled' : ''}">
                <i></i><span>Facebook hesabını ekle</span>
            </oauth:connect>

        </div>
    </div>
    <!-- // Column END -->
    <div class="span6">

    </div>
</div>
<!-- // Row END -->

</body>
</html>
