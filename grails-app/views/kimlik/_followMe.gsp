<%@ page import="grails.converters.JSON" %>
<h3 class="font-thin"><i class="fa fa-share"></i>Takip et <small>Bana ulasabiliceğiniz sosyal ağlar.</small></h3>

<div class="separator line"></div>

<br/>

<div class="row">
    <div class="col-lg-6">
        <g:if test="${profile?.accounts?.hasFacebook()}">
            <a href="http://facebook.com/${profile.accounts.facebook.remoteId}"
               class="btn btn-circle btn-sm btn-facebook"><i class="fa fa-facebook"></i></a>
        </g:if>
        <g:if test="${profile?.accounts?.hasTwitter()}">
            <a class="btn btn-circle btn-sm btn-twitter"><i class="fa fa-twitter"></i></a>
        </g:if>
        <g:if test="${profile?.accounts?.hasGoogle()}">
            <button class="btn btn-circle btn-sm btn-gplus"><i class="fa fa-google-plus"></i></button>
        </g:if>
        <g:if test="${profile?.accounts?.hasLinkedin()}">
            <a href="http://www.linkedin.com/profile/view?id=${profile.accounts.linkedin.remoteId}"
               class="btn btn-circle btn-sm "><i class="fa fa-linkedin"></i></a>
        </g:if>

    %{--<button class="btn btn-action btn-primary btn-large glyphicons tumblr"><i></i></button>--}%

    %{----}%
    %{--<button class="btn btn-action btn-primary btn-large glyphicons dribbble"><i></i></button>--}%
    %{--<button class="btn btn-action btn-primary btn-large glyphicons deviantart"><i></i></button>--}%
    %{--<button class="btn btn-action btn-primary btn-large glyphicons picasa"><i></i></button>--}%
    </div>

    <div class="col-lg-6">
        %{--<p class="lead">Takip ettigim ve bana ulasabiliceginiz sosyal aglar.</p>--}%
        <blockquote class="pull-right">
            <p>${profile.aboutText}</p>
            %{--<small>${profile.name}</small>--}%
        </blockquote>
    </div>
</div>
<br/>

