<div class="separator line"></div>


<div class="heading-buttons">
    <h3 class="glyphicons settings"><i></i> Bilgi ve Beceriler<span><g:link action="skills"
                                                                params="[username: params.username]">hepsini goster</g:link></span>
    </h3>

    <div class="buttons pull-right">
        <g:link action="skills" params="[username: params.username]">düzenle</g:link>
    </div>
</div>

<div class="row-fluid">
    <div class="span6">
        <table class="table table-condensed">
            <tbody>

            <g:each in="${profile.skills}">
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
                <td class="right muted">Yeni yetenek:</td>
                <td class="w-70"><input type="text" class="input-medium"/><button style="margin-top: -9px;"
                        class="btn btn-primary btn-icon glyphicons circle_plus"><i></i>Ekle</button></td>
            </tr>
            <tr>
                <td class="right muted"></td>
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


