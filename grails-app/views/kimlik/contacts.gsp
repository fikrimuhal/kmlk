<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="kimlik"/>

</head>

<body>
<div class="separator line"></div>


<div class="heading-buttons">
    <h3 class="glyphicons settings"><i></i>Adres Defterim
    </h3>
</div>

<div class="row m-large">
    <g:each in="${profile.friends}" status="s" var="it">
        <div class="col-lg-2 col-md-3">
            &nbsp;
            <a href="${it.profileUrl}" class="thumbnail">
                <img src="${it.getProfilePictureUrl()}" title="${it.name} ${(it.registered)?'(*)':''}"/>
            </a>
        </div>
    %{--<g:if test="${s%4==3}"><div class="clearfix m-b-large visible-md"></div></g:if>--}%
    %{--<g:if test="${s%6==5}"><div class="clearfix m-b-large visible-lg"></div></g:if>--}%
    </g:each>


</div>

</body>
</html>
