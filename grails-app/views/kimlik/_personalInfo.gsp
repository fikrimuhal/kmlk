<style type="text/css">

    /*#example-one { margin-bottom: 10px; }*/
[contenteditable]:hover {
    background: rgba(255, 255, 153, 1);
    outline: 3px dashed #0090D2;
    cursor: pointer;
}

    /*#example-one { margin-bottom: 10px; }*/
[contenteditable]:focus {
    background: rgb(197, 240, 255);
    outline: 3px dashed #0090D2;
    cursor: text;
}

.private {
    /*-webkit-filter: blur(3px);*/

}
</style>

<div class="row-fluid">
    <div class="span6">
        <div class="heading-buttons">

            <h4 class="glyphicons notes"><i></i>Kişisel bilgilerim</h4>

            <div class="buttons pull-right">
                <g:link action="personalInfo" params="[username: params.username]"><span ng-if="isLoggedIn()"
                                                                                       ng-cloak>düzenle</span></g:link>
            </div>
        </div>

        <table class="table table-condensed">
            <tbody>
            %{--<tr>
                <td class="right muted">Dogum Tarihi</td>
                <td class="private"><span contenteditable="true">${profile.birthDate?.format("MMM d, ''yy")}</span></td>
            </tr>
            <tr>
                <td class="right muted">Adres</td>
                <td class="private" contenteditable="true">${profile.contactInfo.address.fullAddress}</td>
            </tr>
            <tr>
                <td class="right muted">E-mail</td>
                <td class="private" contenteditable="true">${profile.contactInfo.publicEmail}</td>
            </tr>
            <tr>
                <td class="right muted">Tel</td>
                <td class="private" contenteditable="true">${profile.contactInfo.publicTel}</td>
            </tr>--}%
            <tr>
                <td class="right muted">Website</td>
                <td contenteditable="true">${profile.contactInfo.webSite}</td>
            </tr>
            <tr>
                <td class="right muted">Enson sirketim</td>
                <td contenteditable="true">${profile.workHistory?.lastEntity?.entity}</td>
            </tr>
            </tbody>
        </table>

        <div class="separator line visible-phone"></div>
    </div>

    <div class="span6">
        <h4 class="glyphicons cardio"><i></i>${profile.workHistory?.lastEntity?.position} at <a>${profile.workHistory?.lastEntity?.entity}</a>
        </h4>

        <div class="row-fluid about">
            <div class="span6">
                xxxxxx
            </div>

            <div class="span6">
                <p contenteditable="true">${profile.aboutText}</p>
            </div>
        </div>

        <!-- Twitter Section -->
        <section class="twitter">
            <div class="row-fluid">
                <div class="span12">
                    <div class="tweet">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nunc lorem, rutrum non porta. <span
                            class="label label-inverse">01/11/2012</span></div>
                </div>

                <div class="clearfix"></div>
            </div>
        </section>
        <!-- Twitter Section END -->
    </div>
</div>

<div class="separator line"></div>