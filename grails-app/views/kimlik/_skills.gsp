<div class="separator line"></div>


<div class="heading-buttons">
    <h3 class="glyphicons settings"><i></i> Bilgi ve Beceriler<span><g:link action="skills"
                                                                            params="[username: params.username]"><span  ng-if="isLoggedIn()" ng-cloak>hepsini goster</span> </g:link></span>
    </h3>

    <div class="buttons pull-right">
        <g:link action="skills" params="[username: params.username]"><span  ng-if="isLoggedIn()" ng-cloak>düzenle</span></g:link>
    </div>
</div>

<div class="row-fluid">
    <div class="span6">
        <table class="table table-condensed">
            <tbody>
            <g:each in="${profile.skills.sort {it.percent?-1*it.percent:0}}">
                <tr>
                    <td class="right muted">${it.name}</td>
                    <td class="w-70">
                        <div class="progress progress-primary">
                            <div class="bar" data-width="${it.percent}%"></div>
                        </div>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="span6">

        <table class="table table-condensed">
            <tbody>

            <tr>
                <td class="right muted">Bilgi ve beceriler</td>
                <td class="w-70">
                    <g:each in="${profile.skills}">
                        <span class="label label-important">${it.name}</span>
                    </g:each>
                </td>
            </tr>

            </tbody>
        </table>
    </div>  %{--span 6--}%
</div> %{--row--}%
