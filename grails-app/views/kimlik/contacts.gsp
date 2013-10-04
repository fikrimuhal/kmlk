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

<div class="row-fluid">
    <div class="span6">
        <table class="table table-condensed">
            <tbody>

            <g:each in="${profile.friends}">
                <tr>
                    <td class="right muted w-70"><img src="${it.getProfilePictureUrl()}" alt=""/></td>
                    <td class="right muted">
                        <a href="${it.profileUrl}"> ${it.name}</a>
                        ${(it.registered)?'(*)':''}
                    </td>

                </tr>
            </g:each>

            </tbody>
        </table>
    </div>

    <div class="span6">

    </div>  %{--span 6--}%
</div> %{--row--}%

</body>
</html>
