<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="kimlik"/>

</head>

<body>
<div class="separator line"></div>


<div class="heading-buttons">
    <h3 class="glyphicons settings"><i></i>Profil resmi
    </h3>
</div>

<div class="row-fluid">
    <div class="span6">
        <h4>Şuan ki profil resminiz</h4>
        <img src="${profile.profilePictureUrl}" alt=""/>
    </div>

    <div class="span6">
        <h4>Yeni Foto Yükle</h4>
        <g:uploadForm name="upload" action="upload" controller="picture" method="POST">
            <input type="file" name="file"/>
            <g:submitButton name="Yükle"/>
            <g:hiddenField name="redirectTo"
                           value="${g.createLink([controller: 'kimlik', action: 'profilePicture', params: [username: profile.username]])}"/>

        </g:uploadForm>
    </div>  %{--span 6--}%
</div> %{--row--}%

</body>
</html>
