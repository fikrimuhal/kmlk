<div class="row">
    <div class="col-lg-6">
        <h4 class="glyphicons share"><i></i>takip et <small><a href="/kimlik/${profile.username}/follow"><span ng-if="isSelfProfile()" ng-cloak>düzenle</span></a>
        </small></h4>
        <g:if test="${profile?.accounts?.hasFacebook()}">
            <a href="http://facebook.com/${profile.accounts.facebook.remoteId}"
               class="btn btn-circle btn-sm btn-facebook"><i class="icon-facebook"></i></a>
        </g:if>
        <g:if test="${profile?.accounts?.hasTwitter()}">
            <a class="btn btn-circle btn-sm btn-twitter"><i class="icon-twitter"></i></a>
        </g:if>
        <g:if test="${profile?.accounts?.hasGoogle()}">
            <button class="btn btn-circle btn-sm btn-gplus"><i class="icon-google-plus"></i></button>
        </g:if>
        <g:if test="${profile?.accounts?.hasLinkedin()}">
            <a href="http://www.linkedin.com/profile/view?id=${profile.accounts.linkedin.remoteId}" class="btn btn-circle btn-sm "><i class="icon-linkedin"></i></a>
        </g:if>

    %{--<button class="btn btn-action btn-primary btn-large glyphicons tumblr"><i></i></button>--}%

    %{----}%
    %{--<button class="btn btn-action btn-primary btn-large glyphicons dribbble"><i></i></button>--}%
    %{--<button class="btn btn-action btn-primary btn-large glyphicons deviantart"><i></i></button>--}%
    %{--<button class="btn btn-action btn-primary btn-large glyphicons picasa"><i></i></button>--}%
    </div>

    <div class="col-lg-6">
        <p class="lead">Takip ettigim ve bana ulasabiliceginiz sosyal aglar.</p>
    </div>
</div>